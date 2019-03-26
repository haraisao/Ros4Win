@if "y%ROS_HOME_CMAKE%" == "y" goto error_exit

@setlocal
@set PKG_NAME=%1
@if "%PKG_NAME%" == ""  exit /b 0
@if "%PKG_NAME:~0,1%" == "#"  exit /b 0

@if "%INSTALL_DIR%" == "" @set INSTALL_DIR=%ROS_HOME_CMAKE%
@if "%BUILD_DIR%" == ""   @set BUILD_DIR=%~d0/_build/%PKG_NAME%
@if "%BUILD_TYPE%" == ""  @set BUILD_TYPE=Release

@set ERRORLEVEL=0
@echo ===== Build and install ( %PKG_NAME% ) =====
@echo;
cmake -G "Visual Studio 15 2017 Win64"  -DCATKIN_ENABLE_TESTING=0 -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -B %BUILD_DIR% -S  %*
@if errorlevel 1 goto error_exit

cmake --build %BUILD_DIR% --config %BUILD_TYPE% --target INSTALL
@if errorlevel 1 goto error_exit
@endlocal
@exit /b 0

:error_exit
@endlocal
@echo ERROR occured... [%1]
@set ERRORLEVEL=1
@exit /b 1
