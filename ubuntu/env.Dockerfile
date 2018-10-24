FROM ubuntu:18.04
LABEL maintainer "irhawks <irhawks@163.com>"

ARG UBUNTU_BASE_IMAGE_VERSION=${UBUNTU_BASE_IMAGE_VERSION}
ENV UBUNTU_BASE_IMAGE_VERSION=${UBUNTU_BASE_IMAGE_VERSION}

ARG UBUNTU_APT_REMOTE_NAME=${UBUNTU_APT_REMOTE_NAME}
ENV UBUNTU_APT_REMOTE_NAME=${UBUNTU_APT_REMOTE_NAME}

ARG REMOTE_RESOURCE_URL
ARG REMOTE_BULKLOAD_URL
ARG REMOTE_FULLLOAD_URL
ARG REMOTE_APTCACHE_URL

ADD scripts ./scripts
RUN ls ~/
RUN pwd
RUN scripts/change_apt_repository.sh
RUN scripts/install_ssh_daemon.sh
RUN scripts/install_locales.sh
RUN scripts/install_cmdline_tools.sh
#RUN bash scripts/install_daemons.sh

RUN scripts/install_toolchains.sh

