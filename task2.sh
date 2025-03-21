#!/bin/bash

# Проверяем, передан ли аргумент (имя файла)
if [ -z "$1" ]; then
    echo "Использование: $0 <файл>"
    exit 1
fi

# Получаем абсолютный путь к файлу
target_file=$(realpath "$1")

# Проверяем, существует ли файл
if [ ! -e "$target_file" ]; then
    echo "Файл не существует: $target_file"
    exit 1
fi

# Получаем inode целевого файла
target_inode=$(stat -c "%i" "$target_file")

# Поиск всех жёстких ссылок на файл
echo "Поиск жёстких ссылок на файл: $target_file (inode: $target_inode)"

# Способ 1: Использование ls и awk
echo "Способ 1: Использование ls и awk"
ls -lRi / | awk -v inode="$target_inode" '$1 == inode {print $0}'

# Способ 2: Использование ls и grep
echo "Способ 2: Использование ls и grep"
ls -lRi / | grep -E "^ *$target_inode "
