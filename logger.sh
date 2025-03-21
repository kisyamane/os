#!/bin/bash

logfile="lab_report.log"

>"$logfile"

log_command() {
    # Получаем имя пользователя, имя хоста и текущую директорию
    local username=$(whoami)
    local hostname=$(hostname)
    local current_dir=$(basename "$PWD")

    # Формируем строку приглашения командной строки
    local prompt="$username@$hostname:~/$(basename "$PWD")$"

    # Логируем вызов команды
    echo "$prompt $@" >> "$logfile"

    # Выполняем команду и логируем её вывод
    eval "$@" >> "$logfile" 2>&1
}


log_command echo Лабораторная работа 1: Файловые системы Unix-подобных ОС.
log_command echo Сербиновский Юрий гр. 3344

log_command date
log_command who
# echo
log_command uname -a
# echo
log_command lscpu

# Первое задание

log_command date
log_command >out.txt
log_command 'ls -lR / 2>/dev/null | grep -E "^[-]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
log_command 'ls -lR / 2>/dev/null | grep -E "^[b]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt'
log_command 'ls -lR / 2>/dev/null | grep -E "^[c]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt'
log_command 'ls -lR / 2>/dev/null | grep -E "^[d]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt'
log_command 'ls -lR / 2>/dev/null | grep -E "^[l]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt'
# log_command 'ls -lR / 2>/dev/null | grep -E "^[p]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt'
# log_command 'ls -lR / 2>/dev/null | grep -E "^[s]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt'
log_command cat out.txt
log_command bash task1.sh out.txt
log_command cat out.txt
