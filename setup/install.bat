@echo off

if "y%ROS_HOME%" == "y" goto :END

xcopy /E opt\*.* %~d0\opt\
xcopy /E scripts %ROS_HOME%\scripts\
copy /Y ros_setup.bat %ROS_HOME%
copy /Y env.bat %ROS_HOME%
copy /Y setup.bat %ROS_HOME%
copy /Y _setup_util.py %ROS_HOME%

call installPyCmd.bat pycmd_list.txt
:END
@echo on
