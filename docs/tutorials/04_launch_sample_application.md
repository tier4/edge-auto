# Launch sample application

## Jetson-based ECU

### Running sample

For example, the following shows how to execute single-camera object detection.

(NOTE: The following command will display the object recognition results in a new window, but building TensorRT engine takes about 15 minutes at first time. From the second launch, it is skipped and the results are displayed immediately.)

```sh
source ./install/setup.bash  # Don't miss enabling workspace ROS packages
ros2 launch edge_auto_jetson_launch edge_auto_jetson.launch.xml
```

This sample is based on [tensorrt_yolox](https://github.com/autowarefoundation/autoware.universe/tree/main/perception/tensorrt_yolox) implemented in [autoware.universe](https://github.com/autowarefoundation/autoware.universe.git).
See this [README](https://github.com/autowarefoundation/autoware.universe/blob/main/perception/tensorrt_yolox/README.md) about the algorithm and the used trained model in more detail.

## x86-based ECU
