@echo off

@set ERRORLEVEL=0

@setlocal
@rem call %~dp0setCMakeVars

@echo off
for /f "delims=" %%a in (%1) do (
  call genPackage.bat %%a
  echo ==== %%a ====
  if ERRORLEVEL 1 goto END
)

:END
@endlocal
@echo on
