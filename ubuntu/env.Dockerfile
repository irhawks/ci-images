FROM ubuntu:${UBUNTU_BASE_IMAGE_VERSION}
LABEL maintainer "irhawks <irhawks@163.com>"

ARG UBUNTU_BASE_IMAGE_VERSION
ARG UBUNTU_APT_REMOTE_NAME
ARG REMOTE_RESOURCE_URL
ARG REMOTE_BULKLOAD_URL
ARG REMOTE_FULLLOAD_URL
ARG REMOTE_APTCACHE_URL

COPY scripts ./
RUN bash scripts/change_apt_repository.sh
