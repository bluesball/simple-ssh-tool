#!/bin/bash

read -p "Informe o nome do usuário: " user
read -p "Informe o email do usuário: " email
read -p "Informe a senha da chave: " password
read -p "Informe o diretório onde deseja armazenar os arquivos gerados (exemplo: /home/$user/.ssh/): " path
read -p "Informe o nome da chave a ser gerada: " keyname

mkdir -p "$path"
ssh-keygen -t ed25519 -C "$email" -N "$password" -f "$path/$keyname"

echo "A chave SSH foi gerada com sucesso!"
