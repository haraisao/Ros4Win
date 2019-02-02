@echo off
setlocal

set SCR_NAME=%PYTHON_DIR%\Scripts\%1
if "%PYTHON_DIR%" == "" goto :error 

if "%1" == "" goto :error
if not exist %SCR_NAME% goto :error

sed  -i -e "1 s/#!.*/#!%PYTHON_DIR:\=\\%\\python.exe/" %SCR_NAME%

@echo %SCR_NAME%

goto :end

:error
echo Usage: %0 [script_name] (%SCR_NAME%)
exit /b 1
:end
@echo on
exit /b 0