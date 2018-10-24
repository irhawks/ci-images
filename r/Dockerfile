FROM docker.nexus.irhawks.com/irhawks/ubuntu/base:18.04v20181024
LABEL maintainer "irhawks <irhawks@163.com>"

ARG CI_CRAN_REMOTE_NAME=${CI_CRAN_REMOTE_NAME}
ENV CI_CRAN_REMOTE_NAME=${CI_CRAN_REMOTE_NAME}

ADD scripts ./scripts
RUN scripts/ubuntu_add_cran.sh
RUN scripts/install_r_dev.sh
