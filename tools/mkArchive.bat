@echo off

@set ERRORLEVEL=0

@setlocal

@set PKG_NAME=%~n1
@set PKG_NAME=%PKG_NAME:.=\%
@echo %PKG_NAME%

@echo off
@for /f "delims=" %%a in (%1) do @(
  call genDistPack.bat %%a
  if ERRORLEVEL 1 goto END
)

@set WORK_DIR=%CD%
@cd %~d0\ros_distrib\%PKG_NAME%

%~d0\local\7zip\7za a  %~d0\ros_distrib\%PKG_NAME%.7z melodic

@cd %WORK_DIR%

:END
@endlocal
@echo on
