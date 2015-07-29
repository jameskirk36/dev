#!/usr/bin/env bash

srcDir=/vagrant/home
destDir=/home/vagrant

main(){
  sudo apt-get update
  sudo apt-get -y install unzip git ruby1.9.1-dev ruby1.9.1 bundler ctags mono-complete fsharp 
  link_bash_files
  link_vim_files
  link_git_files
  install_vim_plugins

  print_super_crab
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

install_vim_plugins(){
  echo 'installing vim plugins'
  vim +PlugInstall +qa &>/dev/null
  echo 'finished installing vim plugins'
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

function print_super_crab(){
  echo "   _      _  " 
  echo "  (<      >) "
  echo "   'O,99,O'  "
  echo "  //-\__/-\\ " 
  echo "Dev environment ready!"
}

# start here
echo "Running as user: "
whoami
  
uid=$(id -u)
if [ $uid -eq 0 ]; then
  echo "Switching to user: vagrant"
  sudo -u vagrant -i $0 "$@"  
else
  main
fi
