#!/bin/bash

dir_py=/Users/coelho/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/Python
dir_dados=/Users/coelho/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/sigma70_straight_col_2/sigma70_straight_simple/
num_seq_teste=192

# 1 a 8 Neuronios
for ((N=1; N<=8; N++))
do		
	# 1 a 5 Redes
	for ((R=1; R<=5; R++))
	do		
		# 5 a 100 epocas
		for ((E=5; E<=100; E=E+5))
		do
			# 5 Folds (Listas)
			echo "verificaScore2.py $N neuronios $R rede $E epocas 5 listas"
			python $dir_py/verificaScore2.py $N $R $E 5 sigma70 $dir_dados $num_seq_teste
			
		done
	done
done	



