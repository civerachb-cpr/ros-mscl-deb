#!/bin/bash

DISTRO=$1

TARGET_DIR=/opt/ros/$DISTRO

cd catkin_ws/devel
cp -R include $TARGET_DIR
cp -R lib $TARGET_DIR
cp -R share $TARGET_DIR
