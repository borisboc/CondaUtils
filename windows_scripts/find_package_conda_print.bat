@echo off
setlocal
set package=%1

rem Check if a package name is provided, otherwise exit
if "%package%"=="" (
    echo Please provide a package name as an argument.
    exit /b
)

rem Loop through each environment
for /F "tokens=1" %%E in ('conda env list ^| findstr /V "^#"') do (
    set "printedEnvName="
    rem Find matches for the package in the environment
    for /F "delims=" %%P in ('conda list -n %%E ^| findstr %package%') do (
        if not defined printedEnvName (
            echo Packages for environment: %%E
            set "printedEnvName=1"
        )
        echo %%P
    )
    if defined printedEnvName echo.
)

endlocal
