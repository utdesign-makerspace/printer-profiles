# UTDesign Makerspace PrusaSlicer Printer Presets

Presets for the UTDesign Makerspace's 3D Printer array for the PrusaSlicer software.

## Files

- `config/` contains the files that will get loaded into the user's APPDATA.
- `config.zip` is the archive that the script will download from GitHub containing the printer config files.
- `Install Printer Profiles.ps1` is the script that will be run upon double-clicking the desktop shortcut. The file should be located in the `C:\ProgramData\Makerspace` system folder.
- `makezip.sh` creates the `config.zip` file in the root directory.

## Additional Configuration

Create a shortcut to the ps1 script and move the shortcut to the Desktop. Edit the shortcut target to prepend the ps1 path to become `powershell.exe -ExecutionPolicy Bypass -File "ps1 path"` and clear the "Start in" field. Rename the shortcut so its name is just "Install Printer Profiles", and then move the shortcut to `C:\Users\Public\Public Desktop`.
