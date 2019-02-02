@echo off
setlocal

@rem set SCR_NAME=%PYTHON_DIR%\Scripts\%1
set SCR_NAME=%1

if "%PYTHON_DIR%" == "" goto :error 

if "%1" == "" goto :error
if not exist %SCR_NAME% goto :error

%~dp0..\setup\scripts\sed  -i -e "1 s/#!.*/#!%PYTHON_DIR:\=\\%\\python.exe/" %SCR_NAME%

@echo %SCR_NAME%

goto :end

:error
echo Usage: %0 [script_name] (%SCR_NAME%)
@echo on
@exit /b 1
:end
@echo on
@exit /b 0
