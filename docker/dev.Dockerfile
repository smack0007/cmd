FROM fedora:35

COPY docker.bashrc /root/docker.bashrc

RUN set -eux; \
    dnf update -y; \
    dnf install -y \
        curl \
        git \
        gcc \
        mingw64-gcc \
        nano \
        tar \
    ; \
    dnf clean all; \
    echo '. /root/docker.bashrc' >> ~/.bashrc;