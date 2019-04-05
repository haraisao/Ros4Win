@echo off

@set ERRORLEVEL=0

@setlocal

if "%2" == "" (
    @set PKG_NAME=%~n1
    @rem set PKG_NAME=%PKG_NAME:.=\%
) else (
    @set PKG_NAME=%2
)
for /f "usebackq delims=" %%a in (`pkg_name.exe %1`) do set PKG_NAME=%%a
@echo %PKG_NAME%

call genDistPack.bat %1
if ERRORLEVEL 1 goto END


@set WORK_DIR=%CD%
@cd /D R:\ros_pkg\%PKG_NAME%

tar czvf  R:\ros_pkg\ros-melodic-%PKG_NAME:_=-%.tgz ros

@cd /D %WORK_DIR%
@rd /S /Q R:\ros_pkg\%PKG_NAME%
@echo === Finish to build %PKG_NAME% ===
:END
@endlocal
@echo on
