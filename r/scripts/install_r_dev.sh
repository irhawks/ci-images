#!/bin/bash
## ---------------------------------------------------------------------

## use precompiled r packages from CRAN mirrors instead of ubuntu office release
## use dirmngr to avoid gpg errors
## install r for ubuntu 17.04 zesty
## require dirmngr &&\

DEBIAN_FRONTEND=noninteractive apt update
DEBIAN_FRONTEND=noninteractive apt install -y -q --no-install-recommends r-base r-base-dev

## ---------------------------------------------------------------------

## Development environment for R source packages

Rscript -e "install.packages(c('Rcpp', 'devtools'))"

## <https://github.com/rocker-org/rocker/blob/master/r-devel/Dockerfile>

## 给出的r-dev所需要的软件包

#apt-get install -t unstable -y --no-install-recommends \
#		bash-completion \
#		bison \
#		debhelper \
#		default-jdk \
#		g++ \
#		gcc \
#		gdb \
#		gfortran \
#		groff-base \
#		libblas-dev \
#		libbz2-dev \
#		libcairo2-dev/unstable \
#		libcurl4-openssl-dev \
#		libjpeg-dev \
#		liblapack-dev \
#		liblzma-dev \
#		libncurses5-dev \
#		libpango1.0-dev \
#		libpcre3-dev \
#		libpng-dev \
#		libreadline-dev \
#		libtiff5-dev \
#		libx11-dev \
#		libxt-dev \
#		mpack \
#		subversion \
#		tcl8.6-dev \
#		texinfo \
#		texlive-base \
#		texlive-extra-utils \
#		texlive-fonts-extra \
#		texlive-fonts-recommended \
#		texlive-generic-recommended \
#		texlive-latex-base \
#		texlive-latex-extra \
#		texlive-latex-recommended \
#		tk8.6-dev \
#		x11proto-core-dev \
#		xauth \
#		xdg-utils \
#		xfonts-base \
#		xvfb \
#zlib1g-dev

## 上面是编译R的时候所考虑到的各个软件包（我们不妨参照R编译时的需求，构建R开发的环境
