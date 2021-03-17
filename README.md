![Alt text](/yzu_smartbot_logo.png?raw=true "Optional Title")

### Instructions

1. Download this repository.

2. You need to put the following file inside the "Files" folder:

    https://drive.google.com/file/d/1s02V8NMhNPtBrqPgOX9J0mI5c-nGsmkz/view?usp=sharing

3. You need to have a pretrained mlagents model inside the "Files" folder. 

    By Default, there's a model pretrained by our Master Student George.

    *To know how to get mlagents to output a trained model to pytorch rather than ONNX, 
    check the html file inside this repository.*

4. Run the file you want.

### File Description 

There are 5 Main Files:

1. Debugging_Angle --> To visualize the camera stream while printing angle.

2. Debugging_Lidar --> To visualize lidar readings in real time.

3. Debugging_Stage --> To visualize the camera stream while printing stage.

4. Environment_With_Visualization --> Visualize the camera stream + RL Env to control robot.

5. Environment_No_Visualization --> RL Env to control robot (NO camera visualization)

###  HOW TO OUTPUT MLAGENTS TRAINED MODEL AS PYTORCH MODEL? 

An explanation of How to modify the MLAgents library to output pytorch model is included as HTML.

*You must have mlagents version 10 or above to be able to do this.* 

### Credits:

1 RPLidar communication was achieved using this library: 

-- https://github.com/Roboticia/RPLidar

2. Pytorch to TensorRT was achieved using this library:

-- https://github.com/NVIDIA-AI-IOT/torch2trt

3. In general, none of this would be possible without Victor Ham's help:

-- https://github.com/victorhamc

###  LIBRARIES USED IN THIS REPOSITORY

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

These files are wrappers for other libraries. Don't forget to give the authors
credit for the hard work!
