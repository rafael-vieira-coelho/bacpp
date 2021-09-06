#!/bin/bash

script=/home/coelho/desktop/Dropbox/Doutorado_Privado/Redes_neurais/A.Preparacao_dados/Python/3A_Fold.py
diretorio=/home/coelho/desktop/Dropbox/Doutorado_Privado/Redes_neurais/A.Preparacao_dados/sigma70_straight_col_2
diretorioDados=/home/coelho/desktop/Dropbox/Doutorado_Privado/Redes_neurais/A.Preparacao_dados/Dados
rodarRede=/home/coelho/desktop/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede

mkdir $rodarRede/erro_treino
mkdir $rodarRede/erro_teste
mkdir $rodarRede/RMS

folds=5

############################################################################################
mkdir $diretorio/sigma70_straight_simple/Dados_entrada_RN/
mkdir $diretorio/sigma70_straight_simple/Intermediarios_sigma70_straight_col_2_simple/

python $script promotores_s70_straight_simple_ falsos_straight_simple_ $folds curvatura_col_2_straight_simple $diretorio/sigma70_straight_simple/

mv $diretorio/sigma70_straight_simple/TESTE* $diretorio/sigma70_straight_simple/Dados_entrada_RN/
mv $diretorio/sigma70_straight_simple/TREINO* $diretorio/sigma70_straight_simple/Dados_entrada_RN/

mv $diretorio/sigma70_straight_simple/falsos* $diretorio/sigma70_straight_simple/Intermediarios_sigma70_straight_col_2_simple/
mv $diretorio/sigma70_straight_simple/promotores* $diretorio/sigma70_straight_simple/Intermediarios_sigma70_straight_col_2_simple/

############################################################################################
#mkdir $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/

#python $script promotores_s70_straight_suave3_ falsos_straight_suave3_ 2 curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/

#mv $diretorio/sigma70_straight_suave_3/TESTE_1_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_2_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_3_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_4_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_5_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_6_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_7_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_8_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_9_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TESTE_10_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/

#mv $diretorio/sigma70_straight_suave_3/TREINO_1_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_2_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_3_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_4_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_5_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_6_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_7_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_8_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_9_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_3/TREINO_10_curvatura_col_2_straight_suave_3 $diretorio/sigma70_straight_suave_3/Dados_entrada_RN/

#mv $diretorio/sigma70_straight_suave_3/falsos* $diretorio/sigma70_straight_suave_3/Intermediarios_sigma70_straight_col_2_suave_3/
#mv $diretorio/sigma70_straight_suave_3/promotores* $diretorio/sigma70_straight_suave_3/Intermediarios_sigma70_straight_col_2_suave_3/

############################################################################################
#mkdir $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/

#python $script promotores_s70_straight_suave5_ falsos_straight_suave5_ 2 curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/

#mv $diretorio/sigma70_straight_suave_5/TESTE_1_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_2_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_3_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_4_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_5_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_6_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_7_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_8_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_9_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TESTE_10_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/

#mv $diretorio/sigma70_straight_suave_5/TREINO_1_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_2_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_3_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_4_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_5_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_6_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_7_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_8_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_9_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_5/TREINO_10_curvatura_col_2_straight_suave_5 $diretorio/sigma70_straight_suave_5/Dados_entrada_RN/

#mv $diretorio/sigma70_straight_suave_5/falsos* $diretorio/sigma70_straight_suave_5/Intermediarios_sigma70_straight_col_2_suave_5/
#mv $diretorio/sigma70_straight_suave_5/promotores* $diretorio/sigma70_straight_suave_5/Intermediarios_sigma70_straight_col_2_suave_5/

############################################################################################
#mkdir $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/

#python $script promotores_s70_straight_suave8_ falsos_straight_suave8_ 2 curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/

#mv $diretorio/sigma70_straight_suave_8/TESTE_1_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_2_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_3_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_4_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_5_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_6_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_7_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_8_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_9_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TESTE_10_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/

#mv $diretorio/sigma70_straight_suave_8/TREINO_1_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_2_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_3_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_4_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_5_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_6_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_7_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_8_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_9_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_8/TREINO_10_curvatura_col_2_straight_suave_8 $diretorio/sigma70_straight_suave_8/Dados_entrada_RN/

#mv $diretorio/sigma70_straight_suave_8/falsos* $diretorio/sigma70_straight_suave_8/Intermediarios_sigma70_straight_col_2_suave_8/
#mv $diretorio/sigma70_straight_suave_8/promotores* $diretorio/sigma70_straight_suave_8/Intermediarios_sigma70_straight_col_2_suave_8/

############################################################################################
#mkdir $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/

#python $script promotores_s70_straight_suave12_ falsos_straight_suave12_ 2 curvatura_col_2_straight_suave_12 $diretorio/#sigma70_straight_suave_12/

#mv $diretorio/sigma70_straight_suave_12/TESTE_1_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_2_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_3_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_4_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_5_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_6_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_7_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_8_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_9_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TESTE_10_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/

#mv $diretorio/sigma70_straight_suave_12/TREINO_1_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_2_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_3_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_4_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_5_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_6_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_7_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_8_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_9_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/
#mv $diretorio/sigma70_straight_suave_12/TREINO_10_curvatura_col_2_straight_suave_12 $diretorio/sigma70_straight_suave_12/Dados_entrada_RN/

#mkdir $diretorio/sigma70_straight_simple/Resultados_sigma70_straight_col_2_simple/
#mkdir $diretorio/sigma70_straight_suave_3/Resultados_sigma70_straight_col_2_suave_3/
#mkdir $diretorio/sigma70_straight_suave_5/Resultados_sigma70_straight_col_2_suave_5/
#mkdir $diretorio/sigma70_straight_suave_8/Resultados_sigma70_straight_col_2_suave_8/
#mkdir $diretorio/sigma70_straight_suave_12/Resultados_sigma70_straight_col_2_suave_12/

#mkdir $diretorio/sigma70_straight_suave_12/Intermediarios_sigma70_straight_col_2_suave_12/
#mkdir $diretorio/sigma70_straight_suave_8/Intermediarios_sigma70_straight_col_2_suave_8/
#mkdir $diretorio/sigma70_straight_suave_5/Intermediarios_sigma70_straight_col_2_suave_5/
#mkdir $diretorio/sigma70_straight_suave_3/Intermediarios_sigma70_straight_col_2_suave_3/
#mkdir $diretorio/sigma70_straight_simple/Intermediarios_sigma70_straight_col_2_simple/

#mv $diretorio/sigma70_straight_suave_12/falsos* $diretorio/sigma70_straight_suave_12/Intermediarios_sigma70_straight_col_2_suave_12/
#mv $diretorio/sigma70_straight_suave_12/promotores* $diretorio/sigma70_straight_suave_12/Intermediarios_sigma70_straight_col_2_suave_12/

############################################################################################

mv -f $diretorio /home/coelho/Dropbox/Doutorado_Privado/Redes_neurais/B.Rodar_rede/
