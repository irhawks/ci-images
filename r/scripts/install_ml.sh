#!/bin/bash
Rscript -e 'install.packages("xgboost")'

## ---------------------------------------------------------------------

## 广泛的机器学习软件包

## supplymentary packages
# pvclust, Ward Hierarchical Clustering with Bootstrapped p values
# mclust, Model Based Clustering
RUN Rscript -e "install.packages(c('akmeans', 'ykmeans', 'dbscan', 'pvclust', 'mclust', 'cluster', 'fpc'))"

## deep learning packages/ machine learning packages

RUN Rscript -e "install.packages(c('nnet', 'autoencoder'))"

## ---------------------------------------------------------------------

## 安装keras以及keras的tensorflow后端
## need to install anaconda and python3 to install keras/kerasR
## 官方安装方法：tensorflow, keras包
## 测试keras "library(keras); install_keras()" 

## 安装keras以及keras的tensorflow后端

## need to install anaconda and python3 to install keras/kerasR
## <https://www.leiphone.com/news/201709/re4JZHiylYVS50dz.html>上面有R语言Keras>教程。使用时似乎比Python更简洁。
## keras安装需要conda3的支持，以及从google官网上下载tensorflow.
RUN Rscript -e "install.packages(c('tensorflow', 'keras', clean=TRUE, Ncpus=4))"

#RUN Rscript -e "library(keras); install_keras()" 

## 有Keras的离线的库
# RUN Rscript -e "library(keras); mnist <- dataset_mnist()"


## ---------------------------------------------------------------------

## H2O
# install R package dependencies for H2O
RUN Rscript -e 'install.packages(c("methods","statmod","stats","graphics","RCurl","jsonlite","tools","utils"))'

ARG rh2o_version=3.14.0.7
ARG rh2o_filename=h2o_${rh2o_version}.tar.gz
ARG rh2o_url=${bulkload_url}/h2o/$rh2o_filename

RUN wget -c $rh2o_url && R CMD INSTALL $rh2o_filename && rm $rh2o_filename
