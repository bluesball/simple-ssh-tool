$user = Read-Host "Informe o nome do usuário"
$email = Read-Host "Informe o email do usuário"
$password = Read-Host "Informe a senha da chave"
$path = Read-Host "Informe o diretório onde deseja armazenar os arquivos gerados (exemplo: C:\Users\$user\.ssh\)"
$keyname = Read-Host "Informe o nome da chave a ser gerada"

New-Item -ItemType Directory -Path $path

ssh-keygen -t ed25519 -C "$email" -N "$password" -f "$path\$keyname"

Write-Host "A chave SSH foi gerada com sucesso!"
