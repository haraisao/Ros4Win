cd /d %~dp0base
call %~dp0tools\install_ros flist1.txt
call %~dp0tools\install_ros flist2.txt

call %~dp0tools\install_ros flist2.txt

cd %~dp0dsk
call %~dp0tools\install_ros flist1.txt

cd %~dp0tut
call %~dp0tools\install_ros flist1.txt

cd %~dp0setup
call install