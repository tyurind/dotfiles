#!/bin/bash
set -e

HOSTNAME_CUR=$(hostname)
HOSTNAME_NEW=""
HOSTNAME_OLD=$(cat /etc/hostname)
HOSTS_UPDATE=""

function help_long()
{
    cat <<EOF
USAGE:
# $0 [OPTION] <NAME>

    name    new host name

Option:

    --hosts  Update /etc/hosts file

Current name: $HOSTNAME_CUR

EOF
    return
}
## --------------------------------------


while test $# != 0
do
    case "$1" in
        -h|--h|--he|--hel|--help|help)
            help_long
            exit 1
            ;;
        --hosts)
            HOSTS_UPDATE="1"
            ;;
        *)
            HOSTNAME_NEW=$1
            ;;
    esac
    shift
done

if [ "$HOSTNAME_NEW" == "" ]; then
    help_long
    exit 1
fi

if [ "$(id -u)" != "0" ]; then
    echo "You not root user. Permission denied"
    help_long
    exit 1
fi


# Чтобы задать постоянное имя компьютеру, необходимо отредактировать этот файл:
echo "${HOSTNAME_NEW}" > /etc/hostname
# После чего, необходимо перезапустить скрипт /etc/init.d/hostname (или /etc/init.d/hostname.sh):
test -f /etc/init.d/hostname && /etc/init.d/hostname
test -f /etc/init.d/hostname.sh && /etc/init.d/hostname.sh
hostname -b -F /etc/hostname

# Либо просто перезагрузить машину. Кроме этого, необходимо проверить файл /etc/hosts на предмет упоминания в нем старого имени компьютера.
# Если оно там встречается (а оно там наверняка встречается), то его так же необходимо заменить на новое имя:
if [ "$HOSTS_UPDATE" != "" ]; then
    sed -i "s/${HOSTNAME_OLD}/${HOSTNAME_NEW}/g" /etc/hosts
    echo "Update /etc/hosts file"
fi
