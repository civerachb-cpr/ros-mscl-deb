#!/bin/bash



# install the dependencies
sudo dpkg -i deps/*$(dpkg --print-architecture).deb

# make the workspace, clone the source
# note that the ros_mscl source is NOT a normal package source folder
# so we symlink it into the src folder
mkdir -p catkin_ws/src
cd catkin_ws
catkin_init_workspace src
git clone https://github.com/LORD-MicroStrain/ROS-MSCL.git
ln -s $(pwd)/ROS-MSCL/ros_mscl $(pwd)/src/ros_mscl

# build the ROS package
catkin_make

# run 
cd ..
sudo checkinstall -D -y \
  --pkgname ros-$ROS_DISTRO-microstrain-mscl \
  --pkgversion 1.0.0.$(date +%Y%m%d) \
  --arch amd64 \
  --pkgrelease 1 \
  --pkglicense MIT \
  --pkggroup development \
  --pkgsource "https://github.com/LORD-MicroStrain/ROS-MSCL" \
  --provides ros_mscl \
  --requires "c++-mscl,python2-mscl,python3-mscl" \
  --maintainer "civerachb@clearpathrobotics.com" \
  ./install.sh $ROS_DISTRO
