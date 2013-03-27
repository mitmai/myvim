#!/bin/sh
#  Copyright (C) 2013,  Three Ocean (to@bcloud.us)
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

INSTALL_PATH=$( cd $(dirname $0); pwd )
# 0. check
if [ -f "$HOME/.vimrc" ] || [ -h "$HOME/.vimrc" ]; then
  echo "Please backup your .vimrc and .vim before setup"
  exit 1
fi

if [ -d "$HOME/.vim" ] || [ -h "$HOME/.vim" ]; then
  echo "Please backup your .vim before setup"
  exit 1
fi

echo "Installed path $INSTALL_PATH. Now, seting up your vim environment..."

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
if [ ! -f $INSTALL_PATH/myvimrc ]; then
touch $INSTALL_PATH/myvimrc
fi
ln -s $INSTALL_PATH/myvimrc $HOME/.vimrc_$USER
ln -s $INSTALL_PATH/default.vimrc $HOME/.vimrc
ln -s $INSTALL_PATH $HOME/.vim

# 4. plugin related setup
# command-t
echo "Setup Command-T.. See https://github.com/wincent/Command-T for detail"
cd $INSTALL_PATH/bundle/command-t/ruby/command-t
ruby extconf.rb
make

echo "============================================="
echo " You can create your own vimrc .vim/myvimrc  "
echo "============================================="
echo "Done. Enjoy vim!"
