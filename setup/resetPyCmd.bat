@echo off

@set PWD=%CD%
@set ERRORLEVEL=0
chdir /d %~dp0

@setlocal

@echo off
@for /f "delims=" %%a in (pycmd_list.txt) do (
  @call genPyCli.bat %%a
  @if ERRORLEVEL 1 goto END
)

:END
@endlocal

chdir /d %PWD%
set PWD=

@echo on