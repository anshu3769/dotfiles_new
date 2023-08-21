#!/bin/bash

# Default .profile
# Original Author: Samuel Roeca
#
# WARNING: if you insert a bug into this file, you may have trouble logging in
# to your OS
#
# Use this file to:
#   Configure your terminal colors
#   Add environment variables
#   Append directories to your path and configure pyenv, nodeenv, etc
#   Note: do NOT place sensitive information (like passwords) in this file
# if using vim:
#   za: toggle one fold
#   zi: toggle all folds

# Source the bashrc by default
#if [ -n "$BASH_VERSION" ] && [ -f $HOME/.bashrc ]; then
#   source $HOME/.bashrc
#fi
export SHELL=/bin/zsh

export PATH="$HOME/.asdf/installs/poetry/1.0.5/bin:$PATH"

export PATH="$HOME/.asdf/installs/poetry/0.12.17/bin:$PATH"

export PATH="$HOME/.asdf/installs/poetry/1.0.9/bin:$PATH"

export PATH="$HOME/.asdf/installs/poetry/1.1.4/bin:$PATH"
