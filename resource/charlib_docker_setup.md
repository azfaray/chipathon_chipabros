> [!IMPORTANT]
> > **Last Updated: 13 August 2025**
> >
> > This guide explains how to install and run **CharLib** inside the **IIC‑OSIC‑Tools** Docker image using an ngspice **shared** build and a self‑healing launcher script.

---

# CharLib Setup & Usage — IIC‑OSIC‑Tools Docker

**Scope:** Quick, reliable setup to run **CharLib** inside a running IIC‑OSIC‑Tools container (e.g., `hpretl/iic-osic-tools:chipathon`).  
**Audience:** Chipathon 2025 participants and anyone characterizing standard cells with CharLib.

---

## 1) Legend & Conventions

- **HOST** = Your machine’s terminal (PowerShell on Windows, Terminal on macOS/Linux).  
- **CONTAINER** = A shell **inside** the running Docker container.  
- Code blocks are copy‑paste ready. Replace placeholders like `<container_id>` and `<your_charlib_job_folder>` with your values.

---

## 2) Prerequisites

- Docker Desktop installed and **running**.  
- IIC‑OSIC‑Tools image available (e.g., `hpretl/iic-osic-tools:chipathon`).  
- Stable internet connection.

---

## 3) Start/Enter the Container

You can start it from **Docker Desktop** (Images → Run or Containers → Start). Then enter the container **as root** from the HOST:

**HOST — enter container as root**
```bash
docker exec -it -u 0 <container_id> bash
```

> Tip: Copy the container ID from Docker Desktop → **Containers** tab → Copy ID icon.

---

## 4) Build & Install ngspice (shared)

Use the **GitHub mirror** with `--depth=1` for a faster clone. Run this on HOST as root:

```bash
apt-get update
apt-get install -y git build-essential autoconf automake libtool pkg-config     bison flex libx11-dev libreadline-dev

cd /tmp
git clone --depth=1 https://github.com/imr/ngspice.git
cd ngspice
./autogen.sh
mkdir build && cd build
../configure --with-ngshared --enable-xspice --enable-cider --disable-debug
make -j"$(nproc)"
make install
ldconfig

# verify
ls -l /usr/local/lib/libngspice.so*
```

---

## 5) Create the Self‑Healing CharLib Launcher

This launcher:
- creates/uses an isolated **venv**,
- installs **CharLib** (and a compatible PySpice fork),
- exports ngspice **shared** env vars,
- runs `charlib` with pass‑through args.

**Run this on HOST as root**
```bash
cat > ~/run_charlib.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

# keep venv isolated from global site-packages/PYTHONPATH
unset PYTHONPATH
export PYTHONNOUSERSITE=1

VENV="$HOME/.venvs/charlib"
PY="$VENV/bin/python"
PIP="$VENV/bin/pip"
CHARLIB="$VENV/bin/charlib"

# create venv if missing
if [ ! -x "$PY" ]; then
  python3 -m venv "$VENV"
fi
source "$VENV/bin/activate"

# install charlib if missing (pulls correct PySpice fork)
if ! "$PY" -c "import importlib; importlib.import_module('charlib')" >/dev/null 2>&1; then
  "$PIP" install --upgrade pip
  "$PIP" install --no-cache-dir "git+https://github.com/stineje/CharLib"
fi

# ngspice shared env
export NGSPICE_LIBRARY_PATH="${NGSPICE_LIBRARY_PATH:-/usr/local/lib/libngspice.so}"
export LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH:-}"
export PYSPICE_SIMULATOR="${PYSPICE_SIMULATOR:-ngspice-shared}"
# keep enabled if your setup requires it; safe default
export LD_PRELOAD="${LD_PRELOAD:-/usr/local/lib/libngspice.so}"

# quick sanity
"$PY" - <<'PY'
import PySpice, inspect
from PySpice.Spice.NgSpice.Shared import NgSpiceShared
print("PySpice:", getattr(PySpice, "__version__", "unknown"))
print("PySpice path:", inspect.getfile(PySpice))
NgSpiceShared(); print("ngspice shared OK")
PY

# execute charlib with passthrough args
exec "$CHARLIB" "$@"
EOF
chmod +x ~/run_charlib.sh
```

---

## 6) Run CharLib

**Help**
```bash
~/run_charlib.sh --help
```

**Run a job** (replace with your mounted project folder):
```bash
~/run_charlib.sh run /foss/designs/<your_charlib_job_folder>
```

---

## 7) Daily Workflow (After Reboot)

1. Open Docker Desktop → **Containers** → **Start** your container.  
2. **HOST:** copy the container ID, then:
   ```bash
   docker exec -it -u 0 <container_id> bash
   ```
3. Run CharLib:
   ```bash
   ~/run_charlib.sh run /foss/designs/<your_charlib_job_folder>
   ```

---

## 8) Troubleshooting

- **Very slow git clone (SourceForge):** Use the GitHub mirror with `--depth=1` (as above).  
- **PySpice version mismatch (e.g., ImportError):** The launcher isolates a venv, unsets `PYTHONPATH`, and installs the compatible fork automatically.  
- **ngspice shared errors** (e.g., `undefined symbol: ngSpice_Init`): Keep `LD_PRELOAD=/usr/local/lib/libngspice.so` enabled in the launcher.  

---
