@echo off
cd /d "%~dp0"
echo Downloading latest version...
curl -L -o update.zip "https://github.com/injuriez/MangoGuards/archive/refs/heads/main.zip"
echo Extracting...
powershell -Command "Expand-Archive -Force 'update.zip' '.'"
echo Moving files...
move /Y "MangoGuards-main\*" "."
rd /S /Q "MangoGuards-main"
del update.zip
echo Update complete!
pause
