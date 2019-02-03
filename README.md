# Ros4Win
Ros for Windows ( VS2017 )

## Download Sources
~~~
 > get_sources
~~~

## Set envronment variables
~~~
 > tools\setCMakeVars.bat
~~~

## Reset Python37 scripts
~~~
 > chPyShebang.bat
~~~

## Build Ros4Win
~~~
  > cd base
  > install_ros flist1.txt
  ...
  > install_ros flist2.txt
  ... (You will see error)
  > install_ros flist2.txt
  ...
  > cd ..\dsk
  > install_ros flist1.txt
  ...
  > install_ros flist2.txt
  ...
  > cd ..\tut
  > install_ros flist1.txt
  ...
~~~

## Setup ROS
 ~~~
 > cd setup
 > install.bat
 ...
~~~ 
