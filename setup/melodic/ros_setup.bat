@echo off
@rem -----------------------------------------
@set PYTHON_DIR=%~d0\local\Python37
@set PYTHON_BIN_PATH=%PYTHON_DIR%;%PYTHON_DIR%\Scripts
@set PYTHON_EXE=%PYTHON_DIR%\python.exe

@set CMAKE_BIN_DIR=%~d0\local\cmake-3.14.5-win64-x64\bin
@set VIM_DIR=%~d0\local\vim
@set GRAPHVIZ_BIN_PATH=%~d0\local\Graphviz-2.38\bin
@set BOOST_BIN_PATH=%~d0\local\boost_1_68_0\lib64-msvc-14.1
@rem set QHULL_BIN_PATH=%~d0\local\qhull\bin
@set QHULL_BIN_PATH=%~d0\opt\local\bin
@set LOCAL_LIBRARY_PATH=%~d0/local
@rem -----------------------------------------

@set ROS_HOME=%~dp0
@set ROS_HOME_CMAKE=%ROS_HOME:\=/%
@set ROS_HOME_CMAKE=%ROS_HOME_CMAKE:~0,-1%
@set ROS_HOME_DRIVE=%~d0

call %~dp0setup.bat
set QT_QPA_PLATFORM_PLUGIN_PATH=%ROS_HOME%\bin\platforms
set PYTHONPATH=%PYTHON_DIR%\Lib;%PYTHON_DIR%\DLLs;%PYTHON_DIR%\Lib\site-packages;%PYTHONPATH%

@set PATH_ORG=%PATH%
@set PATH=%ROS_HOME%scripts;%BOOST_BIN_PATH%;%PYTHON_DIR%\DLLs;%VIM_DIR%;%CMAKE_BIN_DIR%;%PYTHON_BIN_PATH%;%GRAPHVIZ_BIN_PATH%;%QHULL_BIN_PATH%;%PATH%
@echo on