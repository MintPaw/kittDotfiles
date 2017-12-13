@echo off

set toolsPath=D:\tools
set binPath=%toolsPath%\bin
set msysHomePath=C:\tools\msys64\home\Amaranta

cmd /c dummyPathCheck.bat
cls
REM The cls doesn't modify errorlevel for some reason
if errorlevel 0 goto skipPath

echo Putting %binPath% on path...
mkdir %toolsPath%
setx PATH "%binPath%;%path%;"

echo Linking files bin...
mklink /d "%binPath%" "%~dp0bin"

:skipPath
rem rd "%appdata%\Sublime Text 3\Packages" /s /q
rem mklink /d "%appdata%\Sublime Text 3\Packages" "%~dp0Packages"
del %msysHomePath%\.zshrc /f
del %msysHomePath%\.bashrc /f
del %msysHomePath%\.gitconfig /f
mklink "%msysHomePath%/.zshrc" "%~dp0.zshrc"
mklink "%msysHomePath%/.bashrc" "%~dp0.bashrc"
mklink "%msysHomePath%/.gitconfig" "%~dp0.gitconfig"
pause