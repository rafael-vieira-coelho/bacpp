__author__ = 'Rafael Vieira Coelho'

import random

##############################################################################
# DESCRI??O: programa procura nos promotores encontrados pelo programa       #
#            searchPromoter.py uma sequencia de nucleotideoso espec?fica     #
##############################################################################
# ENTRADAS:                                                                  #
#     - arquivos texto na pasta /Promotores/ contendo as sequencias          #
#       promotoras                                                           #
##############################################################################
import sys, os.path, os, time, re

############################## Fun??es Auxiliares ############################
#########################################################
# Fun??o que retorna a refer?ncia do arquivo aberto     #
#########################################################
#@fileName: nome do arquivo                             #
#@permission: escrita (w) ou leitura(r)                 #
#@outputValue: valor inteiro que ser? retornado em caso #
#              de erro (Ex: -1)                         #
#########################################################
def openFile(fileName, permission, outputValue):
    try:
        file = open(fileName, permission)
        return file
    except IOError as erro:
        print ('Erro:' + str(erro))
        sys.exit(outputValue)
#########################################################
# Fun??o que retorna uma lista com as linhas do arquivo #
#########################################################
#@title: texto a ser escrito na tela                    #
#@fileName: nome do arquivo                             #
#@splitFile: valor l?gico que indica se deve ser usada a#
#            fun??o split para dividir o arquivo em     #
#            linhas: split('\n')                        #
#@removeBlanks: valor l?gico que indica se devem ser    #
#               removidas as linhas em branco           #
#########################################################
def getLinesFromFile(title, fileName, splitFile):
    file = openFile(os.curdir + fileName, 'r', -1)
    if (splitFile == 1):
        lines = file.read().split('\n')
    else:
        lines = file.read()
    file.close()
    return lines
#########################################################
# Fun??o que lista os arquivos contido em um diret?rio  #
#########################################################
#@folderName: nome da pasta                             #
#@text: texto que representa o arquivo e sera escrito   #
#       na tela                                         #
#########################################################
def listFilesFromFolder(folderName, text):
    files = os.listdir(os.curdir + folderName)
    numberFiles = len(files)
    print(text + str(numberFiles))
    return files

######################### Programa Principal ############################
#nucleotide=sys.argv[1]
nucleotide='eATCTTTTTCGGCTTTTTTTAGTATCCACAGAGGTTATCGACAACATTTTCACATTACCAACCCCTGTGGACAAGGTTTT'

#arquivosGenomas = listFilesFromFolder('/Genomas/', 'N?mero de Arquivos de Genoma: ')
#for arquivoGenoma in arquivosGenomas:
pastasPromotores = listFilesFromFolder('/Promotores/', 'Genomas : ')
for pasta in pastasPromotores:
    arquivosPromotores = listFilesFromFolder('/Promotores/' + pasta + '/', 'Numero Total de Promotores Encontrados: ')
    for arquivo in arquivosPromotores:
        linhasPromotores = getLinesFromFile('', "/Promotores/" + pasta +'/' + arquivo, 1)
        for linha in linhasPromotores:
            if (linha == nucleotide):
                print(linha)
                print(arquivo)
                exit(2)