#!/bin/sh
INSTALL_PATH=$( cd $(dirname $0); pwd )
# 0. check
if [ -f $HOME/.vimrc ]; then
  echo "Please backup your .vimrc and .vim before setup"
  exit 1
fi

if [ -d $HOME/.vim ]; then
  echo "Please backup your .vim before setup"
  exit 1
fi

echo "Your installed path is $INSTALL_PATH. Now, seting up your vim environment..."

# 1. Everything is ok, let's get submodule
cd $INSTALL_PATH
git submodule update --init

# 2. link pathogen for runtime
if [ -d $INSTALL_PATH/autoload ]; then
  rm -rf $INSTALL_PATH/autoload
fi
mkdir $INSTALL_PATH/autoload

ln -s $INSTALL_PATH/tools/pathogen/autoload/pathogen.vim $INSTALL_PATH/autoload/pathogen.vim

# 3. link .vimrc and .vim
ln -s $INSTALL_PATH/default.vimrc $HOME/.vimrc
ln -s $INSTALL_PATH $HOME/.vim

echo "Done. Enjoy vim!"
