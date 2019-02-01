@echo off

setlocal enabledelayedexpansion
set FLAG=%1


FOR /F %%i in ('rospack list') do (
   set PKG_LIST=!PKG_LIST! %%i
)
FOR /F %%i in ('rosstack list') do (
   set STACK_LIST=!STACK_LIST! %%i
)

if "%FLAG%" == "pack" (
  echo %PKG_LIST:~1%
) else (
  if "%FLAG%" == "stack" (
    echo %STACK_LIST:~1%
  ) else (
     echo %PKG_LIST:~1%%STACK_LIST%
  )
)

endlocal
@echo on
@exit /b