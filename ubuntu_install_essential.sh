#!/bin/bash

# install vim
sudo apt-get install vim -y
# install terminator
sudo apt-get install terminator -y
# install vscode
sudo apt-get update
sudo apt-get install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update
sudo apt-get install code -y
# install chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -y
sudo apt-get install -f
rm -rf google-chrome-stable_current_amd64.deb
# install git
sudo apt-get install git -y

# install ROS melodic
# setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# setup key
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt-get update
sudo apt-get install ros-melodic-desktop-full -y

# package for the IMU
sudo apt-get install ros-melodic-phidgets-drivers ros-melodic-imu-tools -y

# additional ROS pkgs
sudo apt-get install ros-melodic-{tf-conversions, cv-bridge, image-transport, camera-info-manager, theora-image-transport, pcl-*} -y

# environment setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# dependencies for building packages
sudo apt-get install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
# initialize rosdep
sudo rosdep init
rosdep update

# install docker CE
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker arg
