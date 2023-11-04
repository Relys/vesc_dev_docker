FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update 
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:beineri/opt-qt-5.15.4-focal
RUN apt update

RUN apt install -y git wget make zip nano vim xvfb
RUN apt install -y build-essential gcc-arm-none-eabi libgl-dev libxcb-xinerama0
RUN apt install -y python-is-python3
RUN apt install -y qt515base qt515quickcontrols2 qt515svg qt515connectivity qt515location qt515gamepad

#Vesc Express stuff
#RUN apt install -y flex bison gperf python3 python3-pip python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0


COPY get_vesc.sh /
COPY get_vesc_dado.sh /
COPY build_vesc.sh /
COPY ./docker-entrypoint.sh /

# Set the entrypoint script
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]
