#!/bin/bash

ln -s $(pwd)/bash/.bashrc ~/.bashrc
ln -s $(pwd)/vim/.vimrc ~/.vimrc
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/git

ln -s $(pwd)/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s $(pwd)/config/git/config ~/.config/git/config
ln -s $(pwd)/config/nvim ~/.config/nvim
