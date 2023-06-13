# Hardware setup

## Jetson-based ECU

#### NOTE: BSP installation for ADLINK RQX-58G

This repository assumes that RQX-58G has been properly configured by following the official quick start guide from ADLINK Technology, Inc. Please see the [official document](https://www.adlinktech.com/Products/Download.ashx?type=MDownload&isQuickStart=yes&file=1783%5croscube-x-bsp-qsg-l4t-32.5.0-kernel-1.0.8.pdf) in detail. To download the BSP image, please visit the ADLINK official page [here](https://www.adlinktech.com/Products/DownloadSoftware.aspx?lang=en&pdNo=1783&MainCategory=ROS2-Solution.aspx&kind=BS). (If you are accessing the site for the first time, you will be prompted to create an account.)

TIER IV camera driver ([tier4/tier4_automotive_hdr_camera](https://github.com/tier4/tier4_automotive_hdr_camera)), is already installed in the RQX-58G BSP image and it can also be updated during your setup process.

An example connection between sensors and ECUs:

![system connection example](connection.drawio.svg "system connection example")

## x86-based ECU
