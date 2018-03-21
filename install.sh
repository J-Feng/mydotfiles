#!/bin/sh

# Backup if already exist
if [ -d "~/.vim" ]; then
    mv ~/.vim ~/.vim.bak
fi

if [ -f "~/.vimrc" ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi

if [ -f "~/.gvimrc" ]; then
    mv ~/.gvimrc ~/.gvimrc.bak
fi

ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gvimrc ~/.gvimrc

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
