@echo off
@setlocal enabledelayedexpansion
@set PKG_NAME=%1

if not exist %PKG_NAME%\.git\config goto END
for /F  "tokens=1,3" %%a in (%PKG_NAME%\.git\config) do  (
    if %%a == url (
        @echo %PKG_NAME%=%%b 
    )
)
:END
@endlocal
@echo on