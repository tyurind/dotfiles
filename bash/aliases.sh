
##
## Aliases
##


# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias ls='ls --color=auto' #--file-type       # show differences in colour
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
# alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -hAl -v --file-type --color=auto --group-directories-first --time-style=+%h\ %d\ %R'
alias ..='cd ..'
# -----------------------------------------------------------------------------
#
# alias ls='ls -F --color=always'
# alias dir='dir -F --color=always'
# alias ll='ls -l'
# alias cp='cp -iv'
# alias rm='rm -i'
# alias mv='mv -iv'
# alias grep='grep --color=auto -in'
alias ..='cd ..'



