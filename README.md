# vesc_dev_docker
Full toolchain setup for VESC controllers. Builds bldc, vesc_tool, vesc_pkg, vesc_express and nrf52_vesc

```
#Open up command prompt and install WSL2
wsl --install
wsl.exe --install Ubuntu-22.04
#Install Docker Desktop
https://docs.docker.com/desktop/install/windows-install/
#Open Docker Desktop -> Settings -> Resources -> WSL Intigration -> Enable integration with additional distros: Ubuntu-22.04
bash
cd ~
git clone docker build . -t vesc_dev   
cd vesc_dev_docker
docker volume create vesc_dev
docker build . -t vesc_dev   

#Change to your path
mkdir ~/vesc_dev
docker run -it --name vesc_dev -v ~/vesc_dev:/vesc_dev vesc_dev

#to start back up and get into the container
docker start -ia vesc_dev

./build_all.sh #builds everthing for float and stores binaries in /vesc_dev/vesc_builds
./get_vesc.sh
./build_vesc.sh
```
