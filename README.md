# Welcome to the YZUSmartbot RL environment! 

This repository contains all the files necessary to deploy an RL agent into a Jetson Nano.

### Instructions

1. Download this repository.

2. You need to put the following file inside the "Files" folder:

    https://drive.google.com/file/d/1s02V8NMhNPtBrqPgOX9J0mI5c-nGsmkz/view?usp=sharing

3. You need to have a pretrained mlagents model inside the "Files" folder. 
*To know how to get mlagents to output a trained model to pytorch rather than ONNX, check the 
html file inside this repository.*

4. Run the file you want.

### File Description 

There are 4 Main Files:

1. Debugging 2 & 4 --> Contains scripts that can visualize camera while printing angle/stage (respectively).

2. Environment_With_Visualization --> Contains the Environment that can visualize the camera + control the robot.

3. Environment_No_Visualization --> Contains the Environment that can control the robot (without visualization)

###  HOW TO OUTPUT MLAGENTS TRAINED MODEL AS PYTORCH MODEL? 

An explanation of How to modify the MLAgents library to output pytorch model is included as HTML.
Please note that you must have mlagents version 10 or above to be able to do this. 

### Please note that:

1 In order to read the RPLidar sensor, the repository from this link was used: 

-- https://github.com/Roboticia/RPLidar

2. In order to convert Pytorch models to TensorRT it is necessary to make use of:

-- https://github.com/NVIDIA-AI-IOT/torch2trt

###  LIBRARIES USED

The libraries used to create this project were:

+ CUDA==10.2.89
+ jetbot==https://github.com/NVIDIA-AI-IOT/jetbot
+ mlagents==0.22.0 (release version 10)
+ opencv==4.1.1
+ pillow==8.1.0
+ pytorch==1.7.0
+ rplidar==0.9.2
+ torchvision==0.8.0
+ torch2trt==0.1.0
+ trt-pose==0.0.01

### THIS IS A WORK IN PROGRESS

The files made by me are merely wrappers for other libraries. Don't forget to give the authors
credit for the hard work!
