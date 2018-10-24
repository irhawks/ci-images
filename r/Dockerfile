#FROM docker.nexus.irhawks.com/irhawks/ubuntu/base:18.04v20181024
FROM upload.docker.nexus.irhawks.com/irhawks/ubuntu:18.04-base
LABEL maintainer "irhawks <irhawks@163.com>"

ARG CRAN_REMOTE_NAME=${CRAN_REMOTE_NAME}
ENV CRAN_REMOTE_NAME=${CRAN_REMOTE_NAME}

ADD scripts ./scripts
RUN scripts/ubuntu_add_cran.sh
RUN scripts/install_r_dev.sh
