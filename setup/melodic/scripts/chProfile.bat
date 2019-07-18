@echo off
setlocal

set CMD_NAME=%1
set BATFILE_NAME=%ROS_HOME%etc\catkin\profile.d\%CMD_NAME%.bat


if "%1" == "" goto :error
if not exist %BATFILE_NAME% goto :error
 
sed -i -e "s/[CDEFGHIJK]:\//%~d0\//g" %BATFILE_NAME%

echo reset %CMD_NAME%
goto :end

:error
echo Usage: %0 [script_name] (%BATFILE_NAME%)

:end
@echo on
