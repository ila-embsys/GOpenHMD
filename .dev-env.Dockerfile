FROM mcr.microsoft.com/devcontainers/base:jammy

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install --no-install-recommends -y \
        valac \
        gjs \
        meson \
        libopenhmd-dev \
        gobject-introspection \
        libgirepository1.0-dev
