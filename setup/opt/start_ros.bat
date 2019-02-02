@echo off
call %~d0\opt\ros\melodic\ros_setup.bat
set ROS_WORKSPACE=%~dp0
call %~d0\local\clink\clink.bat
@echo on