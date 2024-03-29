# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#custom theme https://github.com/romkatv/powerlevel10k.git in .oh-my-zsh/custom/themes
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
		git-flow # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-flow
		git-flow-avh #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-flow-avh
		docker
		fzf # https://github.com/junegunn/fzf/blob/master/README.md#usage
		tmux #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
		tmuxinator
		web-search #alias|grep web
		command-not-found
		jira #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jira
		history #h hs (grep) and hsi (grep -i)
		sudo # esc esc adds sudo to previous command
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.zsh_aliases

if [ `uname` = "Darwin" ];then
	#echo "I'm on a mac"
	export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
	export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/usr/local/opt/qt
	export PATH=$PATH:/usr/local/opt/qt/bin
	export OPENSSL_ROOT_DIR=$(brew --prefix openssl)
	export PATH=$HOME/bin/kdiff3.app/Contents/MacOS:$PATH
	export PATH=/usr/local/sbin:$PATH
	. $HOME/ros2_foxy/ros2-osx/setup.zsh &> /dev/null
	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# elif [ `uname` = "Linux" ];then
fi

export PATH=$HOME/bin/:$PATH
export PATH=$HOME/workspace_tools/:$PATH
export PATH=/opt/bcc/jre/bin/:$PATH

setopt shwordsplit

# To customize prompt, run `p10k configure` or edit ~/workspace_tools/p10k.zsh.
[[ ! -f ~/workspace_tools/p10k.zsh ]] || source ~/workspace_tools/p10k.zsh

export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1

#export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export COLCON_DEFAULTS_FILE=/home/jadams/reference/autoware_ws/src/AutowareAuto/tools/ade_image/colcon-defaults.yaml
# export ROS_DOMAIN_ID=3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval

eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 r)"
eval "$(register-python-argcomplete3 colcon)"

ulimit -c unlimited

export PATH=$PATH:/usr/local/spark/bin
export PATH=$PATH:/snap/bin
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=/opt/ros/rolling/
export PATH=$PATH:/home/jadams/.local/bin
