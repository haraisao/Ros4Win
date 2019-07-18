@echo off

@set PWD=%CD%
@set ERRORLEVEL=0
@chdir /d %~dp0

@setlocal
@call chCmake.bat urdfdom
@call chCmake.bat urdfdom_headers

@echo off
@call resetRosCmake.bat

@for /f "delims=" %%a in (profile_list.txt) do @(  @call chProfile.bat %%a )

@call chDrive.bat lib\site-packages\nodelet_topic_tools\cfg\NodeletThrottleConfig.py

:END
@endlocal

@chdir /d %PWD%
@set PWD=

@echo on