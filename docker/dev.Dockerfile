FROM fedora:35

RUN set -eux; \
    useradd -rm -d /home/default -s /bin/bash -g root -G wheel -u 1001 default; \
    echo '. /home/default/cmd/docker/docker.bashrc' >> /home/default/.bashrc; \
    dnf update -y; \
    dnf install -y \
        curl \
        git \
        gcc \
        mingw64-gcc \
        nano \
        python \
        snapd \
        sudo \
        tar \
    ; \
    dnf clean all;

USER default
WORKDIR /home/default
