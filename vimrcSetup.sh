#!/bin/bash
# This script sets up vimrc
sudo apt install dos2unix

git clone https://github.com/Dru89/vim-adventurous.git
cd vim-adventurous/colors
dos2unix *.vim
mkdir ~/.vim
mkdir ~/.vim/colors
cp *.vim ~/.vim/colors
cd ../..
sudo rm -r vim-adventurous
echo "Colorscheme has been set to vim-adventurous"

echo "set cursorline
set tabstop=4
set softtabstop=4
set expandtab
colorscheme adventurous
set number
set showcmd
set wildmenu
set showmatch
set incsearch
set hlsearch
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>" >> ~/.vimrc
echo "Vimrc has been successfully setup!"
