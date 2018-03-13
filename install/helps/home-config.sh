#!/bin/bash

# Templates:Шаблоны
# Publicshare:Общедоступные

XDG_DIRS="Desktop:Рабочий стол
Downloads:Загрузки
Documents:Документы
Music:Музыка
Pictures:Изображения
Videos:Видео"

OLD_IFS=$IFS
IFS="
"

_link()
{
    local src_dir="$1"
    local dist_dir="$2"

    local home_src_dir="$HOME/$1"
    local home_dist_dir="$HOME/$2"

    if [[ ! -e "${home_src_dir}" ]]; then
        echo "Исходная папка не существует ${home_src_dir}"
        return 0
    fi

    if [[ -e "${home_dist_dir}" ]]; then
        echo "Папка уже существует ${home_dist_dir}"
        return 0
    fi

    mv $home_src_dir $home_dist_dir
    ln -s $dist_dir $src_dir
    echo "$src_dir --> $dist_dir"
}

for d in $XDG_DIRS; do
    src_dir=${d##*:}
    dist_dir=${d%%:*}

    echo "$src_dir -> $dist_dir"
    _link ${src_dir} ${dist_dir}
done

IFS=$OLD_IFS
