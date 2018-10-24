## ---------------------------------------------------------------------

## 需求：首先安装好Hadoop以及Spark环境并具有相应的环境变量

ARG cran_mirror_proxy_hadoop=${fullload_url}/miniCRAN
RUN echo "r <- getOption('repos'); r['CRAN'] <- '${mirror_proxy_cran_packages}'; options(repos=r)" >> /root/.Rprofile
RUN echo "options(Ncpus=4)" >> /root/.Rprofile

## ---------------------------------------------------------------------

## install development environment for R (general purpose dev tools)
## automake bison flex g++ git libboost-all-dev libevent-dev libssl-dev libtool make pkg-config

## install and configure R
## 注意在javareconf之后再安装rJava (RHadoop)
## RMR安装期间还会下载apache-ant-1.9.2-bin.tar.gz

RUN R CMD javareconf
RUN Rscript -e 'install.packages(c("reshape2", "Rcpp", "iterators", "itertools", "digest", "RJSONIO", "functional", "rJava"))'
RUN R CMD javareconf

RUN Rscript -e 'install.packages(c("caTools"))'

ARG name_rhdfs=rhdfs_1.0.8.tar.gz
ARG name_rmr2=rmr2_3.3.1.tar.gz
ARG name_ravro=ravro_1.0.4.tar.gz

## Ravro需要bit64以及rjson这两个包
RUN Rscript -e 'install.packages(c("bit64", "rjson"))'

## install ravro_1.0.4 if you would like to
RUN \
  wget -c ${cran_mirror_proxy_hadoop}/src/contrib/$name_rhdfs &&\
  wget -c ${cran_mirror_proxy_hadoop}/src/contrib/$name_rmr2 &&\
  wget -c ${cran_mirror_proxy_hadoop}/src/contrib/$name_ravro &&\
  R CMD INSTALL $name_rhdfs $name_rmr2 $name_ravro &&\
  rm -rf $name_rdhfs $name_rmr2 $name_ravro


## ---------------------------------------------------------------------

## RHbase

## rhbase需要pkg-config的debian包。以及thrift-compiler还有开发环境
## rhabse需要thrift包。http://www-eu.apache.org/dist/thrift/0.10.0/thrift-0.10.0.tar.gz
## 以及make pkg-config等
## 需要设置JAVA_HOME export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
## 安装好之后pkg-config的配置位置是错的。必须在 cd /usr/local/lib/pkgconfig下的thrift.pc中调整includedir的目录为/usr/local/include/thrift
## 将/usr/local/lib添加到LD_LIBRARY_PATH或者将这个目录加到/et/ld.so.conf里面，使用ldconfig更新

ARG thrift_version=0.10.0
ARG thrift_filename=thrift-${thrift_version}.tar.gz
ARG thrift_url=http://www-eu.apache.org/dist/thrift/${thrift_version}/${thrift_filename}
ARG thrift_url=${bulkload_url}/apache/${thrift_filename}
RUN \
  wget -c $thrift_url && tar zxvf $thrift_filename && rm -rf $thrift_filename &&\
  cd ${thrift_filename%.tar.gz} && ./configure && make -j4 && make install &&\
  perl -pi -e 's{(^includedir=.*/include$)}{$1/thrift}' /usr/local/lib/pkgconfig/thrift.pc &&\
  echo "/usr/local/lib" > /etc/ld.so.conf && ldconfig

ARG name_rhbase=rhbase_1.2.1.tar.gz
## 清理安装过程中的临时文件

RUN \
  wget -c ${cran_mirror_proxy_hadoop}/src/contrib/$name_rhbase &&\
  R CMD INSTALL $name_rhbase &&\
  rm -rf $name_rhbase

## ---------------------------------------------------------------------

## RProtobuf

## auliary files
## libprotobuf-dev protobuf-compiler libprotobuf-dev libprotoc-dev &&\
RUN \
  apt update && apt-get install -y -f r-cran-rcurl && apt clean &&\
  Rscript -e 'install.packages("RProtoBuf")'


## ---------------------------------------------------------------------

## sparklyr

RUN Rscript -e 'install.packages(c("sparklyr"))'

