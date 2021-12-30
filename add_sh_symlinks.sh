#!/usr/bin/env zsh

#oh-my-zsh
curlfound=0
omz=0
if [ ! -d $HOME/.oh-my-zsh ];then
    which curl
    if [ $? -eq 0 ];then
        echo "installing oh-my-zsh via curl"
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        curlfound=1
        omz=1
    fi
    which wget
    if [  $? -eq 0 ] && [ "$curlfound" = 0 ]; then
        echo "installing oh-my-zsh via wget"
        sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
        omz=1
    fi
fi

#p10k theme
if [ "$omz" = 1 ] && [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ];then
    echo "installing p10k theme for oh-my-zsh"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

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
