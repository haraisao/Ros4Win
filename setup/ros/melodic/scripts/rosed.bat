@echo off
setlocal
if "%1" == "--help" (
   goto :usage
)

if "%EDITOR%" == "" (
    set EDITOR=code
)

setlocal enabledelayedexpansion
set PKG_NAME=%1
set FILE_NAME=%2

FOR /F %%i in ('ros_location_find.bat %PKG_NAME%') do set PKG_SHARE_DIR=%%i
if "y%PKG_SHARE_DIR%" == "yError" (
   goto :END
) 

set FILE_NAME_ABS=%PKG_SHARE_DIR%\%FILE_NAME:/=\%

%EDITOR%  %FILE_NAME_ABS%

goto :END

:ERROR
   @echo ERROR: No such package/stack '%PKG_NAME%'
   goto :END

:usage
   @echo usage: rosed package_name filename

:END
endlocal
@echo on
@exit /b

:replace
    @set %1=!%1:%2=!
    @exit /b

:get_pkg
   for %%a in ( %1 ) do (
    set PKG_NAME=%%a
    exit /b
   )
