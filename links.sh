#!/bin/bash

ln -s $(pwd)/bash/.bashrc ~/.bashrc
ln -s $(pwd)/vim/.vimrc ~/.vimrc
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/git
mkdir -p ~/.config/ghostty

ln -s $(pwd)/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s $(pwd)/config/ghostty/config ~/.config/ghostty/config
ln -s $(pwd)/config/git/config ~/.config/git/config
ln -sv $(pwd)/config/starship.toml  ~/.config/
ln -s $(pwd)/config/nvim ~/.config/nvim
