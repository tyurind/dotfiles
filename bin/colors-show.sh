#!/bin/bash

# See: https://misc.flogisoft.com/bash/tip_colors_and_formatting

showfull()
{
echo "#### 3Xm: ==>>"
echo -e "  \033[00;30m 00;30m \033[00m \033[01;30m 01;30m \033[00m \033[02;30m 02;30m \033[00m \033[04;30m 04;30m \033[00m \033[07;30m 07;30m \033[00m \033[09;30m 09;30m \033[00m"
echo -e "  \033[00;31m 00;31m \033[00m \033[01;31m 01;31m \033[00m \033[02;31m 02;31m \033[00m \033[04;31m 04;31m \033[00m \033[07;31m 07;31m \033[00m \033[09;31m 09;31m \033[00m"
echo -e "  \033[00;32m 00;32m \033[00m \033[01;32m 01;32m \033[00m \033[02;32m 02;32m \033[00m \033[04;32m 04;32m \033[00m \033[07;32m 07;32m \033[00m \033[09;32m 09;32m \033[00m"
echo -e "  \033[00;33m 00;33m \033[00m \033[01;33m 01;33m \033[00m \033[02;33m 02;33m \033[00m \033[04;33m 04;33m \033[00m \033[07;33m 07;33m \033[00m \033[09;33m 09;33m \033[00m"
echo -e "  \033[00;34m 00;34m \033[00m \033[01;34m 01;34m \033[00m \033[02;34m 02;34m \033[00m \033[04;34m 04;34m \033[00m \033[07;34m 07;34m \033[00m \033[09;34m 09;34m \033[00m"
echo -e "  \033[00;35m 00;35m \033[00m \033[01;35m 01;35m \033[00m \033[02;35m 02;35m \033[00m \033[04;35m 04;35m \033[00m \033[07;35m 07;35m \033[00m \033[09;35m 09;35m \033[00m"
echo -e "  \033[00;36m 00;36m \033[00m \033[01;36m 01;36m \033[00m \033[02;36m 02;36m \033[00m \033[04;36m 04;36m \033[00m \033[07;36m 07;36m \033[00m \033[09;36m 09;36m \033[00m"
echo -e "  \033[00;37m 00;37m \033[00m \033[01;37m 01;37m \033[00m \033[02;37m 02;37m \033[00m \033[04;37m 04;37m \033[00m \033[07;37m 07;37m \033[00m \033[09;37m 09;37m \033[00m"

echo;
echo "#### 4Xm: ==>>"
echo -e "  \033[00;40m 00;40m \033[00m \033[01;40m 01;40m \033[00m \033[02;40m 02;40m \033[00m \033[04;40m 04;40m \033[00m \033[07;40m 07;40m \033[00m \033[09;40m 09;40m \033[00m \033[00;90m 00;90m \033[00m "
echo -e "  \033[00;41m 00;41m \033[00m \033[01;41m 01;41m \033[00m \033[02;41m 02;41m \033[00m \033[04;41m 04;41m \033[00m \033[07;41m 07;41m \033[00m \033[09;41m 09;41m \033[00m \033[00;91m 00;91m \033[00m "
echo -e "  \033[00;42m 00;42m \033[00m \033[01;42m 01;42m \033[00m \033[02;42m 02;42m \033[00m \033[04;42m 04;42m \033[00m \033[07;42m 07;42m \033[00m \033[09;42m 09;42m \033[00m \033[00;92m 00;92m \033[00m "
echo -e "  \033[00;43m 00;43m \033[00m \033[01;43m 01;43m \033[00m \033[02;43m 02;43m \033[00m \033[04;43m 04;43m \033[00m \033[07;43m 07;43m \033[00m \033[09;43m 09;43m \033[00m \033[00;93m 00;93m \033[00m "
echo -e "  \033[00;44m 00;44m \033[00m \033[01;44m 01;44m \033[00m \033[02;44m 02;44m \033[00m \033[04;44m 04;44m \033[00m \033[07;44m 07;44m \033[00m \033[09;44m 09;44m \033[00m \033[00;94m 00;94m \033[00m "
echo -e "  \033[00;45m 00;45m \033[00m \033[01;45m 01;45m \033[00m \033[02;45m 02;45m \033[00m \033[04;45m 04;45m \033[00m \033[07;45m 07;45m \033[00m \033[09;45m 09;45m \033[00m \033[00;95m 00;95m \033[00m "
echo -e "  \033[00;46m 00;46m \033[00m \033[01;46m 01;46m \033[00m \033[02;46m 02;46m \033[00m \033[04;46m 04;46m \033[00m \033[07;46m 07;46m \033[00m \033[09;46m 09;46m \033[00m \033[00;96m 00;96m \033[00m "
echo -e "  \033[00;47m 00;47m \033[00m \033[01;47m 01;47m \033[00m \033[02;47m 02;47m \033[00m \033[04;47m 04;47m \033[00m \033[07;47m 07;47m \033[00m \033[09;47m 09;47m \033[00m \033[00;97m 00;97m \033[00m "
}

fcolor()
{
    local color="0"
    local format="3"

    # $1 / color
    if [[ "$1" != "" ]]; then
        color="$1"
    fi

    # $2 / format
    if [[ "$2" != "" ]]; then
        format="$2"
    fi

    local style="0 1 2 4 7 9"
    for i in $style; do
        font="0$i;$format$color""m"
        echo -ne " \033[$font $font \033[00m "
    done

    echo;
}

# fcolor 0 3
# fcolor 1 3

case "$*" in
    *-h*|*--help*|*help*)
        echo "Печатает цветовую гамму терминала"
        echo "Usage: $0 [FORMAT_1] [FORMAT_2] ..."
        exit
        ;;
esac

format="3 4 9"
if [ $# != 0 ]; then
    format="$*"
fi

for f in $format; do
    echo "# $f ::"
    for (( c = 0; c < 8; c++ )); do
        fcolor $c $f
    done
done
