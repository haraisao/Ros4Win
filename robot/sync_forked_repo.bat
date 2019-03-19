cd DynamixelSDK
git fetch upstream
git checkout origin/melodic-devel
git merge upstream/melodic-devel
git checkout origin/master
git merge upstream/master
git checkout Ros4Win
cd %~dp0

cd franka_ros
git fetch upstream
git checkout origin/melodic-devel
git merge upstream/melodic-devel
git checkout origin/kinetic-devel
git merge upstream/kinetic-devel
git checkout Ros4Win
cd %~dp0
