#!/bin/bash

diretorio_origem=/home/coelho/desktop/Dropbox/Doutorado_Privado/DADOS
diretorio_destino=/home/coelho/desktop/Dropbox/Doutorado_Privado/Redes_neurais/A.Preparacao_dados/Dados

cat $diretorio_origem/Promotores/*.fasta > $diretorio_destino/promotores.txt 
cat $diretorio_origem/Falsos/*.fasta > $diretorio_destino/falsos.txt

#cp $diretorio_origem/Promotores/Promotores1.txt $diretorio_destino/promotores.txt
#cp $diretorio_origem/Falsos/Falsos1.txt $diretorio_destino/falsos.txt

#gedit $diretorio_destino/falsos.txt &
#gedit $diretorio_destino/promotores.txt &

