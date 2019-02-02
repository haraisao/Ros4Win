@echo off
setlocal

set SCR_NAME=%ROS_HOME%%1


if "%1" == "" goto :error
if not exist %SCR_NAME% goto :error


sed  -e "s/[CDEFGGH]:\\/%~d0\\/g" %SCR_NAME%

@echo %SCR_NAME%

goto :end

:error
echo Usage: %0 [script_name] (%SCR_NAME%)

:end
@echo on
