#!/bin/bash

# export PS1='\[\e[0;31m\]\u@\h:\w${text}$\[\e[m\] '

SEGMENT_SEPARATOR=$'\ue0b0'

if [[ -x tput ]]; then
    black=$(tput -Txterm setaf 0)
    red=$(tput -Txterm setaf 1)
    green=$(tput -Txterm setaf 2)
    yellow=$(tput -Txterm setaf 3)
    dk_blue=$(tput -Txterm setaf 4)
    pink=$(tput -Txterm setaf 5)
    lt_blue=$(tput -Txterm setaf 6)

    bold=$(tput -Txterm bold)
    reset=$(tput -Txterm sgr0)
fi

# if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi

# ➤'
# ➜ 
# ●
# 


if [ -n "$SSH_CLIENT" ]; then 
    PS1_prefix='\[$reset\]\[$red\]●\[$yellow\] ssh ➜\[$reset\]'
    # PS1="$PS1_prefix $PS1"
    export PS1=$(printf '%s %s', "$PS1_prefix" "$PS1")
    # PS1="$PS1_prefix \[\e]0;\w\a\]\[\e[07;91m\]\u\[\e[00;91m\]@\h:\[\e[0m\]\w\$ "
fi

# fg[black]=$(tput -Txterm setab 0)     
# fg[red]=$(tput -Txterm setab 1)     
# fg[green]=$(tput -Txterm setab 2)     
# fg[yellow]=$(tput -Txterm setab 3)     
# fg[blue]=$(tput -Txterm setab 4)     
# fg[magenta]=$(tput -Txterm setab 5)     
# fg[cyan]=$(tput -Txterm setab 6)     
# fg[white]=$(tput -Txterm setab 7)     

