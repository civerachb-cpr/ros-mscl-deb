ROS MSCL Deb Package Builder
==================================

This repository is a super simple script to build a .deb package for the ros_mscl package.


Usage
--------

Clone this repo, and then run ``build-pkg.sh``.  This will create a catkin workspace, download the source code, build the package.  Running ``cleanup.sh`` will remove all of the temporary files & catkin workspace.


Dependencies
--------------

This repo uses the ``checkinstall`` package to build the .deb.  You will need whatever dependencies are needed to build the ros_mscl package, including the architecture-dependent packages located in the deps folder.
