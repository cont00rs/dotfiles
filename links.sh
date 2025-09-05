#!/bin/bash

ln -s $(pwd)/bash/.bashrc ~/.bashrc
ln -s $(pwd)/vim/.vimrc ~/.vimrc
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config
mkdir -p ~/.config/git
mkdir -p ~/.config/mise
mkdir -p ~/.config/wezterm

ln -sv $(pwd)/config/git/config ~/.config/git/config
ln -sv $(pwd)/config/mise/config.toml ~/.config/mise/config.toml
ln -sv $(pwd)/config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

ln -sv $(pwd)/config/nvim ~/.config/nvim

mkdir -p deps

# Clone/pull fzf-git integration.
# https://github.com/junegunn/fzf-git.sh
(
    cd deps
    git -C fzf-git pull || git clone https://github.com/junegunn/fzf-git.sh fzf-git
    cp fzf-git/fzf-git.sh ~/.local/bin/
)
