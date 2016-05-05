#!/bin/bash


# DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )

# echo $DIR

# php -r 'print_r($_SERVER); echo __FILE__;'

# echo "${BASH_SOURCE[0]}"
# echo $(dirname "${BASH_SOURCE[0]}")

# DIR=$(pwd)
# echo $DIR

# VAR_LENGTH=${#DIR}
# echo $VAR_LENGTH

# if [[ (($VAR_LENGTH > 10)) ]]; then
#     echo "Больше 10"
#     echo "...${PWD: -10}"
# else
#     echo "Меньше 10"
# fi

__is_root()
{
    if [ $(id -u) == "0" ]; then
        echo "$bold$red"
    fi
}

__m_path()
{
    DIR="$1"
    # if [[ "$DIR" == "" ]]; then
        # DIR=$(pwd)
    # fi
    DIR="${DIR/${HOME}/~}"
    # echo $DIR

    VAR_LENGTH=${#DIR}
    # echo $VAR_LENGTH

    if [[ (($VAR_LENGTH > 40)) ]]; then
        # echo "Больше 10"
        # echo "...${PWD: -10}"
        DIR="...${DIR: -30}"
        # else
        # echo "Меньше 10"
    fi

    echo "${DIR}"
}

export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\A\[$black\]]-[\[$green\]$(__is_root)\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]$(__m_path \w)\[$black\]]\[\033[0;33m\]$(__vcs_name) \[\033[00m\]\[$reset\]\n\[$reset\]\$ '
