@echo off
setlocal enabledelayedexpansion
set QT_QPA_PLATFORM_PLUGIN_PATH=%ROS_HOME%\bin\platforms

set START=
if "%1" == "--start" (
  set START=start
  shift
)
set PYTHON=
set PKG_NAME=%1
shift
set CMD_NAME=%1
set EXT=%~x1
shift

if "%CMD_NAME%" == "" set CMD_NAME=%PKG_NAME%

@rem if "%EXT%" == "" set CMD_NAME=%CMD_NAME%.exe
if "%EXT%" == ".py" set PYTHON=python.exe

set ARGS=
:ARG_PARSE
 set ARGS=%ARGS% %~1
 shift
if not "%~1" == "" goto :ARG_PARSE

set CATKIN_LIBEXEC_DIR=
FOR /F %%i in ('catkin_find --without-underlays --libexec --share  %PKG_NAME% ') do (
 set CATKIN_LIBEXEC_DIR=!CATKIN_LIBEXEC_DIR! %%i
)

FOR /F %%i in ('ros_location_find %PKG_NAME%') do ( set PKG_SHARE_DIR=%%i )

if "%CATKIN_LIBEXEC_DIR%" == "" (
    if "%PKG_SHARE_DIR%" == "Error" goto :END
)

if "%CMD_NAME%" == "%CMD_NAME:/=%" (
  FOR %%i in ( %CATKIN_LIBEXEC_DIR:/=\% ) do (
    FOR /F %%x in ('findfile.bat /r %%i  %CMD_NAME%') do ( 
      if  not "%%x" == "" (
        set EXT=%%x
        if not "!EXT:~-4!" == ".exe" (
          %START% python %%x %ARGS%
        ) else (
          %START% %%x %ARGS%
        )
        goto :END
      )
    )
  )
  if not "%PKG_SHARE_DIR%" == "Error" (
      if exist %PKG_LIB_DIR%\%CMD_NAME% (
        %START% %PYTHON% %PKG_LIB_DIR%\%CMD_NAME% %ARGS%
      ) else (
        echo No such file  %PKG_LIB_DIR%\%CMD_NAME%
      )
  )

) else (
  if "%PKG_SHARE_DIR%" == "Error" (
    %START% %PYTHON% %CMD_NAME% %ARGS%
  ) else (
    %START% %PYTHON% %PKG_LIB_DIR%\%CMD_NAME% %ARGS%
  )
)

:END
endlocal
echo Finished
@echo on