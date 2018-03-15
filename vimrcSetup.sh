#!/bin/bash
# This script sets up vimrc

FUNCTIONS=("DownloadColorScheme" "SetVimrc")
RED='\033[1;31m'
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

COMMANDS=\
"set cursorline
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
nnoremap $ <nop>
hi clear CursorLine
hi CursorLine gui=underline cterm=underline"

################################################################################
# Main
################################################################################
vimrcSetup () {
    sudo apt-get update
    sudo apt install dos2unix

    rm ~/.vimrc

    for (( i=0; i<${#FUNCTIONS[@]}; i++ )); do
        if ${FUNCTIONS[$i]} ; then
            check[$i]=1
        else
            check[$i]=0
        fi
    done

    CheckProcesses
}

################################################################################
# Download Color Scheme
################################################################################
DownloadColorScheme () {
    git clone https://github.com/Dru89/vim-adventurous.git
    cd vim-adventurous/colors
    dos2unix *.vim
    mkdir ~/.vim/colors
    cp *.vim ~/.vim/colors
    cd ../..
    sudo rm -r vim-adventurous
}

################################################################################
# Set Vimrc
################################################################################
SetVimrc () {
    echo "$COMMANDS" >> ~/.vimrc
}

################################################################################
# Check Processes
################################################################################
CheckProcesses () {
    printf "\n"
    printf "%20s | Status\n" "Process"
    printf "_____________________|_________\n"
    for (( i=0; i<${#FUNCTIONS[@]}; i++ )); do
        if [ ${check[i]} -eq 1 ]; then
            printf "%20s | ${GREEN}Success${NO_COLOR}\n" ${FUNCTIONS[i]}
        else
            printf "%20s | ${RED}Failure${NO_COLOR}\n" ${FUNCTIONS[i]}
        fi
    done
    printf "\n"
}

vimrcSetup
