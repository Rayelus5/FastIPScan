@echo off
setlocal enabledelayedexpansion

set nameApp=FastIPScan
set versionApp=v1.0
set autorApp=Rayelus
set navbar=%nameApp% %versionApp% - by %autorApp%


echo.
echo %navbar%
echo ----------------------------
echo [+] Iniciar
pause>nul

:startup
goto main

:main
echo [i] Buscando IP...
timeout>nul /nobreak 1
echo [+] Console command: ipconfig
echo [+] Searching Network IP...
timeout>nul /nobreak 1
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
echo [-] Network IP: %NetworkIP%
timeout>nul /nobreak 1
echo [+] Searching Public IP...
for /f %%a in ('powershell Invoke-RestMethod api.ipify.org') do set PublicIP=%%a
echo [-] Public IP: %PublicIP%  
timeout>nul /nobreak 1
echo -----------------------------------------------
echo [i] Info Address
echo.
echo NetworkIP...................%NetworkIP%
echo PublicIP....................%PublicIP%
echo.
echo -----------------------------------------------
BREAK