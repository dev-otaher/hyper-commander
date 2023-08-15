#! /usr/bin/bash/env bash

print_menu() {
    echo '------------------------------'
    echo '| Hyper Commander            |'
    echo '| 0: Exit                    |'
    echo '| 1: OS info                 |'
    echo '| 2: User info               |'
    echo '| 3: File and Dir operations |'
    echo '| 4: Find Executables        |'
    echo '------------------------------'
}

print_files_and_dirs() {
    echo 'The list of files and directories:'
    arr=(*)
    for item in "${arr[@]}"; do
        if [[ -f "$item" ]]; then
            printf "F %s\n" "$item"
        elif [[ -d "$item" ]]; then
            printf "D %s\n" "$item"
        fi
    done
}

print_file_menu() {
    echo '---------------------------------------------------'
    echo "| 0 Main menu | 'up' To parent | 'name' To select |"
    echo '---------------------------------------------------'
}

files_and_dirs() {
    while true; do
        print_files_and_dirs
        echo ''
        print_file_menu
        read -r choice
        case "$choice" in
            "0")
                break;;
            "up")
                echo 'Not implemented!';;
            "$(ls "$choice" 2>/dev/null)")
                echo 'Not implemented!';;
            *)
                echo 'Invalid input!';;
        esac
        echo ''
    done
}

printf 'Hello %s!\n\n' "$USER"
while true; do
    print_menu
    read -r choice
    echo ''
    case "$choice" in
        "0")
            echo 'Farewell!'
            break;;
        "1")
            echo 'host-name' "$(uname -o -n)";;
        "2")
            whoami;;
        "3")
            files_and_dirs;;
        "4")
            echo 'Not implemented!';;
        *)
            echo 'Invalid option!';;
    esac
done