#!/bin/sh
INSTALL_PATH=$1
ln -s $INSTALL_PATH/default.vimrc ~/.vimrc
ln -s $INSTALL_PATH ~/.vim
