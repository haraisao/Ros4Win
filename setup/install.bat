setlocal
set DIST=%~d0\opt

copy doskey_macro.txt %DIST%
copy env.bat %DIST%
copy resetRosEnv.bat %DIST%
copy start_ros.bat %DIST%

xcopy /Y ros\melodic\*.*  %DIST%\ros\melodic
xcopy /Y /E ros\melodic\scripts\*.*  %DIST%\ros\melodic\scripts\