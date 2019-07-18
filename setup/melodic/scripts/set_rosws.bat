@echo off

if "%1" == "" (
    set ROS_WORKSPACE=%CD%
) else (
    set ROS_WORKSPACE=%1
)

set ROS_LOG_DIR=%ROS_WORKSPACE%\log
set ROS_CACHE_PATH=%ROS_WORKSPACE%\cache

if not exist  %ROS_LOG_DIR% (
    mkdir %ROS_LOG_DIR%
)
if not exist %ROS_CACHE_PATH% (
    mkdir %ROS_CACHE_PATH%
)


@echo on