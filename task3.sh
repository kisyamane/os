if [ -z "$1" ]; then
    echo "Использование: $0 <файл>"
    exit 1
fi

target_file=$(realpath "$1")

if [ ! -e "$target_file" ]; then
    echo "Файл не существует: $target_file"
    exit 1
fi

echo "Поиск символьных ссылок на файл $target_file"

links_buffer=$(mktemp)

find ~ -type l 2>/dev/null | while read -r link; do
    link_path=$(realpath "$link" 2>/dev/null)

    if [ "$link_path" == "$target_file" ]; then
        echo "$link" | tee -a "$links_buffer"
    fi
done

total=$(wc -l < "$links_buffer")
rm "$links_buffer"

echo "Всего символических ссылок: $total"
