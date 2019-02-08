@echo off

set PYTHON_DIR=%~d0\local\Python37
set ROS_DISTRO=melodic

set ROS_HOME=%~d0\\opt\\ros\\%ROS_DISTRO%
set ROS_HOME_CMAKE=%~d0/opt/ros/%ROS_DISTRO%

set PYTHONPATH=%ROS_HOME%\Lib\site-packages\;%PYTHON_DIR%\Lib\site-packages;%PYTHONPATH%
set PATH_ORG=%PATH%
set PATH=%~dp0;%~d0\local\vim;%~d0\local\cmake-3.13.1-win64-x64\bin;%PYTHON_DIR%;%PYTHON_DIR%\Scripts;%PATH%

set CMAKE_PREFIX_PATH=%ROS_HOME_CMAKE%
set BOOSTROOT=%~d0/local/boost_1_68_0
set TinyXML2_ROOT_DIR=%~d0/local/TinyXML2

set LZ4_ROOT=%~d0/local/lz4
set BZIP2_DIR=%~d0/local/bzip2-dev
set CURL_ROOT=%~d0/local/curl
set LLVM_INSTALL_DIR=%~d0\local\LLVM
set QTDIR=%~d0\local\Qt\5.12.0\msvc2017_64
set Eigen3_DIR=%~d0/local/Eigen3/share/eigen3/cmake
set OpenCV_DIR=%~d0/local/opencv-3.4.5
set LOG4CXX_ROOT=%~d0/local/log4cxx

set PATH=%QTDIR%\bin;%LLVM_INSTALL_DIR%\bin;%PATH%

@echo on
