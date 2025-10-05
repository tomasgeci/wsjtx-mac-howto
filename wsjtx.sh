#!/bin/zsh
set -euo pipefail

# WSJT-X Kernel Parameter Setup Script for macOS (Apple Silicon)
# Run this script after each reboot, before launching WSJT-X

echo "=========================================="
echo "WSJT-X macOS Kernel Parameter Setup"
echo "=========================================="
echo ""

# Check current values
echo "[info] Current shared memory settings:"
sysctl kern.sysv.shmmax kern.sysv.shmmin kern.sysv.shmmni kern.sysv.shmseg kern.sysv.shmall 2>/dev/null || true
echo ""

# Set required parameters
echo "[info] Setting kernel parameters (requires password)..."
echo ""

sudo sysctl -w kern.sysv.shmmax=104857600
sudo sysctl -w kern.sysv.shmall=25600

echo ""
echo "[ok] Kernel parameters configured successfully!"
echo ""
echo "=========================================="
echo "You can now launch WSJT-X"
echo "=========================================="
echo ""
echo "Verify settings:"
echo "  sysctl kern.sysv.shmmax"
echo ""
echo "Note: These settings are temporary and will"
echo "reset after reboot. Run this script again"
echo "after each restart before using WSJT-X."
echo ""
