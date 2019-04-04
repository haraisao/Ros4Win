@echo off

setlocal enabledelayedexpansion
set PKG_NAME_ALL=%1
shift

set PKG_NAME=
call :get_pkg %PKG_NAME_ALL:/= %
call :replace PKG_NAME_ALL %PKG_NAME%

FOR /F %%i in ('rospack list') do (
   set PKG_LIST=!PKG_LIST! %%i
)
FOR /F %%i in ('rosstack list') do (
   set STACK_LIST=!STACK_LIST! %%i
)

echo "%PKG_LIST%" | find "%PKG_NAME%" > NUL
if not ERRORLEVEL 1 (
   FOR /F %%i in ('rospack find %PKG_NAME%') do  set PKG_SHARE_DIR=%%i
) else (
   echo "%STACK_LIST%" | find "%PKG_NAME%" > NUL
   if not ERRORLEVEL 1 (
      FOR /F %%i in ('rosstack find %PKG_NAME%') do  set PKG_SHARE_DIR=%%i
   ) else (
      goto :ERROR
   )
)

if not "y%PKG_NAME_ALL%" == "y" ( set PKG_NAME_ALL=%PKG_NAME_ALL:/=\% )

echo %PKG_SHARE_DIR%%PKG_NAME_ALL%
goto :END

:ERROR
  @echo Error

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