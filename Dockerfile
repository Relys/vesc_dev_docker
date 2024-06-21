ARG BASE_IMAGE="ubuntu"
ARG TAG="22.04"
FROM ${BASE_IMAGE}:${TAG}
WORKDIR /vesc_dev

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_NAME=vesc_dev
ARG USER_UID=1337
ARG USER_GID=1337

RUN groupadd ${USER_NAME} --gid ${USER_GID} \
    && useradd -l -m ${USER_NAME} -u ${USER_UID} -g ${USER_GID} -s /bin/bash

RUN apt-get update && apt-get install --no-install-recommends -y \
    bash-completion ca-certificates \
    python3 python-is-python3 python3-venv python3-mako python3-packaging libusb-1.0-0 git wget make zip unzip nano vim xvfb cmake \
    build-essential gcc-arm-none-eabi libnewlib-arm-none-eabi libgl-dev libxcb-xinerama0 \
    qtbase5-dev libqt5svg5-dev qtpositioning5-dev qtconnectivity5-dev libqt5gamepad5-dev libqt5serialport5-dev qtquickcontrols2-5-dev qtbase5-private-dev

RUN apt-get install --no-install-recommends -y \
    p7zip-full autoconf automake autopoint bison flex \
    libgdk-pixbuf2.0-dev gperf intltool libtool-bin lzip ruby gcc-multilib g++-multilib libssl-dev python3-pip libicu-dev openjdk-8-jdk

# Create and activate virtual environment, upgrade pip and install required Python packages
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    /opt/venv/bin/pip install --upgrade pip && \
	/opt/venv/bin/pip install packaging && \
    /opt/venv/bin/pip install mako && \
	/opt/venv/bin/pip install mako-render

# Clone and build MXE ensuring the virtual environment is active
RUN . /opt/venv/bin/activate && \
    git clone https://github.com/mxe/mxe.git /opt/mxe2 && \
    cd /opt/mxe2 && \
    make qtbase qtserialport qtconnectivity qtquickcontrols qtquickcontrols2 qtserialbus qtlocation qtgamepad qtgraphicaleffects -j 8

# Install ESP-IDF
RUN . /opt/venv/bin/activate && \
    git clone --recursive https://github.com/espressif/esp-idf.git /opt/esp-idf && \
    cd /opt/esp-idf && \
    ./install.sh

# Install nRF5 SDK
RUN . /opt/venv/bin/activate && \
    wget https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip -P /opt && \
    unzip /opt/nRF5_SDK_15.3.0_59ac345.zip -d /opt && \
    mv /opt/nRF5_SDK_15.3.0_59ac345 /opt/nrf5_sdk && \
    rm /opt/nRF5_SDK_15.3.0_59ac345.zip

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENV USER=${USER_NAME}

RUN echo "vesc_dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME}
RUN chmod 0440 /etc/sudoers.d/${USER_NAME}

RUN chown -R ${USER_NAME}:${USER_NAME} /${USER_NAME}
RUN mkdir /vesc_dev_scripts
RUN chown -R vesc_dev:vesc_dev /vesc_dev_scripts
USER ${USER_NAME}
RUN . /opt/venv/bin/activate && python /opt/esp-idf/tools/idf_tools.py install-python-env
RUN . /opt/venv/bin/activate && python /opt/esp-idf/tools/idf_tools.py install
COPY get_vesc.sh /vesc_dev_scripts
COPY build_vesc.sh /vesc_dev_scripts
COPY build_vesc_express.sh /vesc_dev_scripts
COPY build_nrf52_vesc.sh /vesc_dev_scripts
COPY build_all.sh /vesc_dev_scripts

# Set the entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]
