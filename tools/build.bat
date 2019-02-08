@if "y%ROS_HOME_CMAKE%" == "y" goto error_exit

@echo ===== Build ( %1 ) =====

cmake --build build/%1 --config Release -j 4  
@if errorlevel 1 goto error_exit

@exit /b 0

:error_exit
@echo ERROR occured... [%1]
@set ERRORLEVEL=1
@exit /b 1
