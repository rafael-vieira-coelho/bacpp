# -*- coding: utf-8 -*-

# !/usr/bin/env python

########################################################################################################
########################################################################################################
########################################################################################################
##### 				Identificacao do programa					   #####
# ------------------------------------------------------------------------------------------------------#
##### Objetivo: Este script calcula o a exatidao, sensibilidade e especificidade
#####		para cada arquitetura escolhida						           #####
##### Programador: Scheila de Avila e Silva							   #####
##### Data: mestrado - melhorado em 5 de agosto de 2011						   #####
########################################################################################################
########################################################################################################
########################################################################################################
########################################################################################################

########################################################################################################
########Orientacoes#####################################################################################
# no terminal digitar python (espaco) nome_do_programa (espaco) numero de epocas (espaco) 
# numero_neuronios_ocultos (espaco) numero_folds (espaco) fator_sigma (epaco) caminho (espaco) num_seq			     						       #
# o programa pode estar em uma pasta e os arquivos em outra. para o programa funcionar basta digitar   #
# o nome dos arquivos de entrada  								       #
# com o caminho.                        							       #
#########################################################################################################
#########################################################################################################

#########################################################################################################
## INICIO DO PROGRAMA 											#
#########################################################################################################

# LEITURA DOS ARGUMENTOS DA LINHA DE COMANDO DO TERMINAL
import sys

epocas_terminal = sys.argv[1]
neuronios_prompt = sys.argv[2]
numero_fold = sys.argv[3]
fator_sigma = sys.argv[4]
caminho_endereco = sys.argv[5]
num_seq_teste = sys.argv[6]

#epocas_terminal=20
#neuronios_prompt=1
#numero_fold=5
#fator_sigma='sigma70'
#caminho_endereco='~/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/sigma70_straight_col_2/sigma70_straight_simple/'
#num_seq_teste=192

epocas = str(epocas_terminal)
neuronios = str(neuronios_prompt)
num_seq_teste_int = int(num_seq_teste)
# ----------------------------------------------------------------------------------------------------------

from math import sqrt

# ----------------------------------------------------------------------------------------------------------

# condicionais que determinam o numero de listas e folds - dentro do for das epocas-----------------
if int(numero_fold) == 5:
    numero_listas = 6
    numero_fold_int = int(int(numero_fold) + 1)
    numero_fold_aux = int(numero_fold)
if int(numero_fold) == 10:
    numero_listas = 10
    numero_fold_int = int(int(numero_fold) + 1)
    numero_fold_aux = int(numero_fold)
if int(numero_fold) == 3:
    numero_listas = 9
    numero_fold_int = int(int(numero_fold) + 1)
    numero_fold_aux = int(numero_fold)
if int(numero_fold) == 2:
    numero_listas = 10
    numero_fold_int = int(int(numero_fold) + 1)
    numero_fold_aux = int(numero_fold)
# --------------------------------------------------------------------------------------------------

# variaveis que irao receber os dados -------------------------------------------------------------
exatidoes = []
sensibilidades = []
especificidades = []

exatidaoTotal = 0
sensibilidadeTotal = 0
especificidadeTotal = 0

contFileTeste = []
totalTeste = 0

contFileTreino = []
totalTreino = 0

listaMTeste = []
listaMTreino = []
# ----------------------------------------------------------------------------------------------------
dir_dados = '/Users/coelho/Dropbox/Doutorado_Privado/Redes_neurais/C.Analisar_rede/Python/Resultados/'
fout = open(dir_dados + 'Matriz_de_confusao_' + epocas + '_hidden_' + neuronios + '_' + fator_sigma + '.txt', 'w')

for x in range(1, numero_fold_int):
    #print('Fold = ', x)
    rede = str(x)
    # y='1'
    limiar = 0.5
    limiar_menor = 0
    limiar_maior = 0
    limiar_menor2 = 0
    limiar_maior2 = 0

    for z in range(1, numero_listas):
        lista_str = str(z)
        #print('lista=', lista_str)
        # rede_1_5_hidden_1_list_1_Erroteste_sigma70.txt
        print(caminho_endereco+'erro_teste/rede'+'_'+rede+'_'+epocas+'_hidden_'+neuronios+ '_list_'+lista_str+'_Erroteste_'+fator_sigma+'.txt')
        ent = open(
            caminho_endereco + 'erro_teste/_rede' + '_' + rede + '_' + epocas + '_hidden_' + neuronios + '_list_' + lista_str + '_Erroteste_' + fator_sigma + '.txt',
            'r')
        lista_dados = []
        lista_dados = ent.readlines()
        lista_dados = [line.strip() for line in lista_dados]

        # print lista_dados
        lista_prom = lista_dados[0:num_seq_teste_int]
        for elem in lista_dados[0:num_seq_teste_int - 1]:

            valor_rn_prom = abs(float(elem))
            if valor_rn_prom > limiar:
                limiar_maior += 1
            else:
                limiar_menor += 1

        lista_aleat=lista_dados[num_seq_teste_int:]
        for elem2 in lista_dados[num_seq_teste_int - 1:]:
            valor_rn_aleat = abs(float(elem2))
            if valor_rn_aleat > limiar:
                limiar_maior2 += 1
            else:
                limiar_menor2 += 1

        #print("VN - aleat Menor=", limiar_menor2)
        #print("FP - aleat Maior=", limiar_maior2)
        #print("VN - aleat Menor=", limiar_menor2 / 10)
        #print("FP - aleat Maior=", limiar_maior2 / 10)
        fout.write('-----------Rede ' + rede + '----------\n')
        vp = float(limiar_menor)
        fn = float(limiar_maior)
        fout.write('VP=' + str(vp / (numero_listas)) + ' FN=' + str(fn / (numero_listas)) + '\n')
        vn = float(limiar_menor2)
        fp = float(limiar_maior2)

        #print("VP ==> ", vp)
        #print("VN ==> ", vn)
        #print("FN ==> ", fn)
        #print("FP ==> ", fp)

        fout.write('FP=' + str(fp / (numero_listas)) + ' VN=' + str(vn / (numero_listas)) + '\n')
        exatidao = ((vp + vn) / (vp + vn + fp + fn)) * 100
        exatidoes.append(exatidao)
        exatidaoTotal += exatidao
        fout.write('Exatidao=' + str(exatidao) + '\n')
        print("Exatidao=", exatidao)
        sensibilidade = (vp / (vp + fn)) * 100
        sensibilidades.append(sensibilidade)
        sensibilidadeTotal = sensibilidadeTotal + sensibilidade
        fout.write('Sensibilidade=' + str(sensibilidade) + '\n')
        print("Sensibilidade=", sensibilidade)
        especificidade = (vn / (vn + fp)) * 100
        especificidades.append(especificidade)
        especificidadeTotal += especificidade
        fout.write('Especificidade=' + str(especificidade) + '\n')
        print("Especificidade=", especificidade)
        ent.close()
        # Abre o arquivo redeXXhiddenXRMSteste.txt, le o arq para uma lista
        # soma todos seus valores, divide por 10 e coloca na lista de medias
        frmsTeste = open(
            caminho_endereco + 'RMS/_rede_' + rede + '_' + epocas + '_hidden_' + neuronios + '_RMSteste_' + fator_sigma + '.txt',
            'r')
        contFileTeste = frmsTeste.readlines()
        totalTeste = 0
        for i in contFileTeste:
            totalTeste += float(i)
        totalTesteMedia = totalTeste / len(contFileTeste)
        listaMTeste.append(totalTesteMedia)

        # Abre o arquivo redeXXhiddenXRMStreino.txt, le o arq para uma lista
        # soma todos seus valores, divide por 10 e coloca na lista de medias
        frmsTreino = open(
            caminho_endereco + 'RMS/_rede_' + rede + '_' + epocas + '_hidden_' + neuronios + '_RMStreino_' + fator_sigma + '.txt',
            'r')
        contFileTreino = frmsTreino.readlines()
        totalTreino = 0
        for i in contFileTreino:
            totalTreino += float(i)
        totalTreinoMedia = totalTreino / len(contFileTreino)
        listaMTreino.append(totalTreinoMedia)

        # fecha os arquivos
        frmsTeste.close()
        frmsTreino.close()

        # escreve no arq. a a media da exatidao, da sensibilidade e da especificidade
fout.write('Media da exatidao=' + str(exatidaoTotal / numero_fold_aux) + '\n')

fout.write('Media da sensibilidade=' + str(sensibilidadeTotal / numero_fold_aux) + '\n')
fout.write('Media da especificidade=' + str(especificidadeTotal / numero_fold_aux) + '\n')

# Calcula o Desvio Padrao para a Media da Exatidao
quadrados = 0
for ex in exatidoes:
    quadrados = quadrados + ((exatidaoTotal / numero_fold_aux) - ex) ** 2
desvioPadraoExatidao = sqrt(quadrados / (numero_fold_aux - 1))
fout.write('Desvio Padrao da Exatidao=' + str(desvioPadraoExatidao) + '\n')

# Calcula o Desvio Padrao para a Media da Sensibilidade
quadrados = 0
for s in sensibilidades:
    quadrados = quadrados + ((sensibilidadeTotal / numero_fold_aux) - s) ** 2
desvioPadraoSensibilidade = sqrt(quadrados / (numero_fold_aux - 1))
fout.write('Desvio Padrao da Sensibilidade=' + str(desvioPadraoSensibilidade) + '\n')

# Calcula o Desvio Padrao para a Media da Especificidade
quadrados = 0
for e in especificidades:
    quadrados = quadrados + ((especificidadeTotal / numero_fold_aux) - e) ** 2
desvioPadraoEspecificidade = sqrt(quadrados / (numero_fold_aux - 1))
fout.write('Desvio Padrao da Especificidade=' + str(desvioPadraoEspecificidade) + '\n')

# Calcula a Media das Medias dos RMSteste
somaMediasTeste = 0
for m in listaMTeste:
    somaMediasTeste = somaMediasTeste + m
fout.write('Media das Medias do RMSteste=' + str(somaMediasTeste / numero_fold_aux) + '\n')

# Calcula a Media das Medias dos RMStreino
somaMediasTreino = 0
for m in listaMTreino:
    somaMediasTreino = somaMediasTreino + m
fout.write('Media das Medias do RMStreino=' + str(somaMediasTreino / numero_fold_aux) + '\n')

# Calcula o Desvio Padrao para a Media das Medias RMSteste
quadrados = 0
for v in listaMTeste:
    print(str(v))
    quadrados = quadrados + ((somaMediasTeste / numero_fold_aux) - v) ** 2
desvioPadraoMMTeste = sqrt(quadrados / (len(listaMTeste) - 1))
fout.write('Desvio Padrao da Media das Medias de RMSteste=' + str(desvioPadraoMMTeste) + '\n')

# Calcula o Desvio Padrao para a Media das Medias RMStreino
quadrados = 0
for v in listaMTreino:
    quadrados = quadrados + ((somaMediasTreino / numero_fold_aux) - v) ** 2
desvioPadraoMMTreino = sqrt(quadrados / (len(listaMTreino) - 1))
fout.write('Desvio Padrao da Media das Medias de RMStreino=' + str(desvioPadraoMMTreino) + '\n')

fout.close()
