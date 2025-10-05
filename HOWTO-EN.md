# HOWTO: Setup macOS for WSJT-X (Apple Silicon)

This guide shows how to configure macOS kernel parameters required for WSJT-X to run without "Unable to create shared memory segment" errors.

## What does this do?

WSJT-X requires increased shared memory limits on macOS. This script sets the correct kernel parameters temporarily. You'll need to run it after each reboot before using WSJT-X.

## Prerequisites

- macOS (any recent version)
- Apple Silicon Mac (M1, M2, M3, etc.) or Intel Mac
- Administrator access (you'll need your password)
- WSJT-X installed (download from https://sourceforge.net/projects/wsjt/files/)

## Step 1: Download the script

**Method A — Terminal**:

```bash
curl -L https://raw.githubusercontent.com/tomasgeci/wsjtx-mac-howto/main/wsjtx.sh -o ~/wsjtx.sh
```

**Method B — Browser**:

1. Go to: `https://github.com/tomasgeci/wsjtx-mac-howto`
2. Click `wsjtx.sh` → `Raw`
3. Right-click → Save As → save as `wsjtx.sh` in your Home folder

## Step 2: Make it executable

Open Terminal and run:

```bash
chmod +x ~/wsjtx.sh
```

## Step 3: Run the script (after each reboot)

```bash
~/wsjtx.sh
```

The script will:
- Show current kernel parameter values
- Set the required parameters for WSJT-X
- Ask for your administrator password (this is normal)

You should see output like:
```
kern.sysv.shmmax: 4194304 -> 52428800
kern.sysv.shmmin: 1 -> 1
kern.sysv.shmmni: 32 -> 128
...
```

## Step 4: Launch WSJT-X

Now you can open WSJT-X normally from Applications.

## Regular usage workflow

**Every time you restart your Mac:**

1. Open Terminal
2. Run: `~/wsjtx.sh`
3. Enter your password when prompted
4. Launch WSJT-X

## Troubleshooting

**"Unable to create shared memory segment" error:**
- Make sure you ran the script before launching WSJT-X
- Verify with: `sysctl kern.sysv.shmmax` (should show `52428800`)
- If not, re-run the script

**Script asks for password:**
- This is normal — kernel parameter changes require administrator access

**Do I need to run this every time?**
- Yes, after each reboot. The settings are temporary and don't persist.
- This is intentional for simplicity and safety.

## Notes

- Settings reset after reboot (by design)
- Safe to run multiple times
- No system files are modified
- Only affects current session
