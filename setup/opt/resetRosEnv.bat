@echo off

@set PWD=%CD%
@set ERRORLEVEL=0
@chdir /d %~d0\opt\ros\melodic\scripts

@setlocal
set PYTHON_DIR=%~d0\local\Python37
set ROS_HOME=%~d0\opt\ros\melodic\

@call chCmake.bat urdfdom
@call chCmake.bat urdfdom_headers

@echo off
@for /f "delims=" %%a in (cmake_list.txt) do @(  @call chConfigCmake.bat %%a )

@for /f "delims=" %%a in (pycmd_list.txt) do @(  @call chPyCmd.bat %%a )

@for /f "delims=" %%a in (profile_list.txt) do @(  @call chProfile.bat %%a )

:END
@endlocal

@chdir /d %PWD%
@set PWD=

@echo on