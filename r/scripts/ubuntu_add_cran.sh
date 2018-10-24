#!/bin/bash
## ---------------------------------------------------------------------

echo "deb ${CRAN_REMOTE_NAME}/ubuntu xenial/" > /etc/apt/sources.list.d/cran.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | apt-key add -
apt update

echo "r <- getOption('repos'); r['CRAN'] <- '${CRAN_REMOTE_NAME}'; options(repos=r)" >> /root/.Rprofile


## ---------------------------------------------------------------------

## Configura CRAN mirrors, permanant CRAN mirrors
#ARG CRAN_PROXY_URL=http://mirrors.tuna.tsinghua.edu.cn/CRAN

# RUN wget -qO- "${resource_url}/hardwire/HOME+.Rprofile[tstinghua]" > ~/.Rprofile

## or your can precisely use
# RUN echo 'options(repos=structure(c(CRAN="YOUR FAVORITE MIRROR")))' > ~/.Rprofile

