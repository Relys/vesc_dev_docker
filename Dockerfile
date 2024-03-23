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
    bash-completion ca-certificates \
    python3 python-is-python3 python3.10-venv libusb-1.0-0 git wget make zip unzip nano vim xvfb cmake \
    build-essential gcc-arm-none-eabi libnewlib-arm-none-eabi libgl-dev libxcb-xinerama0 \
	qtbase5-dev libqt5svg5-dev qtpositioning5-dev qtconnectivity5-dev libqt5gamepad5-dev libqt5serialport5-dev qtquickcontrols2-5-dev qtbase5-private-dev p7zip-full autoconf automake autopoint bison flex \
	libgdk-pixbuf2.0-dev gperf intltool libtool-bin lzip ruby gcc-multilib g++-multilib libssl-dev python3-pip libicu-dev

ENV USER=${USER_NAME}

RUN echo "vesc_dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME}
RUN chmod 0440 /etc/sudoers.d/${USER_NAME}

RUN mkdir /vesc_dev/vesc_builds
RUN mkdir /vesc_dev/vesc_builds/vesc_express

RUN chown -R ${USER_NAME}:${USER_NAME} /${USER_NAME}
RUN mkdir /vesc_dev_scripts
RUN chown -R vesc_dev:vesc_dev /vesc_dev_scripts
USER ${USER_NAME}

RUN pip install Mako mako-render

#RUN export PATH=$PATH:/home/vesc_dev_scripts/.local/bin
RUN cd /vesc_dev_scripts
RUN git clone https://github.com/mxe/mxe.git
RUN cd /vesc_dev/mxe
RUN make qtbase -j 8

COPY get_vesc.sh /vesc_dev_scripts
COPY get_vesc_float.sh /vesc_dev_scripts
COPY build_vesc.sh /vesc_dev_scripts
COPY build_vesc_express.sh /vesc_dev_scripts
COPY build_all.sh /vesc_dev_scripts
COPY ./docker-entrypoint.sh /

# Set the entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]
