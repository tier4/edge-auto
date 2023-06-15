# Installation

## x86-based ECU

### Download the repository and setup the environment

NOTE: During this procedure, IP addresses are assigned to some network interfaces
(refer to the connection diagram on [01_hardware_setup](01_hardware_setup.md) for more detail) using `netplan`.
This behavior may cause unexpected disconnection if you are accessing the ECU remotely via those interfaces.

If you would like to change network interfaces or IP addresses to be assigned,
edit `edge-auto/ansible/playbooks/vars/edge_auto.yaml` before running `setup-dev-env.sh`

```sh
git clone https://github.com/tier4/edge-auto.git
cd edge-auto

./setup-dev-env.sh

sudo reboot
```

### Build Edge.Auto
```sh
cd edge-auto
mkdir src
vcs import src < autoware.repos

rosdep install -y -r --from-paths src --ignore-src --rosdistro $ROS_DISTRO

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release \
  --packages-up-to edge_auto_launch
```

## Jetson-based ECU

NOTE: This setup procedure requires an internet connection.

### Download the repository and setup the environment

As a first step, clone `tier4/edge-auto-jetson` and move to the directory.

```sh
git clone https://github.com/tier4/edge-auto-jetson.git
cd edge-auto-jetson
```

You can install the dependencies using the provided ansible script. During the installation process, you will be asked if you want to install the TIER IV camera driver. If you already have the driver installed and want to skip this step, please type `N` to continue.

NOTE: According to some factors, including the internet speed, `./setup-dev-env.sh` may take several hours.

```sh
./setup-dev-env.sh

[Warning] Do you want to install/update the TIER IV camera driver? [y/N]:
```

Finally, please reboot the system to make the installed dependencies and permission settings effective.

```sh
sudo reboot
```

### Build Edge.Auto_jetson

Create your ROS workspace and clone repositories using vcstool.

```sh
cd edge-auto-jetson
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
  --cmake-args -DCMAKE_BUILD_TYPE=Release -DPython3_EXECUTABLE=$(which python3.6) -DCMAKE_CUDA_STANDARD=14\
  --packages-up-to edge_auto_jetson_launch
```
