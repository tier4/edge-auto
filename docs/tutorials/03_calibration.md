# Calibration
## Calculate intrinsic parameters for cameras

```sh
source edge_auto/install/setup.bash
ros2 launch edge_auto_launch calibration_intrinsic_sample.launch.xml
```

See [this document](https://github.com/tier4/CalibrationTools/blob/tier4/universe/sensor/docs/how_to_intrinsic_camera.md)
for detailed operation on the tool.

Intrinsic parameters for all cameras consisting of your system (e.g., `camera0` and `camera1` in this tutorial)
should be stored on individual files.
After acquiring the files, put them in appropriate folder on **the jetson-based ECU** so that
they are loaded and published as `camera_info` topics:
```sh
edge-auto-jetson/src/individual_params/individual_params/config/
└── default # <- this will be an identifier, which refered to as the value of `VEHICLE_ID` environment variable, of your system
    ├── camera0
    │   ├── camera_info.yaml  # <- replace the contents of this file by the calculated results
    │   ├── trigger.param.yaml
    │   └── v4l2_camera.param.yaml
    ├── camera1
    │   ├── camera_info.yaml  # <- replace the contents of this file by the calculated results
    │   ├── trigger.param.yaml
    │   └── v4l2_camera.param.yaml

```

## Get a correction file from LiDAR

Some LiDAR have the capability to access their own correction file stored inside them.
To get better results, you are encouraged to download the correction file from individual LiDAR,
and store it in appropriate folter on the x86-based ECU:
```sh
edge-auto/src/individual_params/individual_params/config/
└── default
    ├── lidar
        └── at128_default.dat # <- replace the contents of this file by downloaded dat file
```

## Calculate extrinsic parameters between LiDAR and cameras

```sh
source edge_auto/install/setup.bash
ros2 launch edge_auto_launch calibration_extrinsic_at128_sample.launch.xml
```

See [this document](https://github.com/tier4/CalibrationTools/blob/tier4/universe/sensor/docs/how_to_extrinsic_interactive.md)
for detailed operation on the tool.

To perform sensor fusion, pose relationships (i.e., extrinsic parameters) between all fused sensors need to be registered in `TF`,
which is the ROS-fashion to represent the relationships.
In this tutorial, it is assumed that all sensors are equipped on a rigid body 
and relative poses between them are not changed by time.

After calculating extrinsic parameters, put the result in the appropriate files on the x86-based ECU:
```sh
edge-auto/src/individual_params/individual_params/config/
└── default
    ├── at128_to_camera0.json # <- replace the contents of this file by calculated results
    ├── at128_to_camera1.json # <- replace the contents of this file by calculated results
```
