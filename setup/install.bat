@echo off

if "y%ROS_HOME%" == "y" goto :END

xcopy /E opt\*.* \opt\
xcopy /E bin\*.* %ROS_HOME%\bin\
xcopy /E scripts %ROS_HOME%\scripts\
xcopy /E /Y ros_setup.bat %ROS_HOME%
xcopy /E /Y env.bat %ROS_HOME%
xcopy /E /Y setup.bat %ROS_HOME%
xcopy /E /Y _setup_util.py %ROS_HOME%

call installPyCmd.bat pycmd_list.txt
:END
@echo on
