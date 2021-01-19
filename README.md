# YZU_smart_robot

This repository will contain all the files necessary to deploy an RL agent into a Jetson Nano.

In order to read the RPLidar sensor, the repository from this link was used:
https://github.com/Roboticia/RPLidar

In order to convert Pytorch models to TensorRT it is necessary to make use of:
https://github.com/NVIDIA-AI-IOT/torch2trt



To read model from MlAgents (in pytorch format) use file #1
To Calculate angle between the center of the camera frame and the person, use file #2
To read RPLidar sensor, use file #3
To calculate the phase in which the robot is (phase 1, 2 or 3) use file #4
