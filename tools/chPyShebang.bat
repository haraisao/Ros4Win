@echo off

setlocal

if not "%1" == "" set PYTHON_DIR=%1

FOR /F %%a in ('where /R %PYTHON_DIR%\Scripts *.py') do @(
  %~dp0chShebang.bat %%a
)
endlocal
echo on
