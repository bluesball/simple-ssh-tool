#!/bin/bash

# Extrai os nomes dos hosts do arquivo ~/.ssh/config e ordena alfabeticamente
hosts=$(awk '/^Host / {print $2}' ~/.ssh/config | sort)

# Adiciona a opção "Sair" ao final da lista de hosts
hosts="$hosts Sair"

# Exibe o menu com as opções dos hosts
while true; do
    selected=$(zenity --list --title "Escolha um servidor SSH" --column "Servidores" $hosts --height 600 --width 400 --cancel-label "Sair")
    if [ $? -eq 0 ]; then
        if [ "$selected" == "Sair" ]; then
            exit
        else
            ssh $selected
            zenity --info --title "SSH encerrado" --text "Encerrado o SSH para o servidor $selected."
        fi
    else
        exit
    fi
done