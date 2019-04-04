@echo off

@set ERRORLEVEL=0

@setlocal

@echo off
@for /f "delims=" %%a in (%1) do @(
  call mkArchive2.bat %%a
  if ERRORLEVEL 1 goto END
)

:END
@endlocal
@echo on
