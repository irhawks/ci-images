## ---------------------------------------------------------------------

RUN \
  echo "deb ${mirror_proxy_cran}/ubuntu xenial/" > /etc/apt/sources.list.d/cran.list &&\ 
  gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 &&\ 
  gpg -a --export E084DAB9 | apt-key add - &&\ 
  apt update && apt clean

RUN echo "r <- getOption('repos'); r['CRAN'] <- '${mirror_proxy_cran_packages}'; options(repos=r)" >> /root/.Rprofile


## ---------------------------------------------------------------------

## Configura CRAN mirrors, permanant CRAN mirrors
#ARG CRAN_PROXY_URL=http://mirrors.tuna.tsinghua.edu.cn/CRAN

# RUN wget -qO- "${resource_url}/hardwire/HOME+.Rprofile[tstinghua]" > ~/.Rprofile

## or your can precisely use
# RUN echo 'options(repos=structure(c(CRAN="YOUR FAVORITE MIRROR")))' > ~/.Rprofile

