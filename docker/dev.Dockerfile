FROM fedora:35

RUN set -eux; \
    dnf update -y; \
    dnf install -y \
        gcc \
        mingw64-gcc \
    ; \
    rm -rf /var/lib/apt/lists/*;