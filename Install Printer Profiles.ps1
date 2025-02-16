# see https://stackoverflow.com/a/28237896
Function pause ($message)
{
    # Check if running Powershell ISE
    if ($psISE)
    {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show("$message")
    }
    else
    {
        Write-Host "$message" -BackgroundColor Yellow -ForegroundColor Black
        $x = $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}

# Download and install PrusaSlicer printer profiles
$ZipPath = "$($env:APPDATA)\PrusaSlicer\config.zip"
Write-Output "Downloading and installing PrusaSlicer profiles..."
wget https://github.com/democat3457/PrusaProfiles/raw/refs/heads/main/config.zip -OutFile $ZipPath
Expand-Archive -Force $ZipPath -DestinationPath $env:APPDATA\PrusaSlicer\printer
rm $ZipPath
Write-Output "PrusaSlicer profile installation complete!"

# Check if Bambu Studio has started
Write-Output "Downloading and installing Bambu Studio printer information..."
if (!(Test-Path "$($env:APPDATA)\BambuStudio" -PathType Container)) {
    Write-Host "Bambu Studio config folder not found! This script will open Bambu Studio to generate the config folder, then automatically close it and continue with the script."
    pause "Press any key to continue..."
    Start-Process -NoNewWindow -FilePath 'C:\Program Files\Bambu Studio\bambu-studio.exe'
    Start-Sleep -Seconds 12
    Stop-Process -Name "bambu-studio"
}

# Download and update Bambu Studio printer access codes
$ConfPath = "$($env:APPDATA)\BambuStudio\BambuStudio.conf"
$CodePath = "$($env:APPDATA)\BambuStudio\codes.txt"
wget https://github.com/democat3457/PrusaProfiles/raw/refs/heads/main/bambu/codes.txt -OutFile $CodePath
if (Test-Path $ConfPath -PathType Leaf) {
    (Get-Content $ConfPath -Raw).replace("}`r`n}", "},`r`n$((Get-Content $CodePath -Raw))`r`n}") | Set-Content $ConfPath
    Write-Output "Bambu Studio printer installation complete!"
}
else {
    # Should never happen
    #New-Item $ConfPath -ItemType File -Force -Value "{`r`n$((Get-Content $CodePath -Raw))`r`n}"
    Write-Host "Bambu Studio config folder failed to generate! Open Bambu Studio, go through the setup wizard, close the window afterwards, and re-run the script." -BackgroundColor Black -ForegroundColor Red
}
rm $CodePath
pause "Press any key to close..."
