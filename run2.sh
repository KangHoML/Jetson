# -- cuda path setting
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

# -- tensorrt path setting
echo 'alias trtexec="/usr/src/tensorrt/bin/trtexec"' >> ~/.bashrc
source ~/.bashrc

# -- install nvidia-container
sudo apt-get install nvidia-container-toolkit
sudo systemctl restart docker
sudo usermod -aG docker $USER
newgrp docker

# -- pull docker image
docker pull nvcr.io/nvidia/l4t-pytorch:r35.2.1-pth2.0-py3

# -- docker container
cd $HOME
mkdir projects
docker run -it -d -e DISPLAY=$DISPLAY \
                  -v /tmp/.X11-unix:/tmp/.X11-unix \
                  --runtime nvidia \
                  -p 8888:8888 \
                  --gpus=all \
                  --network host \
                  --name torch \
                  -v $HOME/projects:/workspace \
                  nvcr.io/nvidia/l4t-pytorch:r35.2.1-pth2.0-py3