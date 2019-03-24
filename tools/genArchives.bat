@echo off

@set ERRORLEVEL=0

@setlocal 

@echo off
for  %%a in (dist\%1*.txt) do (
  call mkArchive.bat %%a
  if ERRORLEVEL 1 goto END
)

:END
@endlocal
@echo on
