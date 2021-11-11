#!/usr/bin/env zsh

script_path=${0:a:h}
if [ ! -f $HOME/.zsh_aliases ]; then
    ln -sf $script_path/sh_aliases $HOME/.zsh_aliases
fi
if [ ! -f $HOME/.zshrc ]; then
    ln -sf $script_path/zshrc $HOME/.zshrc
fi
if [ ! -f $HOME/.bash_aliases ]; then
    ln -sf $script_path/sh_aliases $HOME/.bash_aliases
fi
if [ ! -f $HOME/.bashrc ]; then
    ln -sf $script_path/bashrc $HOME/.bashrc
fi
if [ ! -f $HOME/.p10k.zsh ]; then
    ln -sf $script_path/p10k.zsh $HOME/.p10k.zsh
fi
