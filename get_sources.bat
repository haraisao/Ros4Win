
@echo off
setlocal enabledelayedexpansion

FOR %%a in (init base dsk tut ctrl drv navi plan robot) do (
  git_clone %%a
)
echo on
