@echo off
setlocal

set CMAKE_NAME=%1
set CMAKE_FILE_NAME=%~n1

if "%1" == "" goto :error
if not exist %CMAKE_NAME% goto :error
 
sed -i -e "s/[CDEFGHIJK]:\//%~d0\//g" %CMAKE_NAME%
echo reset %CMAKE_FILE_NAME%
goto :end

:error
echo Skip  (%CMAKE_FILE_NAME%)

:end
@echo on
