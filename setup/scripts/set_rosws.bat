@echo off

if "%1" == "" (
    set ROS_WORKSPACE=%CD%
) else (
    set ROS_WORKSPACE=%1
)

@echo on