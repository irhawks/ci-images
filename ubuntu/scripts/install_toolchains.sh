#!/bin/bash
## ---------------------------------------------------------------------

## common tools for GNU compilation
apt update
apt install -y automake bison flex g++ git make pkg-config libtool
apt install -y libboost-all-dev libevent-dev libssl-dev
apt install -y build-essential

## Database headers
RUN apt install -y libpq-dev

## High performance computing library
apt install -y libsuitesparse-dev

## computing geometry
RUN apt install -y gdal-bin libgdal-dev libproj-dev
gdal-config --version

## protobuf serialization
## 注意版本
apt install -y libprotobuf-dev protobuf-compiler libprotobuf-dev libprotoc-dev
