# wsjtx-mac-howto

Simple script to configure macOS kernel parameters for WSJT-X (Apple Silicon and Intel).

WSJT-X requires increased shared memory limits on macOS. This script sets them temporarily — run it after each reboot before launching WSJT-X.

## Documentation

- **English**: [HOWTO-EN.md](HOWTO-EN.md)
- **Slovensky**: [HOWTO-SK.md](HOWTO-SK.md)

## Quick Start

```bash
# Download
curl -L https://raw.githubusercontent.com/tomasgeci/wsjtx-mac-howto/main/wsjtx.sh -o ~/wsjtx.sh

# Make executable
chmod +x ~/wsjtx.sh

# Run (after each reboot, before WSJT-X)
~/wsjtx.sh
```

## Files

- `wsjtx.sh` — Kernel parameter setup script
- `HOWTO-EN.md` — Step-by-step guide (English)
- `HOWTO-SK.md` — Návod krok za krokom (Slovak)

## What it does

Sets these kernel parameters:
- `kern.sysv.shmmax=52428800`
- `kern.sysv.shmmin=1`
- `kern.sysv.shmmni=128`
- `kern.sysv.shmseg=32`
- `kern.sysv.shmall=12800`

Settings are temporary and reset after reboot (by design).
