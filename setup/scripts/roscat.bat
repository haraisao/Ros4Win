@echo off

setlocal
if "%1" == "--help" (
   goto :usage
) else (
    if "y%2" == "y" goto :usage
)

set PKG_NAME=%1
set FILE_NAME=%2

FOR /F %%i in ('ros_location_find.bat %PKG_NAME%') do set PKG_SHARE_DIR=%%i
if "y%PKG_SHARE_DIR%" == "yError" (
   goto :END
) 

type %PKG_SHARE_DIR:/=\%\%FILE_NAME:/=\% 
goto :END

:ERROR
   @echo ERROR: No such package/stack '%PKG_NAME%'
   goto :END

:usage
   @echo usage: roscat [package] [file]
   @echo Display a file content within a package.

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

