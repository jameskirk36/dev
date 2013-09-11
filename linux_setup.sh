#!/bin/bash

# Vim setup
vimdir=".vim"
cp -v vim/vim_dev_rc ~/.vim_dev_rc
if [ ! -d '~/$vimdir/' ]; then 
	#echo "~/$vimdir/ directory does not exist!!!!!!"
	mkdir -v ~/$vimdir/
	if [ ! -d '~/$vimdir/syntax' ]; then 
		#echo "~/$vimdir/syntax directory does not exist!!!!!!"
		mkdir -v ~/$vimdir/syntax
	fi
fi
cp -v vim/syntax/* ~/.vim/syntax/

# Shell setup
cp -v shell/bash_dev_rc ~/.bash_dev_rc
