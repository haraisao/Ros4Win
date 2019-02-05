
@echo off
setlocal enabledelayedexpansion

set PWD=%CD%
set PKG_NAME=%1

set PKG_LIST=%~dp0%PKG_NAME%\pkg_list.txt

if "%1" == "" goto :error

FOR /F %%X in ( %PKG_LIST% ) do (
  for /f "tokens=1,2 delims==" %%a in ("%%X") do (
     set TARGET=%PKG_NAME%\%%a
     cd !TARGET:/=\!
     git pull
     cd %PWD%
  )
)
goto :end

:error
echo Usage:%0 <pkg_name> 

:end
endlocal
echo on
