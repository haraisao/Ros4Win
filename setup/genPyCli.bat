@echo off
setlocal
set CLI_CMD=cli-64.exe
if "%1" == "--gui" (
    set CLI_CMD=gui-64.exe
)

set CMD_NAME=%ROS_HOME%\%1

if "%1" == "" goto :error
if not exist %CMD_NAME%  goto error

if "%PYTHON_DIR%" == "" (
    set PYTHON_DIR=C:\Python37
)

set PYTHON_EXE=%PYTHON_DIR%\python.exe
set SETUP_TOOL_CLI=%PYTHON_DIR%\Lib\site-packages\setuptools\%CLI_CMD%

set SCR_NAME=%CMD_NAME%-script.py
  
echo #!%PYTHON_EXE%  > %SCR_NAME%
echo # -*- coding: utf-8 -*-  >> %SCR_NAME%
echo import re  >> %SCR_NAME%
echo import sys  >> %SCR_NAME%
echo python_script = re.sub(r'(-script\.pyw?^|\.exe)?$', '', sys.argv[0])  >> %SCR_NAME%
echo with open(python_script, 'r') as fh:  >> %SCR_NAME%
echo    context = {  >> %SCR_NAME%
echo        '__builtins__': __builtins__,  >> %SCR_NAME%
echo        '__doc__': None,  >> %SCR_NAME%
echo        '__file__': python_script,  >> %SCR_NAME%
echo        '__name__': __name__,  >> %SCR_NAME%
echo        '__package__': None,  >> %SCR_NAME%
echo    }  >> %SCR_NAME%
echo    exec(compile(fh.read(), python_script, 'exec'), context)  >> %SCR_NAME%

copy %SETUP_TOOL_CLI% %CMD_NAME%.exe

goto :end

:error
echo Usage: %0 [script_name]

:end
@echo on
