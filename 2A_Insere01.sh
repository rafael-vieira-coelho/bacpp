#!/bin/bash

diretorio=/home/coelho/desktop/Dropbox/Doutorado_Privado/Redes_neurais/A.Preparacao_dados
script=$diretorio/Python/2A_Insere01.py

python $script 0 falsos_RN.txt $diretorio/Dados/
python $script 1 promotores_RN.txt $diretorio/Dados/

gedit $diretorio/Dados/falsos_RN_ID.txt &
gedit $diretorio/Dados/promotores_RN_ID.txt &


