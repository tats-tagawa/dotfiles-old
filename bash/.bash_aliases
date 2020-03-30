#!/usr/bin/env bash

# easier navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ~='cd ~'

# better ls
# need coreutils to call gls
alias ls='gls --color=always --group-directories-first'
alias la='gls -A --color=always --group-directories-first'
alias ll='gls -Ahl --color=always --group-directories-first'
