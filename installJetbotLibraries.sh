
#############################2: Create Swap Memory (for more RAM) #############################

cd 
sudo fallocate -l 2G /var/swapfile
sudo chmod 600 /var/swapfile
sudo mkswap /var/swapfile
sudo swapon /var/swapfile
sudo bash -c 'echo "/var/swapfile swap swap defaults 0 0" >> /etc/fstab'


#############################3: Install Python + Numpy + Cython #############################

sudo apt-get update
sudo apt install -y python3-pip python3-pil
sudo -H pip3 install Cython
sudo -H pip3 install --upgrade numpy


#############################4: Install jtop (to check memory consumption and temp of Nano) #############################

sudo -H pip3 install jetson-stats 


#############################5: Install the pre-built TensorFlow pip wheel #############################
sudo apt-get update
sudo apt-get install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
sudo apt-get install -y python3-pip
sudo pip3 install -U pip testresources setuptools numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11
# TF-1.15
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 'tensorflow<2'


#############################6: Install Pytorch 1.6 #############################

wget https://nvidia.box.com/shared/static/9eptse6jyly1ggt9axbja2yrmj6pbarc.whl -O torch-1.6.0-cp36-cp36m-linux_aarch64.whl
sudo apt-get install python3-pip libopenblas-base libopenmpi-dev 
pip3 install Cython
pip3 install numpy torch-1.6.0-cp36-cp36m-linux_aarch64.whl


#############################7: Install Torchvision 0.7.0 #############################

sudo apt-get install libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev
git clone --branch release/0.7 https://github.com/pytorch/vision torchvision 
cd torchvision
export BUILD_VERSION=0.7.0
python3 setup.py install --user
cd ../
pip install 'pillow<7'



#############################8: Install Torch2TrT #############################

cd $HOME
git clone https://github.com/NVIDIA-AI-IOT/torch2trt
cd torch2trt
sudo python3 setup.py install


#############################9: Install Traitlets #############################

sudo python3 -m pip install git+https://github.com/ipython/traitlets@dead2b8cdde5913572254cf6dc70b5a6065b86f8


#############################10: Install Jupyter Lab & Configure It! #############################

sudo apt install -y curl
wget https://nodejs.org/dist/v12.13.0/node-v12.13.0-linux-arm64.tar.xz
tar -xJf node-v12.13.0-linux-arm64.tar.xz
cd node-v12.13.0-linux-arm64
sudo cp -R * /usr/local/
node -v   # Here you should see a print that says "node js version 12.X"
sudo -H pip3 install jupyter jupyterlab
sudo -H jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter lab --generate-config
python3 -c "from notebook.auth.security import set_password; set_password('$password', '$HOME/.jupyter/jupyter_notebook_config.json')"

# fix for permission error
sudo chown -R jetbot:jetbot ~/.local/share/

# Install jupyter_clickable_image_widget
cd
sudo apt-get install libssl1.0-dev
git clone https://github.com/jaybdub/jupyter_clickable_image_widget
cd jupyter_clickable_image_widget
git checkout tags/v0.1
sudo -H pip3 install -e .
sudo jupyter labextension install js
sudo jupyter lab build

# Install bokeh
sudo apt-get install jupyter_bokeh

#############################11. install jetbot python module #############################
cd
sudo apt install -y python3-smbus
git clone https://github.com/NVIDIA-AI-IOT/jetbot
cd ~/jetbot
sudo apt-get install -y cmake
sudo python3 setup.py install 

#############################12. Install jetbot services (for remote connection) #############################
cd jetbot/utils
python3 create_stats_service.py
sudo mv jetbot_stats.service /etc/systemd/system/jetbot_stats.service
sudo systemctl enable jetbot_stats
sudo systemctl start jetbot_stats
python3 create_jupyter_service.py
sudo mv jetbot_jupyter.service /etc/systemd/system/jetbot_jupyter.service
sudo systemctl enable jetbot_jupyter
sudo systemctl start jetbot_jupyter


#############################13. Install python gst dependencies #############################
sudo apt-get install -y \
    libwayland-egl1 \
    gstreamer1.0-plugins-bad \
    libgstreamer-plugins-bad1.0-0 \
    gstreamer1.0-plugins-good \
    python3-gst-1.0
    
#############################14. Install zmq dependency (should actually already be resolved by jupyter) #############################
sudo -H pip3 install pyzmq
    

#############################15. Optimize the system configuration to create more headroom #############################
sudo nvpmodel -m 0
sudo systemctl set-default multi-user
sudo systemctl disable nvzramconfig.service

#############################16. Copy JetBot notebooks to home directory #############################
cp -r ~/jetbot/notebooks ~/Notebooks

#############################17. Install TRT_POSE #############################

sudo pip3 install tqdm cython pycocotools
sudo apt-get install python3-matplotlib

git clone https://github.com/NVIDIA-AI-IOT/trt_pose
cd trt_pose
sudo python3 setup.py install

#############################18. Install RPLidar #############################
sudo pip3 install rplidar


#############################19. Install Jetcam #############################
git clone https://github.com/NVIDIA-AI-IOT/jetcam
cd jetcam
sudo python3 setup.py install


############################# 20. Install ROS #############################
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop
apt search ros-noetic
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-rosdep
sudo rosdep init
rosdep update


############################# 21. Install PyRealsense2 #############################
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y --no-install-recommends \
    python3 \
    python3-setuptools \
    python3-pip \
	python3-dev

sudo apt-get install -y git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev
sudo apt-get install -y libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev
git clone https://github.com/IntelRealSense/librealsense.git
cd ./librealsense
./scripts/setup_udev_rules.sh
mkdir build && cd build
cmake ../ -DBUILD_PYTHON_BINDINGS:bool=true
sudo make uninstall && sudo make clean && sudo make -j4 && sudo make install
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.6/pyrealsense2


##################################################################################################
clear
echo "Everything finished! Now, follow the steps at the end of the .sh file, then reboot."

################### Manual steps you need to do by yourself #############################

# now you must edit the "jetbot_jupyter.service" file to avoid torch problems
# ----> This file is located in: ~/etc/systemd/system/jetbot_jupyter.service  --> edit it with text editor

# change:
#	ExecStart=/bin/sh -c "jupyter lab --ip=0.0.0.0 --no-browser"

# to:
#	ExecStart=/bin/sh -c "export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1; jupyter lab --ip=0.0.0.0 --no-browser" 


# Once you have finished with everything, you must restart your jetson Nano. After doing this, you will be presented again with the black screen.

# Type: sudo systemctl set-default graphical.target
# then type: sudo restart

# You have finished!!!!

# When opening the remote session for the first time, you will be asked for the password --> THERE IS NO PASSWORD! just click OK.


