#!/usr/bin/env bash

srcDir=/vagrant/home
destDir=/home/vagrant

main(){
  apt-get update
  install_git
  link_bash_files
  link_vim_files
  link_git_files
}

install_git(){
  apt-get -y install git
}

link_bash_files(){
  symlink_file $srcDir/bash_profile $destDir/.bash_profile
}

link_vim_files(){
  symlink_file $srcDir/vimrc $destDir/.vimrc
  symlink_dir $srcDir/vim $destDir/.vim 
}

link_git_files(){
  symlink_file $srcDir/gitconfig $destDir/.gitconfig
}

symlink_file(){
  if [ ! -f $2 ]; then
    ln -s $1 $2
  fi
}

symlink_dir(){
  if [ ! -d $2 ]; then
    ln -s $1 $2
  fi
}

main
