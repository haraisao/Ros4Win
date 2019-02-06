@echo off

@set ERRORLEVEL=0

@setlocal
@call %~dp0..\tools\setCMakeVars.bat

@echo off
@for /f "delims=" %%a in (%1) do @(
  @call genPyCli.bat %%a
  @if ERRORLEVEL 1 goto :END
)

:END
@endlocal
@echo on
