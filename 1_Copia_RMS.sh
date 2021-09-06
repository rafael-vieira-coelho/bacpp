#!/bin/bash


dir_rodar=~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede
dir_analisar=~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede

############################################
#COPIA PASTA sigma70_straight_col_2        #
############################################
cp -r $dir_rodar/sigma70_straight_col_2 $dir_analisar
dir_analisar=$dir_analisar/sigma70_straight_col_2/sigma70_straight_simple

############################################
#COPIA PASTAS RMS, ERRO_TESTE E ERRO_TREINO#
############################################
mkdir $dir_analisar/erro_teste
mkdir $dir_analisar/erro_treino
mkdir $dir_analisar/RMS
cp -v $dir_rodar/erro_teste/*.txt $dir_analisar/erro_teste/
cp -v $dir_rodar/erro_treino/*.txt $dir_analisar/erro_treino/
cp -v $dir_rodar/RMS/*.txt $dir_analisar/RMS


find . -wholename "$dir_rodar/*Erroteste*.txt" -print0 | xargs -0 -I {} mv {} $dir_analisar/erro_teste/
find . -wholename "$dir_rodar/*Errotreino*.txt" -print0 | xargs -0 -I {} mv {} $dir_analisar/erro_treino/
find . -wholename "$dir_rodar/*RMS*.txt" -print0 | xargs -0 -I {} mv {} $dir_analisar/RMS/


cd ~/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede
cp -r RMS/ ~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/sigma70_straight_col_2/sigma70_straight_simple/RMS/
cp -r erro_teste/ ~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/sigma70_straight_col_2/sigma70_straight_simple/erro_teste/
cp -r erro_treino/ ~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/sigma70_straight_col_2/sigma70_straight_simple/erro_treino/

