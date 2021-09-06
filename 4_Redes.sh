#!/bin/bash

dir_py=~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/Python
dir_dados=~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/sigma70_straight_col_2/sigma70_straight_simple

#mkdir $dir_dados/Resultados_sigma70/
#i epocas
for ((i=20; i<=80; i=i+5))
do
	#k neuronios
	for ((k=1; k<=8; k++))
	do		
	mkdir $dir_dados/Resultados_sigma70/Melhor_rede_hidden_${k}_${i}/
	mkdir $dir_dados/Resultados_sigma70/Melhor_rede_hidden_${k}_${i}/RMS/

	cp $dir_dados/RMS/rede*$i*.txt $dir_dados/Resultados_sigma70/Melhor_rede_hidden_${k}_${i}/RMS/
	cp $dir_dados/erro_teste/rede*$i*hidden*$k*list*.txt  $dir_dados/Resultados_sigma70/Melhor_rede_hidden_${k}_${i}/
	cp $dir_dados/erro_treino/rede*$i*hidden*$k*list*.txt $dir_dados/Resultados_sigma70/Melhor_rede_hidden_${k}_${i}/
	echo "Epoca $i Neuronio $k"
	done
done


