@echo off

@set PWD=%CD%
@set ERRORLEVEL=0

@echo off
@for /f  %%a in ('getCmakeFiles.exe %~dp0..') do @( 
     @call chConfigCmake2.bat %%a 
)

:END
@endlocal
@echo on