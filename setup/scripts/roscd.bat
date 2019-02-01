@echo off
if "%1" == "--help" (
   goto :usage
) else (
    if not "y%2" == "y" goto :usage
)

if "y%1" == "y" (
  if not "y%ROS_WORKSPACE%" == "y" (
    cd /d %ROS_WORKSPACE%
    goto :end
  ) else (
    if not "y%CMAKE_PREFIX_PATH%" == "y" (
      set WORKSPACES=%CMAKE_PREFIX_PATH:;= %
      for %%p in (%WORKSPACES%) do (
        if exist "%%p\\.catkin\\" (
          cd /d %%p
          goto :end
        )
      )
    )
    echo Neither ROS_WORKSPACE is set nor a catkin workspace is listed in CMAKE_PREFIX_PATH.
    echo Please set ROS_WORKSPACE or source a catkin workspace to use roscd with no arguments.
    goto :end
  )
) else (
  if "%1" == "log" (
    for /F %%i in ('roslaunch-logs') do (
      cd /d %%i
    )
    goto :end
  )
  
  for /F %%i in ('ros_location_find.bat %1') do (
    if not "y%%i" == "yError" (
       cd /d %%i
    )
    goto :end
  )
) 

:usage
  echo usage: roscp package filename target
  echo Copy a file from a package to target location
:end
@echo on