# Ros4Win
Ros for Windows ( VS2017 )

## Download Sources
~~~
 > get_sources
~~~

## Set envronment variables
~~~
 > tools\setCMakeVars2.bat
~~~

## Build and install Ros4Win
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
  > cd ..\tut
  > install_ros flist1.txt
  ...
~~~

## Setup Ros4Win
 ~~~
 > cd setup
 > install.bat
 ...
~~~ 

## Run Ros4Win
~~~
 > cd \opt
 > start_ros.bat
 You will see terminal window.
 >env.bat
 ~~~
