FROM ubuntu:18.04
LABEL maintainer "irhawks <irhawks@163.com>"

ARG CI_CRAN_REMOTE_NAME=${CI_CRAN_REMOTE_NAME}
ENV CI_CRAN_REMOTE_NAME=${CI_CRAN_REMOTE_NAME}

ADD scripts /root/scripts
RUN scripts/ubuntu_add_cran.sh
