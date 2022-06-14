# ssh-tools

Quando vc precisa fazer ssh em vários servidores durante o dia e a memoria falha em saber quem é quem...
Resolvi essa situação uns anos atrás com um script bem básico mas que sempre salva.

## Getting started

No início pode até dar um trabalhinho deixar do seu jeito, mas vale a pena quando vc precisa acessar umas dezenas de máquinas

Edite os arquivos conforme necessidade e salve

* tool.sh: Edite com as informações indicadas no código e dê permissão de execução. Execute com o comando ./tool.sh ou crie um link para /usr/local/bin para fazer parte do path
* config: Edite o arquivo e salve no diretório /home/seuusuario/.ssh/

## Crie uma chave SSH

Para criar uma chave SSH segura execute o comando substituindo o e-mail

```ssh-keygen -t ed25519 -C "fulano2email.com.br" ```

Escolha uma senha e prossiga 

Copie a chave ssh para o servidor desejado com o comando:

``` ssh-copy-id -i /caminho/para/a/chave  usuario@ipdoservidor ```