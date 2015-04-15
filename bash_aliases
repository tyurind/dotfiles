# bash
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )

##
## Shell Options
##
set meta-flag on
set convert-meta off
set input-meta on
set output-meta on

export EDITOR=vim


##
## IncludeSource files
##
source  "$DIR/bash/function.sh"
source  "$DIR/bash/history.sh"
source  "$DIR/bash/aliases.sh"
source  "$DIR/bash/color.sh"
##
## /END IncludeSource
##

