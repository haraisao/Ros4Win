@echo off
REM generated from catkin/cmake/template/setup.bat.in

REM Sets various environment variables and sources additional environment hooks.
REM It tries it's best to undo changes from a previously sourced setup file before.
REM Supported command line options:
REM --extend: skips the undoing of changes from a previously sourced setup file

if "%ROS_HOME_CMAKE%" == ""  set ROS_HOME_CMAKE=D:/opt/ros/melodic

set _SETUP_UTIL=%ROS_HOME_CMAKE%/_setup_util.py

if NOT EXIST "%_SETUP_UTIL%" (
  echo "Missing Python script: %_SETUP_UTIL%"
  exit 22
)

REM set the Python executable
if "%PYTHON_DIR%" == "" (
  set _PYTHON="%~d0/local/Python37/python.exe"
) else (
  set _PYTHON="%PYTHON_DIR:\=/%/python.exe"
)

REM generate pseudo random temporary filename
:GenerateTempFilename
REM replace leading space of time with zero
set _SETUP_TMP=%Time: =0%
REM remove time delimiters
set _SETUP_TMP=%_SETUP_TMP::=%
set _SETUP_TMP=%_SETUP_TMP:.=%
set _SETUP_TMP=%_SETUP_TMP:,=%
set _SETUP_TMP=%Temp%\setup.%_SETUP_TMP%.bat
if EXIST %_SETUP_TMP% do goto GenerateTempFilename
type NUL > "%_SETUP_TMP%"
if NOT EXIST %_SETUP_TMP% (
  echo "Could not create temporary file: %_SETUP_TMP%"
  exit 1
)

REM invoke Python script to generate necessary exports of environment variables
%_PYTHON% "%_SETUP_UTIL%" %* > %_SETUP_TMP%
if NOT EXIST %_SETUP_TMP% (
  echo "Could not create temporary file: %_SETUP_TMP%"
  return 1
)
call %_SETUP_TMP%
del %_SETUP_TMP%

REM source all environment hooks
set _HOOK_COUNT=0
:hook_loop
if %_HOOK_COUNT% LSS %_CATKIN_ENVIRONMENT_HOOKS_COUNT% (
  REM set workspace for environment hook
  call set CATKIN_ENV_HOOK_WORKSPACE=%%_CATKIN_ENVIRONMENT_HOOKS_%_HOOK_COUNT%_WORKSPACE%%
  set _CATKIN_ENVIRONMENT_HOOKS_%_HOOK_COUNT%_WORKSPACE=

  REM call environment hook
  call %%_CATKIN_ENVIRONMENT_HOOKS_%_HOOK_COUNT%%%
  set _CATKIN_ENVIRONMENT_HOOKS_%_HOOK_COUNT%=

  set CATKIN_ENV_HOOK_WORKSPACE=

  set /a _HOOK_COUNT=%_HOOK_COUNT%+1
  goto :hook_loop
)

REM 3rdparty packages often put dll's into lib (convention is bin) and 
REM windows finds it's dll's via the PATH variable. Make that happen here!
set PATH=%LD_LIBRARY_PATH%;%PATH%

REM unset temporary variables
set _SETUP_UTIL=
set _PYTHON=
set _SETUP_TMP=
set _CATKIN_ENVIRONMENT_HOOKS_COUNT=
set _HOOK_COUNT=
