@echo off
setlocal

if "%1" == "--help" goto :usage
if "y%1" == "y" goto :usage
if "y%2" == "y" goto :usage
if "y%3" == "y" goto :usage
if not "y%4" == "y" goto :usage


for /F %%i in ('ros_location_find.bat %1') do set PKG_DIR=%%i

if "y%PKG_DIR%" == "yError" goto :notfound

set S_FILE=%2
set T_FILE=%3

xcopy /I %PKG_DIR:/=\%\%S_FILE:/=\% %T_FILE:/=\%

goto :end

:notfound
  echo ERROR: No such package/stack '%1'
  goto :end

:usage
  echo usage: roscp package filename target
  echo Copy a file from a package to target location
:end
endlocal
@echo on