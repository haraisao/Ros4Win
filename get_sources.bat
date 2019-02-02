
@echo off
setlocal enabledelayedexpansion

FOR %%a in (init base dsk tut) do (
  git_clone %%a
)
echo on
