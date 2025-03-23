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

log_command date
>out.txt
log_command 'ls -lR / 2>/dev/null | grep -E "^[-]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
log_command 'ls -lR / 2>/dev/null | grep -E "^[b]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
log_command 'ls -lR / 2>/dev/null | grep -E "^[c]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
log_command 'ls -lR / 2>/dev/null | grep -E "^[d]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
log_command 'ls -lR / 2>/dev/null | grep -E "^[l]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
log_command 'ls -lR / 2>/dev/null | grep -E "^[p]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
log_command 'ls -lR / 2>/dev/null | grep -E "^[s]" -m 1 | awk '\''{print $1, "/"$NF}'\'' >> out.txt && date'
log_command 'cat out.txt && date'
log_command 'bash task1.sh out.txt && date'
log_command 'cat out.txt && date'

# Второе задание

log_command 'bash task2.sh out.txt && date'

# Третье задание

log_command 'touch l.txt && date'
log_command 'ln -s l.txt s1 && date'
log_command 'cp -s l.txt s2 && date'
log_command 'link l.txt s3 && date'
log_command 'bash task3.sh l.txt && date'

# Четвертое задание

log_command 'bash task4.sh l.txt && date'

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

# Шестое задание

log_command 'echo "Hello, world!" >> a.txt && date'
log_command 'od a.txt && date'
log_command 'od -c a.txt && date'
log_command 'hexdump -C a.txt && date'
log_command 'mkdir test_dir && date'
log_command 'sudo od /dev/loop0 | head -n 5 && date'
log_command 'sudo od /dev/fb0 | head -n 5 && date'

# Седьмое задание 

log_command 'bash task7.sh && date'

# Восьмое задание 

log_command 'ls -l /etc/passwd && date'
log_command 'ls -l /etc/shadow && date'
log_command 'ls -l usr/bin/passwd && date'
log_command 'cat /etc/passwd && date'
log_command 'cat /etc/shadow && date'
echo 'kisyamane@Ubuntu:~/leti/os$ passwd' >> lab_report.log
echo 'Смена пароля для kisyamane.
Текущий пароль: 
Новый пароль: 
НЕУДАЧНЫЙ ПАРОЛЬ: Пароль идентичен предыдущему
Новый пароль: 
НЕУДАЧНЫЙ ПАРОЛЬ: Пароль отличается лишь регистром символов
Новый пароль: 
Повторите ввод нового пароля: 
passwd: пароль успешно обновлён' >> lab_report.log

# Задание 9.1

log_command 'mkdir testdir && date'
log_command 'touch testdir/file1 testdir/file2 testdir/file3 && date'
log_command 'ls -l testdir && date'
log_command 'chmod u+x testdir/file1 && date'
log_command 'ls -l testdir && date'
log_command 'chmod 777 testdir/file1 && date'
log_command 'ls -l testdir && date'
log_command 'sudo chown user1 testdir/file1 && date'
log_command 'ls -l testdir && date'


# Задание 9.2

log_command 'ls -l testdir && date'
log_command 'sudo chmod u+s testdir/file1 && date'
log_command 'ls -l testdir && date'

# # Задание 9.3

# log_command 'chmod 640 testdir/file2'
# log_command 'ls -l testdir'
# log_command 'groups user1'
# log_command 'sudo chown user1:testgroup testdir/file2'
# log_command 'ls -l testdir'
# # log_command sudo su - user1
# log_command 'sudo -u user1 cat testdir/file2'
# log_command 'sudo -u user1 echo "text" > testdir/file2'
# log_command 'groups user2'
# # log_command su - user2
# log_command 'sudo -u user2 echo "text" >> testdir/file2'
# log_command 'sudo -u user2 cat testdir/file2'
# log_command 'groups user3'
# # log_command sudo su - user3
# log_command 'sudo -u user3 echo "text" >> testdir/file2'
# log_command 'sudo -u user3 cat testdir/file2'


# # Задание 9.4

# log_command touch testdir/file4
# chmod 400 testdir/file4
# log_command ls -l testdir
# log_command cat testdir/file4
# log_command echo "text" >> testdir/file4
# chmod 200 testdir/file4
# log_command ls -l testdir
# log_command cat testdir/file4
# log_command echo "text" >> testdir/file4
# chmod 000 testdir/file4
# log_command ls -l testdir
# log_command cat testdir/file4
# log_command echo "text" >> testdir/file4

# log_command 'mkdir testdir/mydir'
# log_command 'chmod 100 testdir/mydir'
# log_command 'ls -l testdir/mydir'
# log_command 'cd testdir/mydir'
# log_command 'pwd'
# log_command 'touch file'
# log_command 'cd ..'
# log_command 'cd ..'
# log_command 'chmod 400 testdir/mydir'
# log_command 'ls -l testdir/mydir'
# log_command 'cd testdir/mydir'
# log_command 'pwd'
# log_command 'touch testdir/mydir/file'
# log_command 'chmod 200 testdir/mydir'
# log_command 'ls -l testdir/mydir'
# log_command 'cd testdir/mydir'
# log_command 'pwd'
# log_command 'touch testdir/mydir/file'

log_command rm -rf testdir

