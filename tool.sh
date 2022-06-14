#!/bin/bash
x="conex"
msg="Saiu que eu vi!"
menu ()
{
while true $x != "conex"
do

echo "=================================================="
echo "      Escolha um servidor para conectar           "
echo "=================================================="
echo ""
echo "Digite a opção desejada:"
echo ""
echo "0 - Sair"
echo "1 - Server 1"
echo "2 - Server 2"
echo ""
echo "=================================================="

read x
echo "Opção informada ($x)"
echo "=================================================="

case "$x" in
        1)

        echo "      Bacula Lan          "

            ssh server1 #substituir pelo apelido que informou no arquivo config

                clear

        echo $msg


      sleep 1
        echo "=================================================="
;;

        2)

        echo "      Bacula DMZ          "

            ssh server2 #substituir pelo apelido que informou no arquivo config

                clear

        echo $msg


      sleep 1
        echo "=================================================="
;;

#
## Adicionar aqui os proximos
#

 0)
        clear;
        exit;
echo "=================================================="
;;

*)
        echo "Opção inválida!"
esac
done

}
