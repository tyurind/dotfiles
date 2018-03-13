#!/bin/bash
# Архив дом папочки

usage() {
    cat <<EOF
Usage: $(basename $0) [-h|--help|OPTIONS]

Архивирует все нахер в указаный файл.
Являеться алиасом:
    <tar [ARGUMENTS]>

где  ARGUMENTS включает аргументы:

      --same-permissions       # извлекать информацию о правах доступа к файлу (по умолчанию для суперпользователя)
      --same-order             # сортировать извлекаемые имена в том же порядке, что и в архиве
      --block-number           # выводить номера блоков архива в каждом сообщении
      --totals[=СИГНАЛ]        # вывод общего числа байт после обработки архива; с аргументом - вывод общего числа байт после доставки этого СИГНАЛА. Разрешённые сигналы: SIGHUP, SIGQUIT, SIGINT, SIGUSR1 и SIGUSR2. Также разрешается использовать имена без префикса SIG
      --check-links            # вывод сообщений, если сохранены не все ссылки
      --gzip
      --create

Реализует прогресс бар
      --checkpoint=1000
      --checkpoint-action=exec='printf "%04d in %32s\r" \$TAR_CHECKPOINT \$TAR_ARCHIVE'

Вообще у <tar> там дохуя параметров, надо хелп смотреть


      --exclude=ШАБЛОН      # исключать файлы, определённые ШАБЛОНОМ
      --exclude-backups     # исключать резервные файлы и файлы блокировки
      --exclude-from=ФАЙЛ   # исключать шаблоны, перечисленных в ФАЙЛЕ
      --exclude-ignore-recursive=ФАЙЛ

EOF
exit
}

HOME_DIR=
OUTFILE="${HOME}/$(basename $HOME)-$(date +%F_%H-%M-%S).backup.tar.gz"
# BACKUPIGNORE_FILE=.backupignore


tar_extends()
{
  tar \
    --same-permissions \
    --block-number \
    --totals \
    --gzip \
    --check-links \
    --exclude-backups \
    --checkpoint=1000 \
    --checkpoint-action=exec='printf "%d in %32s\r" $TAR_CHECKPOINT $TAR_ARCHIVE' \
    --create \
    $*
}


hame_backup()
{
  local EXCLUDE_FROM="--exclude='*.backup.tar.gz' --exclude='${OUTFILE}'"
  local BACKUPIGNORE_FILE=$(realpath "${HOME_DIR## }/.backupignore")
  local TMP_BACKUPIGNORE_FILE=$(tempfile -p home. -s .backupignore)

  if [[ -e "$BACKUPIGNORE_FILE" ]]; then
    cat "$BACKUPIGNORE_FILE" | while read i; do
      echo "${HOME_DIR## }/$i" >> $TMP_BACKUPIGNORE_FILE
    done
    EXCLUDE_FROM="${EXCLUDE_FROM} -X ${TMP_BACKUPIGNORE_FILE}"

    echo "BACKUPIGNORE_FILE: $TMP_BACKUPIGNORE_FILE"
    cat $TMP_BACKUPIGNORE_FILE

    # EXCLUDE_FROM="${EXCLUDE_FROM} --exclude-from=${BACKUPIGNORE_FILE}"
    # EXCLUDE_FROM="${EXCLUDE_FROM} -X ${BACKUPIGNORE_FILE}"
  fi

  echo "HOME_DIR: $HOME_DIR"
  echo "OUTFILE: $OUTFILE"
  echo "Args: $*"

  tar_extends --file=$OUTFILE $EXCLUDE_FROM $HOME_DIR $*

  rm -rf $TMP_BACKUPIGNORE_FILE
}

_set_outfile()
{
  local OUTFILE_FILENAME="$(basename $HOME)-$(date +%F_%H-%M-%S).backup.tar.gz"
  local OUTFILE_PATH="${HOME}"

  if [ $# == 0 ]; then
    OUTFILE="${OUTFILE_PATH}/${OUTFILE_FILENAME}"
    return 0
  fi

  local f=$1
  local fdir=
  if [[ "${f:(-1)}" == "/" ]]; then
    fdir="${f:0:(-1)}"
    OUTFILE="${fdir}/${OUTFILE_FILENAME}"
    return 0
  fi

  OUTFILE="${f}"
}

_set_outfile


CMD_ARGS=
for i in $@; do
  case $i in
    --file=*)
      _set_outfile ${i##*=}
      # echo "OUTFILE: $OUTFILE"
      ;;
    -*)
      CMD_ARGS="${CMD_ARGS} ${i}"
      ;;
    *)
      HOME_DIR="${HOME_DIR} ${i}"
      # CMD_ARGS="${CMD_ARGS} ${i}"
      ;;
  esac
done

if [[ "$HOME_DIR" == "" ]]; then
  HOME_DIR=$HOME
fi

hame_backup $CMD_ARGS

exit 0



CMD_ARGS=
for i in $@; do
  echo $i
  case $i in
    --file=*)
      f=${i##*=}
      echo "File: $f"
      ;;
    *)
      CMD_ARGS="${CMD_ARGS} ${i}"
      ;;
  esac
done


echo "HOME_DIR:  $HOME_DIR"
echo "OUTFILE: $OUTFILE"
echo $CMD_ARGS


exit

if [ $# == 0 ]; then
    usage
    exit 0
fi

ffdir=
if [[ $1 == "--ffdir" ]]; then
    shift
    ffdir="$1/"
    shift
fi

option_f=
# if [[ $1 != "-f" ]]; then
#     option_f="-f $ffdir$(basename $1).tar.gz"
# fi
# ===========================================


if [[ ! -d $1 ]]; then
    echo "$1 не папка"
    exit 1
fi

# INPUTDIR=$1

OUTFILE="$1-$(date +%F_%H-%M-%S).backup.tar.gz"

echo "OUTFILE: $OUTFILE"
echo "Options: $option_f"
echo "Args: $*"
exit 0



# --recursion
#--same-order


# --checkpoint-action=exec='printf "%d in %32s\r" $TAR_CHECKPOINT $TAR_ARCHIVE' \

tar \
--same-permissions \
--block-number \
--totals \
--gzip \
--check-links \
--exclude-backups \
--checkpoint=1000 \
--checkpoint-action=ttyout='%{%Y-%m-%d %H:%M:%S}t (%d sec): #%u, %T%*\r' \
--create \
--file=$OUTFILE \
$option_f $*

exit 0
