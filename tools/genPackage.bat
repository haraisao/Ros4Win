@if "y%ROS_HOME_CMAKE%" == "y" goto error_exit

@set ERRORLEVEL=0
@echo ===== Build and install ( %1 ) =====
@echo;
cmake -G "Visual Studio 15 2017 Win64"  -DCATKIN_ENABLE_TESTING=0 -DCMAKE_INSTALL_PREFIX=%ROS_HOME_CMAKE% -B build/%1 -S  %*
@if errorlevel 1 goto error_exit

cmake --build build/%1 --config Release --target INSTALL
@if errorlevel 1 goto error_exit

@exit /b 0

:error_exit
@echo ERROR occured...
@set ERRORLEVEL=1
@exit /b 1
