


# History Options
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILESIZE=10000

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:dir:www *:history*' # Ignore the ls command as well
export PROMPT_COMMAND="history -a"
