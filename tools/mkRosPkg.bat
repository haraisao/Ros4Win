@echo off

@setlocal
@call %~dp0setCMakeVars2


@set TARGET=%1
@set PKG_NAME=%~n1
@set INSTALL_DIR=%~d0\ros_pkg\%PKG_NAME%\melodic
@set BUILD_DIR=%~d0\_build\%TARGET%

cmake -G "Visual Studio 15 2017 Win64"  -DCATKIN_ENABLE_TESTING=0 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -B %BUILD_DIR% -S %*
@if errorlevel 1 goto END

cmake --build %BUILD_DIR% --config Release --target INSTALL  
@if errorlevel 1 goto END

@rem rd /s /q %BUILD_DIR%
@del %INSTALL_DIR%\.catkin
@del %INSTALL_DIR%\.rosinstall
@del %INSTALL_DIR%\_setup_util.py
@del %INSTALL_DIR%\env.bat
@del %INSTALL_DIR%\setup.bat


@set WORK_DIR=%CD%
@cd %~d0\ros_pkg\%PKG_NAME%

%~d0\local\7zip\7za a  %~d0\ros_pkg\ros-melodic-%PKG_NAME:_=-%.zip melodic

cd %~d0\ros_pkg
RD /S /Q %PKG_NAME%.
@cd %WORK_DIR%

:END
@endlocal
@echo on
