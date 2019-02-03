@echo off
@rem -----------------------------------------
@set PYTHON_DIR=%~d0\local\Python37
@set PYTHON_BIN_PATH=%PYTHON_DIR%;%PYTHON_DIR%\Scripts

@set CMAKE_BIN_DIR=%~d0\local\cmake-3.13.1-win64-x64\bin
@set VIM_DIR=%~d0\local\vim
@set GRAPHVIZ_BIN_PATH=%~d0\local\Graphviz-2.38\bin
@rem -----------------------------------------

@set ROS_HOME=%~dp0
@set ROS_HOME_CMAKE=%ROS_HOME:\=/%
@set ROS_HOME_CMAKE=%ROS_HOME_CMAKE:~0,-1%

call %~dp0setup.bat

set PYTHONPATH=%PYTHON_DIR%\Lib;%PYTHON_DIR%\DLLs;%PYTHON_DIR%\Lib\site-packages;%PYTHONPATH%

@set PATH_ORG=%PATH%
@set PATH=%ROS_HOME%scripts;%PYTHON_DIR%\DLLs;%VIM_DIR%;%CMAKE_BIN_DIR%;%PYTHON_BIN_PATH%;%GRAPHVIZ_BIN_PATH%;%PATH%
@echo on