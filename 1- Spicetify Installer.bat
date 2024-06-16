@echo off
echo Running Spicetify installation...
powershell -Command "iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex"
echo Spicetify installation complete.
pause
