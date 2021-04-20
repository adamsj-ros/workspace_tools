#!/usr/bin/env zsh

script_path=${0:a:h}
ln -sf $script_path/zsh_aliases $HOME/.zsh_aliases
ln -sf $script_path/zshrc $HOME/.zshrc
ln -sf $script_path/zsh_aliases $HOME/.bash_aliases
