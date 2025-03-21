if [ -z "$1" ]; then
    echo "Использование: $0 <файл>"
    exit 1
fi

target_file=$(realpath "$1")

if [ ! -e "$target_file" ]; then
    echo "Файл не существует: $target_file"
    exit 1
fi

echo Способ 1: Использование find с lname
find / -type l 2>/dev/null -lname "$(basename $target_file)"

echo Способ 2: Использование ls и grep
ls -lRa / 2>/dev/null | grep " -> " | grep "$(basename $target_file)$"