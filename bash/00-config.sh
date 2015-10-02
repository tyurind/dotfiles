# bash
set meta-flag on
set convert-meta off
set input-meta on
set output-meta on

export EDITOR=vim


if [ -d ~/.local/sbin ]; then
    export PATH="~/.local/sbin:$PATH"
fi
if [ -d ~/.local/bin ]; then
    export PATH="~/.local/bin:$PATH"
fi
if [ -d ~/bin ]; then
    export PATH="~/bin:$PATH"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f ~/.pyrc ]; then
    export PYTHONSTARTUP="${HOME}/.pyrc"
    export PYTHONIOENCODING="UTF-8"
fi
