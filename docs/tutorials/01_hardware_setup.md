# 1. Hardware setup

As a first step, prepare your hardwares including Sensor and ECU.

## Sample hardware configuration

This following hardware configuration is used throughout this tutorial.

- ECU setup
  - x86-based ECU: ADLINK AVA-3510
  - Jetson-based ECU: ADLINK RQX-58G
- Sensor setup
  - Sample configuration 1
    - Camera: TIER IV Automotive HDR Camera C1 (x2)
    - LiDAR: HESAI AT128 (x1)
  - Sample configuration 2
    - Camera: TIER IV Automotive HDR Camera C1 (x2)
    - LiDAR: HESAI Pandar XT32 (x1)

The figure below depicts the connection diagram between sensors and ECUs for this tutorial.
This network configuration, including applying the IP addresses to the specific interface, will be automatically done during the steps in [2.Installation](./02_installation.md) page.

![system connection example](connection.drawio.svg "system connection example")

## 1-1. x86-based ECU

Before proceeding with [2.Installation](./02_installation.md) step, install Ubuntu 22.04 to your x86-based ECU.


## 2-2. Jetson-based ECU

Before proceeding with [2.Installation](./02_installation.md) step, install NVIDIA L4T R32.6.1 (including Ubuntu 18.04) to your Jetson-based ECU.

**NOTE: BSP installation for ADLINK RQX-58G**

RQX-58G need to be properly configured according to the official quick start guide from ADLINK Technology, Inc.
Please see the [official document](https://www.adlinktech.com/Products/Download.ashx?type=MDownload&isQuickStart=yes&file=1783%5croscube-x-bsp-qsg-l4t-32.5.0-kernel-1.0.8.pdf) in detail.
To download the BSP image, please visit the ADLINK official page [here](https://www.adlinktech.com/Products/DownloadSoftware.aspx?lang=en&pdNo=1783&MainCategory=ROS2-Solution.aspx&kind=BS). (If you are accessing the site for the first time, you will be prompted to create an account.)

While TIER IV camera driver ([tier4/tier4_automotive_hdr_camera](https://github.com/tier4/tier4_automotive_hdr_camera)) is included in the RQX-58G BSP official image, you can also update it during the following setup process.
