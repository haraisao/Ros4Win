@echo off

setlocal
set ROS_HOME=%~dp0..

del /Q %ROS_HOME%\rospack*.*
del /Q %ROS_HOME%\rosstack*.*
del /Q %ROS_HOME%\roscore*.*
rem del /S /Q %ROS_HOME%\log\*.*
rmdir /S /Q %ROS_HOME%\log

endlocal
@echo on