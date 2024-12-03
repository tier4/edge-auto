#/bin/bash

# start LiDAR node
echo -e "\e[36m--- [PREPARATION] LiDAR node start ---\e[0m"
source install/setup.bash
RMW_IMPLEMENTATION=
ros2 launch nebula_ros hesai_launch_all_hw.xml sensor_model:=$1 & pid_hesai_lidar_launch=$!
sleep 10

# Check point cloud publishing
echo -e "\e[36m--- [TEST] LiDAR PointCloud topic subscription test ---\e[0m"
timeout 10 ros2 topic echo --once /pandar_points --field header
test_result=$?

# post processes
kill -9 $pid_hesai_lidar_launch
pkill hesai_driver_ro
pkill hesai_hw_interf
pkill hesai_hw_monito

# show result
if [ $test_result = 0 ]; then
    echo -e "\e[32m[RESULT] Success.\e[0m"
else
    echo -e "\e[31m[RESULT] Failed.\e[0m"
fi

