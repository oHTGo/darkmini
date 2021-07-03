#!/bin/bash

# Check if rEFInd is installed or not
if apt list refind | grep -q "refind"; then
    printf "'rEFInd' is already installed\n"
else
    # Install rEFInd
    apt-add-repository ppa:rodsmith/refind -y
    apt-get update
    apt-get install refind
fi

PATH_SCRIPT=$PWD

cd ~
cd ..
cd boot/efi/EFI/refind

# Check if a directory does not exist
if [ ! -d "themes" ] 
then
    printf "folder 'themes' does not exist, will be created\n"
    mkdir themes
else
    printf "folder 'themes' exists\n"
fi

# Overwrite theme 'darkmini'
rm -r themes/darkmini
cp -r $PATH_SCRIPT themes/darkmini

# Check if 'darkmini' has been added or not
if [ "$(grep 'include themes/darkmini/theme-mini.conf' refind.conf)" == "" ]; then
    printf "'darkmini' has been added\n"
    printf "\ninclude themes/darkmini/theme-mini.conf" >> refind.conf
else
    printf "theme 'darkmini' was added"
fi
