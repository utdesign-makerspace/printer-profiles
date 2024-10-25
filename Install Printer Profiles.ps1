# Download and install PrusaSlicer printer profiles
wget https://github.com/democat3457/PrusaProfiles/raw/refs/heads/main/config.zip -OutFile config.zip
Expand-Archive -Force config.zip -DestinationPath $env:APPDATA\PrusaSlicer\printer
rm config.zip

# Download and update BambuSlicer printer access codes
$ConfPath = "$($env:APPDATA)\BambuStudio\BambuStudio.conf"
$CodePath = 'codes.txt'
wget https://github.com/democat3457/PrusaProfiles/raw/refs/heads/main/bambu/codes.txt -OutFile $CodePath
(Get-Content $ConfPath -Raw).replace("}`r`n}", "}$((Get-Content $CodePath -Raw))`r`n}") | Set-Content $ConfPath
rm $CodePath
