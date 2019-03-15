@echo off
@setlocal enabledelayedexpansion
for /D  %%a in (*.*) do  @(
    set PKG=%%a
    call chk_url.bat !PKG!
)
@endlocal
@echo on