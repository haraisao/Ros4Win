@echo off
setlocal

set SCR_NAME=%ROS_HOME%bin\%1-script.py


if "%1" == "" goto :error
if exist %SCR_NAME% goto :do_cmd

set SCR_NAME=%PYTHON_DIR%\Scripts\%1-script.py
if not exist %SCR_NAME% goto :error

:do_cmd
sed -i -e "1 s/#!.:/#!%~d0/" %SCR_NAME%

@echo %SCR_NAME%

goto :end

:error
echo Usage: %0 [script_name] (%SCR_NAME%)

:end
@echo on
