# UTDesign Makerspace Printer Presets

Presets for the UTDesign Makerspace's 3D printer array. Includes presets for PrusaSlicer and Bambu Studio.

## Files

- `bambu/codes.txt` contains the json snippet added to end of the BambuStudio.conf file in the user's `%APPDATA%\BambuStudio`.
- `config/` contains the files that will get loaded into the user's `%APPDATA%\PrusaSlicer\printer`.
- `config.zip` is the archive that the script will download from GitHub containing the printer config files.
- `makezip.sh` creates the `config.zip` file in the root directory.
- `Install Printer Profiles.ps1` is the script that will be run upon double-clicking the desktop shortcut.

## System Configuration

1. Download the ps1 script and move it to the `C:\ProgramData\Makerspace` system folder.
2. Create a shortcut to the ps1 script and move the shortcut to the Desktop.
3. Edit the shortcut target to prepend the ps1 path to become `powershell.exe -ExecutionPolicy Bypass -File "ps1 path"` and clear the "Start in" field.
4. Rename the shortcut so its name is just "Install Printer Profiles" and move the shortcut to `C:\Users\Public\Public Desktop`.
