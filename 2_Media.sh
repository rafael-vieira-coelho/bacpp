#!/bin/bash

dir_py=~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/Python
dir_dados=~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/sigma70_straight_col_2/sigma70_straight_simple

#Substitui espaços em branco ' ' por underline '_' 
cd $dir_dados/RMS/
for i in *' '* ; do mv "$i" "${i// /_}" ; done 
cd $dir_dados/erro_teste/
for i in *' '* ; do mv "$i" "${i// /_}" ; done 
cd $dir_dados/erro_treino/
for i in *' '* ; do mv "$i" "${i// /_}" ; done 

cd $dir_py
# Rede Hidden Epocas Sigma
#python mediaRMS.py 1 5 sigma70 $dir_dados/RMS/

#1 neuronios
#5 numero_fold
#sigma70 fator_sigma

#LAÇOS
#Neuronios
#Epocas
#Redes
#Listas

#k neuronios
for ((k=1; k<=8; k++))
do		
	#j redes
#	for ((j=1; j<=5; j=j+1))
#	do
		#i epocas
#		for ((i=20; i<=80; i=i+5))
#		do
		    #p folds (listas)
#			for ((p=1; p<=5; p=p+1))
#			do
				echo "mediaRMS.py $k hidden 5 folds sigma70 $dir_dados/RMS/"
				python mediaRMS.py $k 5 sigma70 $dir_dados/RMS/
#		    done
#		done
#	done
done		
		    
