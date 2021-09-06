#!/bin/bash
diretorio_dados=/home/coelho/desktop/Dropbox/Doutorado_Privado/Redes_neurais/A.Preparacao_dados
diretorio=$diretorio_dados/sigma70_straight_col_2

testes=152

rm -rf $diretorio

mkdir $diretorio
mkdir $diretorio/sigma70_straight_simple

cp $diretorio_dados/Dados/falsos_RN_ID.txt $diretorio/
cp $diretorio_dados/Dados/promotores_RN_ID.txt $diretorio/

chmod 777 $diretorio/falsos_RN_ID.txt
chmod 777 $diretorio/promotores_RN_ID.txt

#split -l 178 $diretorio/falsos_curv_lin_simple_ID
split -l $testes $diretorio/falsos_RN_ID.txt
mv xaa falsos_straight_simple_1
mv xab falsos_straight_simple_2
mv xac falsos_straight_simple_3
mv xad falsos_straight_simple_4
mv xae falsos_straight_simple_5
mv falsos_straight_simple_1 falsos_straight_simple_2  falsos_straight_simple_3 falsos_straight_simple_4 falsos_straight_simple_5 $diretorio/sigma70_straight_simple/
#mv falsos_straight_simple_1 falsos_straight_simple_2  falsos_straight_simple_3 falsos_straight_simple_4 falsos_straight_simple_5 falsos_straight_simple_6 falsos_straight_simple_7 falsos_straight_simple_8 falsos_straight_simple_9 $diretorio/sigma70_straight_simple/

rm xa*

#split -l 178 $diretorio/promotores_s70_curv_lin_simple_ID
split -l $testes $diretorio/promotores_RN_ID.txt
mv xaa promotores_s70_straight_simple_1
mv xab promotores_s70_straight_simple_2
mv xac promotores_s70_straight_simple_3
mv xad promotores_s70_straight_simple_4
mv xae promotores_s70_straight_simple_5
mv promotores_s70_straight_simple_1 promotores_s70_straight_simple_2 promotores_s70_straight_simple_3 promotores_s70_straight_simple_4 promotores_s70_straight_simple_5  $diretorio/sigma70_straight_simple/
#mv promotores_s70_straight_simple_1 promotores_s70_straight_simple_2 promotores_s70_straight_simple_3 promotores_s70_straight_simple_4 promotores_s70_straight_simple_5 promotores_s70_straight_simple_6 promotores_s70_straight_simple_7 promotores_s70_straight_simple_8 promotores_s70_straight_simple_9 $diretorio/sigma70_straight_simple/

rm xa*
#################################################################################################
#mkdir $diretorio/sigma70_straight_suave_3

#split -l 178 $diretorio/falsos_curv_lin_suave3_ID
#mv xaa falsos_straight_suave3_1
#mv xab falsos_straight_suave3_2
#mv xac falsos_straight_suave3_3
#mv xad falsos_straight_suave3_4
#mv xae falsos_straight_suave3_5
#mv xaf falsos_straight_suave3_6
#mv xag falsos_straight_suave3_7
#mv xah falsos_straight_suave3_8
#mv xai falsos_straight_suave3_9
#mv xaj falsos_straight_suave3_10
#mv falsos_straight_suave3_1 falsos_straight_suave3_2 falsos_straight_suave3_3 falsos_straight_suave3_4 falsos_straight_suave3_5 falsos_straight_suave3_6 falsos_straight_suave3_7 falsos_straight_suave3_8 falsos_straight_suave3_9 falsos_straight_suave3_10 $diretorio/sigma70_straight_suave_3/

#split -l 178 $diretorio/promotores_s70_curv_lin_suave3_ID
#mv xaa promotores_s70_straight_suave3_1
#mv xab promotores_s70_straight_suave3_2
#mv xac promotores_s70_straight_suave3_3
#mv xad promotores_s70_straight_suave3_4
#mv xae promotores_s70_straight_suave3_5
#mv xaf promotores_s70_straight_suave3_6
#mv xag promotores_s70_straight_suave3_7
#mv xah promotores_s70_straight_suave3_8
#mv xai promotores_s70_straight_suave3_9
#mv xaj promotores_s70_straight_suave3_10
#mv promotores_s70_straight_suave3_1 promotores_s70_straight_suave3_2 promotores_s70_straight_suave3_3 promotores_s70_straight_suave3_4 promotores_s70_straight_suave3_5 promotores_s70_straight_suave3_6 promotores_s70_straight_suave3_7 promotores_s70_straight_suave3_8 promotores_s70_straight_suave3_9 promotores_s70_straight_suave3_10 $diretorio/sigma70_straight_suave_3/

#################################################################################################
#mkdir $diretorio/sigma70_straight_suave_5

#split -l 178 $diretorio/falsos_curv_lin_suave5_ID
#mv xaa falsos_straight_suave5_1
#mv xab falsos_straight_suave5_2
#mv xac falsos_straight_suave5_3
#mv xad falsos_straight_suave5_4
#mv xae falsos_straight_suave5_5
#mv xaf falsos_straight_suave5_6
#mv xag falsos_straight_suave5_7
#mv xah falsos_straight_suave5_8
#mv xai falsos_straight_suave5_9
#mv xaj falsos_straight_suave5_10
#mv falsos_straight_suave5_1 falsos_straight_suave5_2 falsos_straight_suave5_3 falsos_straight_suave5_4 falsos_straight_suave5_5 falsos_straight_suave5_6 falsos_straight_suave5_7 falsos_straight_suave5_8 falsos_straight_suave5_9 falsos_straight_suave5_10 $diretorio/sigma70_straight_suave_5

#split -l 178 $diretorio/promotores_s70_curv_lin_suave5_ID
#mv xaa promotores_s70_straight_suave5_1
#mv xab promotores_s70_straight_suave5_2
#mv xac promotores_s70_straight_suave5_3
#mv xad promotores_s70_straight_suave5_4
#mv xae promotores_s70_straight_suave5_5
#mv xaf promotores_s70_straight_suave5_6
#mv xag promotores_s70_straight_suave5_7
#mv xah promotores_s70_straight_suave5_8
#mv xai promotores_s70_straight_suave5_9
#mv xaj promotores_s70_straight_suave5_10
#mv promotores_s70_straight_suave5_1 promotores_s70_straight_suave5_2 promotores_s70_straight_suave5_3 promotores_s70_straight_suave5_4 promotores_s70_straight_suave5_5 promotores_s70_straight_suave5_6 promotores_s70_straight_suave5_7 promotores_s70_straight_suave5_8 promotores_s70_straight_suave5_9 promotores_s70_straight_suave5_10 $diretorio/sigma70_straight_suave_5

#################################################################################################
#mkdir $diretorio/sigma70_straight_suave_8

#split -l 178 $diretorio/falsos_curv_lin_suave8_ID
#mv xaa falsos_straight_suave8_1
#mv xab falsos_straight_suave8_2
#mv xac falsos_straight_suave8_3
#mv xad falsos_straight_suave8_4
#mv xae falsos_straight_suave8_5
#mv xaf falsos_straight_suave8_6
#mv xag falsos_straight_suave8_7
#mv xah falsos_straight_suave8_8
#mv xai falsos_straight_suave8_9
#mv xaj falsos_straight_suave8_10
#mv falsos_straight_suave8_1 falsos_straight_suave8_2 falsos_straight_suave8_3 falsos_straight_suave8_4 falsos_straight_suave8_5 falsos_straight_suave8_6 falsos_straight_suave8_7 falsos_straight_suave8_8 falsos_straight_suave8_9 falsos_straight_suave8_10 $diretorio/sigma70_straight_suave_8

#split -l 178 $diretorio/promotores_s70_curv_lin_suave8_ID
#mv xaa promotores_s70_straight_suave8_1
#mv xab promotores_s70_straight_suave8_2
#mv xac promotores_s70_straight_suave8_3
#mv xad promotores_s70_straight_suave8_4
#mv xae promotores_s70_straight_suave8_5
#mv xaf promotores_s70_straight_suave8_6
#mv xag promotores_s70_straight_suave8_7
#mv xah promotores_s70_straight_suave8_8
#mv xai promotores_s70_straight_suave8_9
#mv xaj promotores_s70_straight_suave8_10
#mv promotores_s70_straight_suave8_1 promotores_s70_straight_suave8_2 promotores_s70_straight_suave8_3 promotores_s70_straight_suave8_4 promotores_s70_straight_suave8_5 promotores_s70_straight_suave8_6 promotores_s70_straight_suave8_7 promotores_s70_straight_suave8_8 promotores_s70_straight_suave8_9 promotores_s70_straight_suave8_10 $diretorio/sigma70_straight_suave_8

#################################################################################################
#mkdir $diretorio/sigma70_straight_suave_12

#split -l 178 $diretorio/falsos_curv_lin_suave12_ID
#mv xaa falsos_straight_suave12_1
#mv xab falsos_straight_suave12_2
#mv xac falsos_straight_suave12_3
#mv xad falsos_straight_suave12_4
#mv xae falsos_straight_suave12_5
#mv xaf falsos_straight_suave12_6
#mv xag falsos_straight_suave12_7
#mv xah falsos_straight_suave12_8
#mv xai falsos_straight_suave12_9
#mv xaj falsos_straight_suave12_10
#mv falsos_straight_suave12_1 falsos_straight_suave12_2 falsos_straight_suave12_3 falsos_straight_suave12_4 falsos_straight_suave12_5 falsos_straight_suave12_6 falsos_straight_suave12_7 falsos_straight_suave12_8 falsos_straight_suave12_9 falsos_straight_suave12_10 $diretorio/sigma70_straight_suave_12

#split -l 178 $diretorio/promotores_s70_curv_lin_suave12_ID
#mv xaa promotores_s70_straight_suave12_1
#mv xab promotores_s70_straight_suave12_2
#mv xac promotores_s70_straight_suave12_3
#mv xad promotores_s70_straight_suave12_4
#mv xae promotores_s70_straight_suave12_5
#mv xaf promotores_s70_straight_suave12_6
#mv xag promotores_s70_straight_suave12_7
#mv xah promotores_s70_straight_suave12_8
#mv xai promotores_s70_straight_suave12_9
#mv xaj promotores_s70_straight_suave12_10
#mv promotores_s70_straight_suave12_1 promotores_s70_straight_suave12_2 promotores_s70_straight_suave12_3 promotores_s70_straight_suave12_4 promotores_s70_straight_suave12_5 promotores_s70_straight_suave12_6 promotores_s70_straight_suave12_7 promotores_s70_straight_suave12_8 promotores_s70_straight_suave12_9 promotores_s70_straight_suave12_10 $diretorio/sigma70_straight_suave_12
