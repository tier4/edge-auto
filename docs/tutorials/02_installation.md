# Installation

## Jetson-based ECU

### Installing dependencies

As a first step, clone `tier4/perception_ecu_container` and move to the directory.

```sh
git clone https://github.com/tier4/perception_ecu_container.git
cd perception_ecu_container
```

You can install the dependencies using the provided ansible script. During the installation process, you will be asked if you want to install the TIER IV camera driver. If you already have the driver installed and want to skip this step, please type `N` to continue.

```sh
./setup-dev-env.sh

[Warning] Do you want to install/update the TIER IV camera driver? [y/N]:
```

Finally, please reboot the system to make the installed dependencies and permission settings effective.

```sh
sudo reboot
```

### Building ROS workspace

Create your ROS workspace and clone repositories using vcstool.

```sh
mkdir src
vcs import src < autoware.repos
```

If you want to update cloned repositories, use the following command.

```sh
vcs import src < autoware.repos
vcs pull src
```

Build your ROS workspace.

```sh
colcon build --symlink-install \
  --cmake-args -DCMAKE_BUILD_TYPE=Release -DPython3_EXECUTABLE=$(which python3.6) \
  --packages-up-to edge_auto_jetson_launch
```

## x86-based ECU

```sh
git clone https://github.com/tier4/edge-auto.git
cd edge-auto

./setup-dev-env.sh

cd autoware
mkdir src
vcs import src < autoware.repos

source /opt/ros/humble/setup.bash
rosdep install -y -r --from-paths src --ignore-src --rosdistro $ROS_DISTRO

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release \
  --packages-up-to edge_auto_launch
```
