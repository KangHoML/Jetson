# -- upgrade
sudo apt-get update
sudo apt-get upgrade -y

# -- wifi setting
make
sudo make install
sudo modprobe 88x2bu
sudo reboot

# -- install jetpack-runtime
sudo apt install nvidia-jetpack
