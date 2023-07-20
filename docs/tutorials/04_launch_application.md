# 4. Launch applications

Launch the perception application implemented in [autoware.universe](https://github.com/autowarefoundation/autoware.universe.git).

## 4-1. Jetson-based ECU

> **Note**
> 
> This following steps can be performed from your x86-based ECU via ssh.

The following sample launches image-based object detection performed on two cameras individually.


```sh
cd edge-auto-jetson
source install/setup.bash

ros2 launch edge_auto_jetson_launch edge_auto_jetson.launch.xml
```
NOTE: It may take about 15 minutes before turning the results available at the first execution, which is caused by converting the ONNX model into a TensorRT engine.
From the second launch, the results should be available immediately since conversion results are cached on the disk.


This sample exploits [tensorrt_yolox](https://github.com/autowarefoundation/autoware.universe/tree/main/perception/tensorrt_yolox)
and [bytetrack](https://github.com/autowarefoundation/autoware.universe/tree/main/perception/bytetrack) packages implemented in [autoware.universe](https://github.com/autowarefoundation/autoware.universe.git).
See the READMEs of these packages for more detail.

## 4-2. x86-based ECU

The following sample launches LiDAR-based object detection and bounding-box-level fusion (i.e. late fusion) between 2D and 3D object detection.
Launch the launch file that matches your LiDAR setup.

![demo_construction](figures/demo_construction.drawio.svg "demo_construction.svg")

The launch files can take an argument named `sensor_height` that represents LiDAR height from the ground in meters (default: 1.0).
Because some functions in Auoware are designed to perform best using previously known LiDAR height,
it is recommended to adjust this value according to your actual sensor setup to acquire better performance.

```sh
cd edge-auto
source install/setup.bash

ros2 launch edge_auto_launch perception_at128_sample.launch.xml sensor_height:=[sensor height from the ground]
## or
ros2 launch edge_auto_launch perception_xt32_sample.launch.xml sensor_height:=[sensor height from the ground]
```

This sample mainly leverages [pointcloud_preprocessor](https://github.com/autowarefoundation/autoware.universe/tree/main/sensing/pointcloud_preprocessor), [centerpoint](https://github.com/autowarefoundation/autoware.universe/tree/main/perception/lidar_centerpoint), and [image_projection_based_fusion](https://github.com/autowarefoundation/autoware.universe/tree/main/perception/image_projection_based_fusion) packages
in [autoware.universe](https://github.com/autowarefoundation/autoware.universe.git).
See the READMEs of these packages for more detail.

In addition to the perception stack, this sample also launches viewers so that users can check perception results visually.

As an example, the following picture shows the perception results in the case of a system configuration that consists of one AT128 and one C1 camera.

![Example: perception result](../sample.png "Example: perception result")

Note: The default models used in this tutorial are tuned for outdoor environments
(especially for autonomous driving contexts).
If you try this tutorial in some indoor environments, such as room ceil is in the range of sensor FoV, 
additional preprocessings, such as cropping the range to be processed, may be required to get better results.
