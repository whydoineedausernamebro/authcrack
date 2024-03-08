@echo off

:: github.com/whydoineedausernamebro/authcrack

title Auth Crack
color 04
chcp 65001 >nul
mode 150, 100
echo.
echo.
echo.
echo                                      [2;31m╔══════════════════════════════════════════════════╗                                                  
echo                                      [2;31m║[2;91m▄▄▄· ▄• ▄▌▄▄▄▄▄ ▄ .▄     [2;96m▄▄· ▄▄▄   ▄▄▄·  ▄▄· ▄ •▄ [2;31m║
echo                                      [2;31m║[2;91m▐█ ▀█ █▪██▌•██  ██▪▐█    [2;96m▐█ ▌▪▀▄ █·▐█ ▀█ ▐█ ▌▪█▌▄ [2;31m║
echo                                      [2;31m║[2;91m▄█▀▀█ █▌▐█▌ ▐█.▪██▀▐█    [2;96m██ ▄▄▐▀▀▄ ▄█▀▀█ ██ ▄▄▐▀▀▄[2;31m║
echo                                      [2;31m║[2;91m▐█ ▪▐▌▐█▄█▌ ▐█▌·██▌▐▀    [2;96m▐███▌▐█•█▌▐█ ▪▐▌▐███▌▐█.█[2;31m║
echo                                      [2;31m║[2;91m ▀  ▀  ▀▀▀  ▀▀▀ ▀▀▀ ·    [2;96m▀▀▀ .▀  ▀ ▀  ▀ ·▀▀▀ ·▀   [2;31m║
echo                                      [2;31m╚══════════════════════════════════════════════════╝                                         
echo                                                          Generates 100 codes per second.
echo i am not gonna use the universal dev excuse, this was made to crack into other people's accounts.           
echo.
echo.
echo.
echo [2;96m║
echo [2;96m║
setlocal EnableDelayedExpansion
set /p count="[2;96m╚══════>> Select number of 2FA codes you want to see. might take some time. "
echo.

if "!count!" lss "1" (
    echo Invalid input. Please enter a number greater than 0.
    goto :eof
)

set /p excludeFile="╚══════>>Enter the filename containing codes to exclude: "

if not exist "!excludeFile!" (
    echo The file !excludeFile! does not exist.
    goto :eof
)

set i=0
for /F "tokens=*" %%a in ('type "!excludeFile!"') do (
    set /A i+=1
    set "exclude[!i!]=%%a"
)

for /L %%i in (1,1,%count%) do (
    :generateNumber
    set "number="

    set /a "digit=!random! %% 9 + 1"
    set "number=!digit!"

    for /L %%j in (1,1,5) do (
        set /a "digit=!random! %% 10"
        set "number=!number!!digit!"
    )

    set "isExcluded=false"
    for /L %%x in (1,1,!i!) do (
        if "!number!"=="!exclude[%%x]!" set "isExcluded=true"
    )

    if "!isExcluded!"=="true" goto generateNumber
    echo 2FA code %%i: !number!
)

pause > nul
