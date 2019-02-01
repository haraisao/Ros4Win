@echo off
setlocal
if "%1" == "--help" (
   goto :usage
)

set PKG_NAME_ALL=%1
shift

set ARGS=
:ARG_PARSE
   set ARGS=%ARGS% %~1
   shift
if not "%~1" == "" goto :ARG_PARSE

setlocal enabledelayedexpansion
set PKG_NAME=
call :get_pkg %PKG_NAME_ALL:/= %
call :replace PKG_NAME_ALL %PKG_NAME%

FOR /F %%i in ('ros_location_find.bat %PKG_NAME%') do set PKG_SHARE_DIR=%%i
if "y%PKG_SHARE_DIR%" == "y" (
   dir /D
   goto :END
) 

if not "y%PKG_NAME_ALL%" == "y" ( set PKG_NAME_ALL=%PKG_NAME_ALL:/=\% )

dir /D %PKG_SHARE_DIR:/=\%%PKG_NAME_ALL%  %ARGS%
goto :END

:ERROR
   @echo ERROR: No such package/stack '%PKG_NAME%'
   goto :END

:usage
   @echo usage: rosls [package]
   @echo Lists contents of a package directory.

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

