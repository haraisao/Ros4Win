@set PYTHON_DIR=%~d0\Python37
@set ROS_HOME=%~dp0

@set PYTHONPATH=%ROS_HOME%lib\site-packages;%PYTHON_DIR%\Lib\site-packages%PYTHONPATH%
@set PATH_ORG=%PATH%
@set PATH=%ROS_HOME%scripts;%ROS_HOME%bin;%PYTHON_DIR%;%PYTHON_DIR%\DLLs;%PYTHON_DIR%\Scripts;%PYTHON_DIR%\Lib;%PYTHON_DIR%;Lib\site-packages\pywin32_system32;%PATH%

@set ROS_PYTHON_LOG_CONFIG_FILE=%ROS_HOME%etc\ros\python_logging.conf
@set ROS_ETC_DIR=%ROS_HOME%etc\ros
@set ROS_ROOT=%ROS_HOME%share\ros
@set ROS_VERSION=1
@set ROS_PYTHON_VERSION=2
@set ROS_PACKAGE_PATH=%ROS_HOME%share
@set ROS_DISTRO=melodic

set CMAKE_PREFIX_PATH=%ROS_HOME%

@set ROS_HOSTNAME=localhost
@set ROS_MASTER_URI=http://localhost:11311


