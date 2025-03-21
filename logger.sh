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

log_command 'who && date'

log_command 'uname -a && date'

log_command 'lscpu && date'

# Первое задание

# log_command date
# >out.txt
# log_command 'ls -lR / 2>/dev/null | grep -E "^[-]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
# log_command 'ls -lR / 2>/dev/null | grep -E "^[b]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
# log_command 'ls -lR / 2>/dev/null | grep -E "^[c]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
# log_command 'ls -lR / 2>/dev/null | grep -E "^[d]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
# log_command 'ls -lR / 2>/dev/null | grep -E "^[l]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
# log_command 'ls -lR / 2>/dev/null | grep -E "^[p]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
# log_command 'ls -lR / 2>/dev/null | grep -E "^[s]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
# log_command 'cat out.txt && date'
# log_command 'bash task1.sh out.txt && date'
# log_command 'cat out.txt && date'

# Второе задание

# log_command 'bash task2.sh out.txt && date'

# Третье задание

log_command 'touch l.txt && date'
log_command 'ln -s l.txt s1 && date'
log_command 'cp -s l.txt s2 && date'
log_command 'link l.txt s3 && date'
log_command 'bash task3.sh l.txt'

# Четвертое задание

log_command bash task4.sh l.txt

rm s1
rm s2
rm s3
rm l.txt

#Пятое задание

log_command 'find / -type f 2>/dev/null  | head -n 10 && date'
log_command 'find / -type b 2>/dev/null  | head -n 5 && date'
log_command 'find / -type c 2>/dev/null  | head -n 5 && date'
log_command 'find / -type d 2>/dev/null  | head -n 5 && date'
log_command 'find / -type l 2>/dev/null  | head -n 5 && date'
log_command 'find / -type p 2>/dev/null  | head -n 5 && date'
log_command 'find / -type s 2>/dev/null  | head -n 5 && date'

log_command 'echo "Hello, world!" >> a.txt'
log_command 'od a.txt'
log_command 'od -c a.txt'
log_command 'hexdump -C a.txt'
log_command 'mkdir test_dir'
log_command sudo od /dev/loop0 | head -n 5
log_command 'sudo od /dev/fb0 | head -n 5'