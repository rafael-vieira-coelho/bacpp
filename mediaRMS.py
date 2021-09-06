#!/usr/bin/env python
########################################################################################################
# Objetivo: Este script calcula o RMS para cada camada de neuronios ocultos	  	               #
# Programador: Scheila de Avila e Silva							               #
# Data: 2010 - melhorado em 09 de abril de 2015						               #
########Orientacoes#####################################################################################
# no terminal digitar python (espaco) nome_do_programa (espaco) numero_neuronios_ocultos (espaco)      #
# numero_folds (espaco) fator sigma (espaco) endereco						       #
# o programa pode estar em uma pasta e os arquivos em outra. para o programa funcionar basta digitar   #
# o nome dos arquivos de entrada  								       #
# com o caminho.                        							       #
########################################################################################################

import sys

neuronios = sys.argv[1]
numero_fold = sys.argv[2]
fator_sigma = sys.argv[3]
caminho_endereco = sys.argv[4]

# Listas que irao receber os arquivos de entrada
contFileTeste = []
contFileTreino = []
# Abertura dos arquivos de saida
out = open('./MediaRMS/RMSteste_hidden_' + neuronios + '_' + fator_sigma + '.txt', 'w')
out1 = open('./MediaRMS/RMStreino_hidden_' + neuronios + '_' + fator_sigma + '.txt', 'w')

for epocas_aux in range(1,21):  #### For que faz a iteracao com as epocas - Neste caso para simulacoes com ate 150 epocas
    listaMTeste = 0  # listas que soma os RMS - deve estar aqui para o programa funcionar
    listaMTreino = 0  # listas que soma os RMS - deve estar aqui para o programa funcionar

    #if int(numero_fold) == 3:
    #    numero_listas = 9
    #else:
    numero_listas = 5

    for listas in range(1, int(numero_fold) + 1):  ### For que faz a iteracao com as redes - dentro do for das epocas
        totalTeste = 0
        totalTesteMedia = 0
        totalTreino = 0
        totalTreinoMedia = 0

        epocas = str(epocas_aux * 5)
        num_rede = str(listas)

        # Calculo da media (dentro do for das listas) ----------------------------------------------------------------
        #_rede_1_5_hidden_1_RMSteste_sigma70.txt
        frmsTeste = open(caminho_endereco
                         + '_rede_'
                         + num_rede
                         + '_'
                         + epocas
                         + '_hidden_'
                         + neuronios
                         + '_RMSteste_'
                         + fator_sigma
                         + '.txt', 'r')
        contFileTeste = frmsTeste.readlines()
        for i in contFileTeste[0:numero_listas]:
            totalTeste += float(i)
        totalTesteMedia = totalTeste / numero_listas
        listaMTeste += totalTesteMedia

        frmsTreino = open(caminho_endereco
                          + '_rede_'
                          + num_rede
                          + '_'
                          + epocas
                          + '_hidden_'
                          + neuronios
                          + '_RMStreino_'
                          + fator_sigma + '.txt',
                          'r')
        contFileTreino = frmsTreino.readlines()
        for i in contFileTreino[0:numero_listas]:
            totalTreino += float(i)
        totalTreinoMedia = totalTreino / numero_listas
        listaMTreino += totalTreinoMedia

    # Gravacao do arquivo de saida (dentro do for das epocas) --------------------------------
    out1.write(epocas + ' ' + str(listaMTreino / int(numero_fold)) + '\n')
    out.write(epocas + ' ' + str(listaMTeste / int(numero_fold)) + '\n')

frmsTreino.close()
out.close()
out1.close()
frmsTeste.close()
out1.close()
