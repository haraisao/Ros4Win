@echo off
setlocal

set PKG_NAME=%1
set CMAKE_NAME=%ROS_HOME%share\%PKG_NAME%\cmake\%PKG_NAME%Config.cmake


if "%1" == "" goto :error
if not exist %CMAKE_NAME% goto :error
 
sed -i -e "s/[CDEFGHIJK]:\//%~d0\//g" %CMAKE_NAME%
echo reset %PKG_NAME%
goto :end

:error
echo Skip  (%PKG_NAME%)

:end
@echo on
