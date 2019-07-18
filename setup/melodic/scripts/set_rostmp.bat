@echo off

if "%1" == "" (
    set ROS_TEMP=%CD%
) else (
    set ROS_TEMP=%1
)

set ROS_LOG_DIR=%ROS_TEMP%\log
set ROS_CACHE_PATH=%ROS_TEMP%\cache
mkdir %ROS_LOG_DIR%
mkdir %ROS_CACHE_PATH%

@echo on