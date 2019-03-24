@echo off

@setlocal
@call %~dp0setCMakeVars

@if "%PKG_NAME" == "" set PKG_NAME=ros
@set TARGET=%1
@set INSTALL_DIR=%~d0\ros_distrib\%PKG_NAME%\melodic
@set BUILD_DIR=%~d0\_build\%TARGET%

@rem --- Args
@set ARGS=
:ARG_PARSE
   @set ARGS=%ARGS% %~1
   @shift
@if not "%~1" == "" goto :ARG_PARSE
@rem -------------------------------

cmake -G "Visual Studio 15 2017 Win64"  -DCATKIN_ENABLE_TESTING=0 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -B %BUILD_DIR% -S %*
@if errorlevel 1 goto END

cmake --build %BUILD_DIR% --config Release --target INSTALL -j 4  
@if errorlevel 1 goto END

@rem rd /s /q %BUILD_DIR%
@del %INSTALL_DIR%\.catkin
@del %INSTALL_DIR%\.rosinstall
@del %INSTALL_DIR%\_setup_util.py
@del %INSTALL_DIR%\env.bat
@del %INSTALL_DIR%\setup.bat

:END
@endlocal
@echo on
