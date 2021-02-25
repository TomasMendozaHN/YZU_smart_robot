# Welcome to the YZUSmartbot RL environment! 

This repository contains all the files necessary to deploy an RL agent into a Jetson Nano.

Please note that:

1 In order to read the RPLidar sensor, the repository from this link was used: 

-- https://github.com/Roboticia/RPLidar

2. In order to convert Pytorch models to TensorRT it is necessary to make use of:

-- https://github.com/NVIDIA-AI-IOT/torch2trt


### File Description 

If you want to inmediately start using the YZU robot, you must have a pretrained model in Pytorch,
and your robot set up. Then, copy this repository into your Nano and run the "RLEnvironment" file
which mimics how MLAgents works (by implementing the observe, sample_action and step methods). 
Notice that you must change the "model = torch.load()" line in RLEnvironment.ipynb to load your
trained model.

If you are trying to understand how everything works, you can run each file separately as they
can all run independently. Just make sure to uncomment everything if you are planning on running
the files separately:

1. To read a TRAINED model from MlAgents (in pytorch format) use file #1

2. To Calculate angle between the center of the camera frame and the person, use file #2

3. To read RPLidar sensor, use file #3

4. To calculate the phase in which the robot is (phase 1, 2 or 3) use file #4

------------------- HOW TO OUTPUT MLAGENTS TRAINED MODEL AS PYTORCH MODEL? ------------------- 

An explanation of How to modify the MLAgents library to output pytorch model is included as HTML.
Please note that you must have mlagents version 10 or above to be able to do this. 

------------------------------------------ LIBRARIES -----------------------------------------

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

----------------------------------THIS IS A WORK IN PROGRESS----------------------------------

The files made by me are merely wrappers for other libraries. Don't forget to give the authors
credit for the hard work!
