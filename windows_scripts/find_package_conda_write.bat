@echo off
setlocal
set package=%1

rem Check if a package name is provided, otherwise exit
if "%package%"=="" (
    echo Please provide a package name as an argument.
    exit /b
)

rem Define the output file
set outputFile=allEnvironments.txt

rem Clear the output file if it exists
if exist %outputFile% del %outputFile%

rem Loop through each environment and append package list to the output file
for /F "tokens=1" %%E in ('conda env list ^| findstr /V "^#"') do (
    echo Packages for environment: %%E >> %outputFile%
    conda list -n %%E | findstr %package% >> %outputFile%
    echo. >> %outputFile%
)

endlocal
echo Completed. Environment packages saved in file allEnvironments.txt.
