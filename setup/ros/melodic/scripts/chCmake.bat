@echo off
setlocal

set PKG_NAME=%1
set CMAKE_NAME=%ROS_HOME%CMake\%PKG_NAME%-config.cmake


if "%1" == "" goto :error
if not exist %CMAKE_NAME% goto :error
 
sed -i -e "s/[A-Z]:\//%~d0\//g" %CMAKE_NAME%

echo reset %PKG_NAME%
goto :end

:error
echo Usage: %0 [script_name] (%CMAKE_NAME%)

:end
@echo on
