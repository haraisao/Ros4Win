cd bound_core
git fetch upstream
git checkout origin/kinetic-devel
git merge upstream/kinetic-devel
git checkout Ros4Win
cd %~dp0

cd catkin
git fetch upstream
git checkout origin/kinetic-devel
git merge upstream/kinetic-devel
git checkout Ros4Win
cd %~dp0

cd nodelet_core
git fetch upstream
git checkout origin/indigo-devel
git merge upstream/indigo-devel
git checkout Ros4Win
cd %~dp0

cd ros_environment
git fetch upstream
git checkout origin/melodic
git merge upstream/melodic
git checkout Ros4Win
cd %~dp0

cd ros_core/class_loader
git fetch upstream
git checkout origin/melodic-devel
git merge upstream/melodic-devel
git chenckout Ros4Win
cd %~dp0

cd ros_core/cmake_modules
get fetch upstream
git checkout origin/0.4-devel
git merge upstream/0.4-devel
git checkout Ros4Win
cd %~dp0

cd ros_core/genpy
git fetch upstream
git checkout origin/kinetic-devel
git merge upstream/kinetic-devel
git checkout Ros4Win
cd %~dp0

cd ros_core/pluginlib
git fetch upstream
git checkout origin/melodic-devel
git merge upstream/melodic-devel
git checkout Ros4Win
cd %~dp0

cd ros_core/ros
git fetch upstream
git checkout origin/kinetic-devel
git merge upstream/kinetic-devel
git checkout Ros4Win
cd %~dp0

cd ros_core/ros_comm
git fetch upstream
git checkout origin/melodic-devel
git merge upstream/melodic-devel
git checkout Ros4Win
cd %~dp0

cd ros_core/rosconsole
git fetch upstream
git checkout origin/melodic-devel
git merge upstream/melodic-devel
git checkout Ros4Win
cd %~dp0

cd ros_core/rosconsole_bridge
git fetch upstream
git checkout origin/kinetic-devel
git merge upstream/kinetic-devel
git checkout Ros4Win
cd %~dp0

cd ros_core/rospp_core
git fetch upstream
git checkout origin/kinetic-devel
git merge upstream/kinetic-devel
git checkout Ros4Win
cd %~dp0

cd ros_core/rospack
git fetch upstream
git checkout origin/lunar-devel
git merge upstream/lunar-devel
git checkout Ros4Win
cd %~dp0
