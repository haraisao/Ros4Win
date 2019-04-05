@echo off
setlocal
for /f "usebackq delims=" %%a in (`pkg_name.exe %1`) do set PKG_NAME=%%a

echo ==== %PKG_NAME:_=-% ====

endlocal
echo on