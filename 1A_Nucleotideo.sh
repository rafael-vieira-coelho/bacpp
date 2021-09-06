#!/bin/bash

diretorio=/home/coelho/desktop/Dropbox/Doutorado_Privado/Redes_neurais/A.Preparacao_dados
script=$diretorio/Python/1A_Nucleotideo.py

python $script falsos.txt $diretorio/Dados/ 
python $script promotores.txt $diretorio/Dados/ 

#remove caractere extra gerado no arquivo falsos_RN.txt
python $diretorio/Python/removeCaractereFinal.py falsos_RN.txt $diretorio/Dados/ 

#gedit $diretorio/Dados/falsos_RN.txt &
#gedit $diretorio/Dados/promotores_RN.txt &


