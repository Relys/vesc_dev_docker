# vesc_dev_docker
Full toolchain setup for VESC controllers. Builds bldc, vesc_tool and vesc_pkg

```
#Install Docker Desktop
#Open Docker Desktop -> Settings -> Resources -> WSL Intigration -> Enable integration with additional distros: Ubuntu-22.04
docker volume create vesc_dev
docker build . -t vesc_dev   

#Change to your path
docker run -it --name vesc_dev -v \\wsl.localhost\Ubuntu-22.04\home\neo\vesc_dev:/vesc_dev vesc_dev

#to start back up and get into the container
docker start -ia vesc_dev

./get_vesc.sh #For Official
./get_vesc_float.sh # For self balacing mobility devices
./build_vesc.sh
```
