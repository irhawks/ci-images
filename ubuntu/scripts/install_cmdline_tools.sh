#!/bin/bash
## ---------------------------------------------------------------------

## curl and wget can be ommited, install common tools
apt update
apt install -y curl wget
apt install -y bash-completion vim git man zip unzip p7zip-full rar unrar
apt install -y net-tools iputils* 

## GNU Privacy Guard
apt install -y dirmngr

# RUN apt install -y software-properties-common build-essential

## Plug Plugin management

## 变量为空时进行设置
VIM_PLUG_REMOTE_URL=${VIM_PLUG_REMOTE_URL:="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"}
#ARG vim_plug_url="http://repo:9990/hardwire/HOME%2B.vim/autoload/plug.vim"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs $VIM_PLUG_REMOTE_URL
#RUN wget -O ~/.vimrc ${resource_url}/hardwire/HOME+.vimrc[Plug]
#RUN vim +PlugInstall +quit +quit

## Vundle Plugin management
#ARG VUNDLE="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
#RUN \
#  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&\
#  vim +PluginInstall +quit +quit
