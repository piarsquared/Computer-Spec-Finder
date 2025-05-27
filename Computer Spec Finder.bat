@echo off
setlocal

echo          _         
echo    ___  (_)__ _____
echo   / _ \/ / _ `/ __/
echo  / ___/_/\___/_/   
echo /_/    
echo Press any button to start!

pause

:: chances are if you're looking inside of the source code for something interesting, you're not gonna find it. this shit is ass.
set "output=SystemInfo.txt"

if exist "%output%" del "%output%"

echo Gathering system information...
echo Collected system information.

echo === System Information === >> "%output%"
systeminfo >> "%output%"

echo. >> "%output%"
echo === CPU Information === >> "%output%"
wmic cpu get name, maxclockspeed, currentclockspeed /format:list >> "%output%"
echo Collected CPU information!

echo. >> "%output%"
echo === GPU Information === >> "%output%"
wmic path win32_VideoController get name /format:list >> "%output%"
echo Collected GPU information.

echo. >> "%output%"
echo === Installed RAM === >> "%output%"
wmic memorychip get capacity, speed /format:list >> "%output%"
echo Collected RAM information.

echo. >> "%output%"
echo === Disk Drives === >> "%output%"
wmic diskdrive get model, size /format:list >> "%output%"
echo Collected disk drive information.

echo. >> "%output%"
echo === Network Adapters === >> "%output%"
wmic nic where "NetEnabled='true'" get Name, Speed /format:list >> "%output%"
echo Collected network adapter information.


echo.
echo Done. System information saved to %output%.
pause
endlocal
