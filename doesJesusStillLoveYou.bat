@echo off
setlocal enabledelayedexpansion

:: Limit how many windows can spawn
set MAX_WINDOWS=5

:: Read window count from argument, default 1
set COUNT=%1
if "%COUNT%"=="" set COUNT=1

echo yes
ping -n 2 127.0.0.1 >nul

:: Spawn next window if not exceeding limit
if %COUNT% LSS %MAX_WINDOWS% (
    set /a NEXT=%COUNT%+1
    start "" cmd /c "%~f0 %NEXT%"
)

:: Loop printing "yes" forever in this window
:loop
echo yes
ping -n 1 127.0.0.1 >nul
goto loop