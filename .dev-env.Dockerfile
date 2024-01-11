# TODO: replace build from sources to package install
FROM mcr.microsoft.com/devcontainers/base:jammy as build-uncrustify

ARG UNCRUSTIFY_VER=0.78.1

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install --no-install-recommends -y \
        g++ \
        cmake \
        make

RUN cd /usr/src \
    && wget https://codeload.github.com/uncrustify/uncrustify/zip/refs/tags/uncrustify-${UNCRUSTIFY_VER} \
      -O uncrustify.zip \
    && unzip uncrustify.zip \
    && cd uncrustify-uncrustify-${UNCRUSTIFY_VER} \
    && mkdir -p build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .. \
    && cmake --build . --target install --config Release \
    && cd /usr/src \
    && rm -rf uncrustify.zip uncrustify-uncrustify-${UNCRUSTIFY_VER}

# TODO: replace build from sources to package install
FROM mcr.microsoft.com/devcontainers/base:jammy as build-vala-lint

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install --no-install-recommends -y \
        valac \
        meson \
        # vala-lint build deps
        libvala-0.56-dev \
        libjson-glib-dev

RUN cd /usr/src \
    && wget https://codeload.github.com/vala-lang/vala-lint/zip/refs/heads/master \
      -O vala-lint.zip \
    && unzip vala-lint.zip \
    && cd vala-lint-master \
    && meson build --prefix=/usr \
    && cd build \
    && ninja \
    && ninja install \
    && cd /usr/src \
    && rm -rf vala-lint.zip vala-lint-master

FROM mcr.microsoft.com/devcontainers/base:jammy

COPY --from=build-vala-lint /usr/bin/io.elementary.vala-lint /usr/bin/
COPY --from=build-vala-lint /usr/lib/x86_64-linux-gnu/libvala-linter* /usr/lib/x86_64-linux-gnu/

COPY --from=build-uncrustify /usr/bin/uncrustify /usr/bin/

RUN echo 'deb http://download.opensuse.org/repositories/home:/Prince781/xUbuntu_22.04/ /' \
  | sudo tee /etc/apt/sources.list.d/home:Prince781.list \
  && curl -fsSL https://download.opensuse.org/repositories/home:Prince781/xUbuntu_22.04/Release.key \
  | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_Prince781.gpg > /dev/null

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install --no-install-recommends -y \
        valac \
        gjs \
        meson \
        libopenhmd-dev \
        gobject-introspection \
        libgirepository1.0-dev \
        vala-language-server
        # Built newer version
        # uncrustify
