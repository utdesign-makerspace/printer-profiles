wget https://github.com/democat3457/PrusaProfiles/raw/refs/heads/main/config.zip -OutFile config.zip
Expand-Archive -Force config.zip -DestinationPath $env:APPDATA\PrusaSlicer\printer
rm config.zip

