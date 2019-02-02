@echo off

if not "%1" == "" set PYTHON_DIR=%1

FOR /F %%a in ('where /R %PYTHON_DIR%\Scripts *.py') do (
  echo %%a
  sed  -i -e "1 s/#!.*/#!%PYTHON_DIR:\=\\%\\python.exe/" %%a
)
echo on
