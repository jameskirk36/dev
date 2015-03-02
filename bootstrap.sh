#!/usr/bin/env bash

srcDir=/vagrant/home
targetDir=/home/vagrant

function main(){
  link_bash_files
  link_vim_files
}

function link_bash_files(){
  ln -s $srcDir/bash_profile $targetDir/.bash_profile
}

function link_vim_files(){
  ln -s $srcDir/vimrc $targetDir/.vimrc
  ln -s $srcDir/vim $targetDir/.vim
}

main
