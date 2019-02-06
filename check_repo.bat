
@echo off
setlocal enabledelayedexpansion

set NO_DIFF=1

if "%1" == "-v" (
  set NO_DIFF=
  shift
)
set PWD=%CD%
set PKG_NAME=%1

set PKG_LIST=%~dp0%PKG_NAME%\pkg_list.txt

if "%1" == "" goto :error

set GIT_DIFF=0
FOR /F %%X in ( %PKG_LIST% ) do (
  for /f "tokens=1,2 delims==" %%a in ("%%X") do (
     cd %PKG_NAME%\%%a

     for /f "tokens=1,2 delims=," %%p in ("%%b") do (
       set FLAG=
       FOR /F %%V in ('git diff') do (
         if not "%%V" == "" ( set FLAG=1 ) 
       )
       if not "!FLAG!" == ""  (
         set /A GIT_DIFF = !GIT_DIFF! + 1
         echo === %%a ===

         if "%NO_DIFF%" == "" (
            git diff
         ) 
       )
     )
     cd %PWD%
  )
)
goto :end

:error
echo Usage: %0 [pkg]
endlocal
echo on
@exit /b 1
:end
echo === %GIT_DIFF% repositories changed == 
endlocal
echo on
