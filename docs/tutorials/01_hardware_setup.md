# Hardware setup

## Configuration for this tutorial
This tutorial will show you step-by-step instructions on how to use samples included in Edge.Auto.
The following hardware configuration is used throughout this tutorial.

- x86-based ECU: ADLINK AVA-3510
- Jetson-based ECU: ADLINK RQX-58G
- LiDAR: HESAI AT128 or XT32
- Camera: TIER IV Automotive HDR Camera C1

The figure below depicts the connection diagram between sensors and ECUs for this tutorial.
The network configuration, including applying the IP addresses to the specific interface, will be automatically done
during the steps in [02_installation](./02_installation.md).

![system connection example](connection.drawio.svg "system connection example")

## x86-based ECU
Before proceeding with [02_installation](./02_installation.md), install Ubuntu 22.04 to the x68-based ECU.


## Jetson-based ECU

** NOTE: BSP installation for ADLINK RQX-58G **

Before proceeding with [02_installation](./02_installation.md), RQX-58G need to be properly configured according to the official quick start guide from ADLINK Technology, Inc. Please see the [official document](https://www.adlinktech.com/Products/Download.ashx?type=MDownload&isQuickStart=yes&file=1783%5croscube-x-bsp-qsg-l4t-32.5.0-kernel-1.0.8.pdf) in detail. To download the BSP image, please visit the ADLINK official page [here](https://www.adlinktech.com/Products/DownloadSoftware.aspx?lang=en&pdNo=1783&MainCategory=ROS2-Solution.aspx&kind=BS). (If you are accessing the site for the first time, you will be prompted to create an account.)

While TIER IV camera driver ([tier4/tier4_automotive_hdr_camera](https://github.com/tier4/tier4_automotive_hdr_camera)) is included in the RQX-58G BSP official image, you can also update it during the following setup process.
