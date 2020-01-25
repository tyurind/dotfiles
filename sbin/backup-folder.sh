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


      --exclude=ШАБЛОН  # исключать файлы, определённые ШАБЛОНОМ
      --exclude-backups # исключать резервные файлы и файлы блокировки


EOF
exit
}

OUTFILE="$1-$(date +%F_%H-%M-%S).tar.gz"

tar \
--same-permissions \
--same-order \
--block-number \
--totals \
--gzip \
--check-links \
--exclude-backups \
--checkpoint=1000 \
--checkpoint-action=exec='printf "%d in %32s\r" $TAR_CHECKPOINT $TAR_ARCHIVE' \
--create \
-f "$OUTFILE" \
$option_f $*

echo "Filesave: $OUTFILE"