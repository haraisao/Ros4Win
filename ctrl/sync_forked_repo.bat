cd control_toolbox
git fetch upstream
git checkout origin/kinetic-devel
git merge upstream/kinetic-devel
git checkout Ros4Win
cd %~dp0


cd ros_controllers
git fetch upstream
git checkout origin/melodic-devel
git merge upstream/melodic-devel
git checkout Ros4Win
cd %~dp0
