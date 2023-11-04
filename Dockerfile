ARG BASE_IMAGE="ubuntu"
ARG TAG="22.04"
FROM ${BASE_IMAGE}:${TAG}
WORKDIR /vesc_dev

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_NAME=vesc_dev
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd ${USER_NAME} --gid ${USER_GID}\
    && useradd -l -m ${USER_NAME} -u ${USER_UID} -g ${USER_GID} -s /bin/bash
	
RUN apt-get update && apt-get install --no-install-recommends -y \
    sudo \
    bash-completion \
    python3 python-is-python3 git wget make zip nano vim xvfb \
    build-essential gcc-arm-none-eabi libgl-dev libxcb-xinerama0 \
	qtbase5-dev libqt5svg5-dev qtpositioning5-dev qtconnectivity5-dev libqt5gamepad5-dev libqt5serialport5-dev qtquickcontrols2-5-dev

ENV USER=${USER_NAME}

RUN echo "vesc_dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME}
RUN chmod 0440 /etc/sudoers.d/${USER_NAME}

RUN chown -R ${USER_NAME}:${USER_NAME} /${USER_NAME}
RUN mkdir /vesc_dev_scripts
RUN chown -R vesc_dev:vesc_dev /vesc_dev_scripts
USER ${USER_NAME}

#Vesc Express stuff
#RUN apt install -y flex bison gperf python3 python3-pip python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0
#RUN Xvfb :99 &
#RUN export DISPLAY=:99
#RUN export XDG_RUNTIME_DIR=/tmp/runtime-root
COPY get_vesc.sh /vesc_dev_scripts
COPY get_vesc_dado.sh /vesc_dev_scripts
COPY build_vesc.sh /vesc_dev_scripts
COPY ./docker-entrypoint.sh /

# Set the entrypoint script
#RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]
