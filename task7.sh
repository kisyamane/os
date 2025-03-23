#!/bin/bash

# Создаем каталог
mkdir -p mydir
echo "Создан каталог mydir."

# Проверяем начальный размер
echo "Начальный размер каталога:"
du -sh mydir

# Добавляем 10 файлов
for i in {1..10}; do
  echo "Test file $i" > "mydir/file$i.txt"
done
echo "Добавлено 10 файлов."
du -sh mydir

# Удаляем 10 файлов
rm mydir/*
echo "Удалено 10 файлов."
du -sh mydir

# Добавляем подкаталог
mkdir mydir/subdir
echo "Добавлен подкаталог subdir."
du -sh mydir

# Удаляем подкаталог
rmdir mydir/subdir
echo "Удален подкаталог subdir."
du -sh mydir

# Очистка
rm -rf mydir
echo "Каталог mydir удален."