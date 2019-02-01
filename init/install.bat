
cd %~dp0rospkg
python setup.py install

cd %~dp0catkin_pkg
python setup.py install

cd %~dp0rosdep
python setup.py install

cd %~dp0rosdistro
python setup.py install
