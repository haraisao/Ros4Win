@echo off

set PYTHON_DIR=%~d0\local\Python37
set ROS_DISTRO=melodic

set ROS_HOME=%~d0\\opt\\ros\\%ROS_DISTRO%
set ROS_HOME_CMAKE=%~d0/opt/ros/%ROS_DISTRO%

rem set ROS_HOME=R:\\opt\\ros\\%ROS_DISTRO%
rem set ROS_HOME_CMAKE=R:/opt/ros/%ROS_DISTRO%

set PYTHONPATH=%ROS_HOME%\Lib\site-packages\;%PYTHON_DIR%\Lib\site-packages;%PYTHONPATH%
set PATH_ORG=%PATH%
set PATH=%~dp0;%~d0\local\vim;%~d0\local\cmake-3.13.1-win64-x64\bin;%PYTHON_DIR%;%PYTHON_DIR%\Scripts;%PATH%

set CMAKE_PREFIX_PATH=%ROS_HOME_CMAKE%
set LOCAL_LIBRARY_PATH=%~d0/local

set BOOSTROOT=%~d0/local/boost_1_68_0

set QTDIR=%~d0\local\Qt\5.12.0\msvc2017_64
set OpenCV_DIR=%~d0/local/opencv-3.4.5

set PATH=%QTDIR%\bin;%PATH%

@echo on
