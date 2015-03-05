#!/usr/bin/env bash

srcDir=/vagrant/home
destDir=/home/vagrant

main(){
  switch_to_vagrant_user
  apt-get update
  apt-get -y install git
  link_bash_files
  link_vim_files
  link_git_files
  clone_git_submodules
  install_vim_plugins
  vim_plugin_vimproc_make
}

switch_to_vagrant_user(){
  uid=$(id -u)
  if [ $uid -eq 0 ]; then 
    sudo -u vagrant -i $0 "$@"
  fi
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

clone_git_submodules(){
  pushd .
  cd $srcDir
  git submodule update --init
  popd
}

install_vim_plugins(){
  echo 'installing vim plugins'
  vim +PluginInstall +qa &>/dev/null
  echo 'finished installing vim plugins'
}

vim_plugin_vimproc_make(){
  pushd .
  cd $srcDir/vim/bundle/vimproc.vim
  make 
  popd
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

echo "   _      _  " 
echo "  (<      >) "
echo "   'O,99,O'  "
echo "  //-\__/-\\ " 
echo "Dev environment ready!"
