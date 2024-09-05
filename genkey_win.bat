@echo off

set /p user=Informe o nome do usuário:
set /p email=Informe o email do usuário:
set /p password=Informe a senha da chave:
set /p path=Informe o diretório onde deseja armazenar os arquivos gerados (exemplo: C:\Users\%user%\.ssh\): 
set /p keyname=Informe o nome da chave a ser gerada:

mkdir %path%

ssh-keygen -t ed25519 -C "%email%" -N "%password%" -f "%path%\%keyname%"

echo A chave SSH foi gerada com sucesso!
