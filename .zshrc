# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
echo "Welcome to the ZSHELL.."

# Path to your oh-my-zsh installation.
export ZSH="/home/anshu/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="ys"
# ZSH_THEME="dracula"
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker-compose)

#######################################################################
# Set up environment and PATH
#######################################################################

# Functions --- {{{

function zoom-install() {
  sudo apt update
  curl -Lsf https://zoom.us/client/latest/zoom_amd64.deb -o /tmp/zoom_amd64.deb
  sudo apt install /tmp/zoom_amd64.deb
}

function bare_klone() {
  if [[ ! -d ~/kepler-repos/$1 ]]; then
    git clone --bare git@github.com:KeplerGroup/$1.git ~/kepler-repos/$1
  else
    echo "Repo is already kloned!"
  fi
}

function path_ladd() {
  # Takes 1 argument and adds it to the beginning of the PATH
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

function path_radd() {
  # Takes 1 argument and adds it to the end of the PATH
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# }}}
# Exported variable: LS_COLORS --- {{{

# Colors when using the LS command
# NOTE:
# Color codes:
#   0   Default Colour
#   1   Bold
#   4   Underlined
#   5   Flashing Text
#   7   Reverse Field
#   31  Red
#   32  Green
#   33  Orange
#   34  Blue
#   35  Purple
#   36  Cyan
#   37  Grey
#   40  Black Background
#   41  Red Background
#   42  Green Background
#   43  Orange Background
#   44  Blue Background
#   45  Purple Background
#   46  Cyan Background
#   47  Grey Background
#   90  Dark Grey
#   91  Light Red
#   92  Light Green
#   93  Yellow
#   94  Light Blue
#   95  Light Purple
#   96  Turquoise
#   100 Dark Grey Background
#   101 Light Red Background
#   102 Light Green Background
#   103 Yellow Background
#   104 Light Blue Background
#   105 Light Purple Background
#   106 Turquoise Background
# Parameters
#   di 	Directory
LS_COLORS="di=1;37:"
#   fi 	File
LS_COLORS+="fi=0:"
#   ln 	Symbolic Link
LS_COLORS+="ln=1;36:"
#   pi 	Fifo file
LS_COLORS+="pi=5:"
#   so 	Socket file
LS_COLORS+="so=5:"
#   bd 	Block (buffered) special file
LS_COLORS+="bd=5:"
#   cd 	Character (unbuffered) special file
LS_COLORS+="cd=5:"
#   or 	Symbolic Link pointing to a non-existent file (orphan)
LS_COLORS+="or=31:"
#   mi 	Non-existent file pointed to by a symbolic link (visible with ls -l)
LS_COLORS+="mi=0:"
#   ex 	File which is executable (ie. has 'x' set in permissions).
LS_COLORS+="ex=1;92:"
# additional file types as-defined by their extension
LS_COLORS+="*.rpm=90"

# Finally, export LS_COLORS
export LS_COLORS

# }}}
# Exported variables: General --- {{{

# React
export REACT_EDITOR='less'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Configure less (de-initialization clears the screen)
# Gives nicely-colored man pages
export PAGER=less
export LESS='--ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --clear-screen'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# tmuxinator
export EDITOR=nvim
export SHELL=zsh

# environment variable controlling difference between HI-DPI / Non HI_DPI
# turn off because it messes up my pdf tooling
export GDK_SCALE=0

# History: ignore leading space commands, keep lines in memory
export HISTCONTROL=ignorespace
export HISTSIZE=5000

# }}}

source $ZSH/oh-my-zsh.sh

HOME_BIN="$HOME/bin"
if [ -d "$HOME_BIN" ]; then
  path_ladd "$HOME_BIN"
fi

HOME_LOCAL_BIN="$HOME/.local/bin"
if [ ! -d "$HOME_LOCAL_BIN" ]; then
  mkdir -p "$HOME_LOCAL_BIN"
fi
path_ladd "$HOME_LOCAL_BIN"

# EXPORT THE FINAL, MODIFIED PATH
export PATH

# Executes whenever current directory changes
function chpwd(){
  ls --color=auto

  # Finds python environment and activate it
  va
}

function nodedev-install() {
  local env=(
    dockerfile-language-server-nodejs
    git+https://github.com/Perlence/tstags.git
    jsctags
    neovim
    npm
    prettier
    write-good
  )
  npm install --no-save -g $env
  asdf reshim nodejs

}

################################################################################
# Python related setup
################################################################################

# pydev-install: install only env dependencies
# pydev-install dev: install only dev dependencies
# pydev-install all: install all deps
function pydev-install() {  ## Install default python dependencies
  local for_pip=(
    bpython
    neovim-remote
    pip
    pynvim
  )
  pip install -U $for_pip
  asdf reshim python
}

function pyglobal-install() {  ## Install global Python applications
  local for_pipx=(
    black
    cookiecutter
    docker-compose
    isort
    jedi-language-server
    mypy
    pre-commit
    pylint
    restview
    toml-sort
  )
  if command -v pipx > /dev/null; then
    for arg in $for_pipx; do
      pipx install "$arg"
      pipx upgrade "$arg"
    done
  else
    echo 'pipx not installed. Install with "pip install pipx"'
  fi
}

# activate virtual environment from any directory from current and up
# Name of virtualenv
VIRTUAL_ENV_DEFAULT=venv

function va() {
 MAGENTA='\033[0;35m'
 NC='\033[0m' # No Color
 local venv_name="$VIRTUAL_ENV_DEFAULT"
 local old_venv=$VIRTUAL_ENV
 local slashes=${PWD//[^\/]/}
 local current_directory="$PWD"
  for (( n=${#slashes}; n>0; --n ))
  do
    if [ -d "$current_directory/$venv_name" ]; then
      echo " ${MAGENTA} @@@@@@@ FOUND AN ALREADY EXISTING VIRTUAL ENVIRONMENT. PLEASE RUN 've' TO ACTIVATE IT @@@@@@@${NC}"
      # source "$current_directory/$venv_name/bin/activate"
      if [[ "$old_venv" != "$VIRTUAL_ENV" ]]; then
        echo "Activated $(python --version) virtualenv in $VIRTUAL_ENV"
      fi
      return
    fi
    local current_directory="$current_directory/.."
  done
  # If reached this step, no virtual environment found from here to root
  if [[ -z $VIRTUAL_ENV ]]; then
  else
    deactivate
    echo "Disabled existing virtualenv $old_venv"
  fi
}

function ve() {  # Optional arg: python interpreter name
  local venv_name="$VIRTUAL_ENV_DEFAULT"
  if [ -z "$1"  ]; then
    local python_name='python'
  else
    local python_name="$1"
  fi
  if [ ! -d "$venv_name"  ]; then
    $python_name -m venv "$venv_name"
    if [ $? -ne 0  ]; then
      local error_code=$?
      echo "Virtualenv creation failed, aborting"
      return error_code
    fi
    source "$venv_name/bin/activate"
    pip install -U pip
    pydev-install  # install dependencies for editing
    deactivate
  else
    echo "$venv_name already exists, activating"
  fi
  source $venv_name/bin/activate
}
# compdef _command ve

################################################################################
# Aliases
################################################################################

# vpn alias
alias vpn='sudo openvpn --config ~/openvpn/atomar.ovpn'
alias officevpn="sudo netExtender -u atomar@keplergrp.com -d LocalDomain svpn.keplergrp.com:4433"

# to check active hive clusters
alias emr='aws emr list-clusters --active | jq ".Clusters[]"'

# aws vpn alias
alias awsvpn='nmcli c up aws'


################################################################################
# Additional stuff
################################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GO exports
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/anshu/google-cloud-sdk/path.zsh.inc' ]; then . '/home/anshu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/anshu/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/anshu/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf support
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# MANPATH: add asdf man pages to my man path
MANPATH="$HOME/man"
if [ -x "$(command -v fd)"  ]; then
  for value in $(fd man1 ~/.asdf/installs --type directory | sort -hr); do
    MANPATH="$MANPATH:$(dirname $value)"
  done
  # colon at end. See "man manpath"
  export MANPATH="$MANPATH:"
fi

export REDSHIFT_PSWRD="py724KgJtiZBiudF7g4N"

export SHORTCUT_API_TOKEN="5d9b9ac0-46ca-478e-9cd5-088c1ec92239"

# export PATH="$HOME/.asdf/installs/poetry/1.1.4/bin:$PATH"

eval "$(direnv hook zsh)"

export R_EXTRA_CONFIGURE_OPTIONS='--enable-R-shlib --with-cairo'
export PYTHON_CONFIGURE_OPTS='--enable-shared'
