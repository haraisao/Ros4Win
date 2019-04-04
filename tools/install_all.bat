@echo off

setlocal enabledelayedexpansion

set PWD=%CD%
for /r %%i in (*.xml) do (
    if %%~ni == package (
        set PKG_NAME=%%i
        set PKG_NAME2=!PKG_NAME:%CD%=!
        set PKG_NAME3=!PKG_NAME2:%\package.xml=!
        call genPackage !PKG_NAME3:~1!
    )

)

endlocal
echo on
