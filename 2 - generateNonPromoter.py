__author__ = 'Rafael Vieira Coelho'

import random

##############################################################################
# DESCRIÇÃO: programa procura por regições não promotoras em genomas         #
#            completos de maneira aleatória                                  #
##############################################################################
# ENTRADAS:                                                                  #
#     - arquivos texto na pasta /Promotores/ contendo as sequencias          #
#       promotoras                                                           #
#                                                                            #
#     - arquivos texto na pasta /Genomas/ contendo as sequencias completas de#
#       dna das bacterias (ex: file1.txt).                                   #
##############################################################################
# SAÍDAS:                                                                    #
#     - arquivos texto na pasta /Falsos/ contendo as sequencias              #
#       aleatórias. Ex: _cuABC.fasta                                         #
##############################################################################
import sys, os.path, os, time, re

############################## Funções Auxiliares ############################
#########################################################
# Função que grava dados em um arquivo texto            #
#########################################################
# @fileName: nome do arquivo                            #
# @text: texto que será gravado                         #
# @exitOutputvalue: valor inteiro de erro que será      #
#                   mostrado na tela caso dê erro       #
#########################################################
def recordInFile(fileName, text, exitOutputValue):
    file = openFile(os.curdir + fileName, 'w', exitOutputValue)
    file.write(text + '\n')
    file.flush()
    file.close()
#########################################################
# Função remove as linhas em branco contidas no arquivo #
#########################################################
# @fileName: nome do arquivo                            #
#########################################################
def removeBlanckLines(fileName):
    try:
        file = open(fileName, 'r+')
        lines = file.read().split('\n')
        file.close()
        text = ''
        for line in lines:
            if (not line.isspace()):
                text += line + '\n'
        try:
            file = open(fileName, 'w')
            file.write(text.strip())
            file.flush()
            file.close()
        except IOError as erro:
            print('Erro: Impossivel abrir o arquivo para escrita: ', erro)
            sys.exit(-2)
    except IOError as erro:
        print ('Erro: Impossivel abrir o arquivo para leitura: ', erro)
        sys.exit(-1)
#########################################################
# Função que retorna a referência do arquivo aberto     #
#########################################################
#@fileName: nome do arquivo                             #
#@permission: escrita (w) ou leitura(r)                 #
#@outputValue: valor inteiro que será retornado em caso #
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
# Função que retorna uma lista com as linhas do arquivo #
#########################################################
#@title: texto a ser escrito na tela                    #
#@fileName: nome do arquivo                             #
#@splitFile: valor lógico que indica se deve ser usada a#
#            função split para dividir o arquivo em     #
#            linhas: split('\n')                        #
#@removeBlanks: valor lógico que indica se devem ser    #
#               removidas as linhas em branco           #
#########################################################
def getLinesFromFile(title, fileName, splitFile, removeBlanks):
    #print(title, fileName)
    if (removeBlanks == 1):
        removeBlanckLines(os.curdir + fileName)
    file = openFile(os.curdir + fileName, 'r', -1)
    if (splitFile == 1):
        lines = file.read().split('\n')
    else:
        lines = file.read()
    file.close()
    return lines
#########################################################
# Função que lista os arquivos contido em um diretório  #
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

def searchNonPromoter(listaFalsosEncontrados, listaPromotores):

        linha = getLinesFromFile('Genoma ', "/Genomas/file1.fasta", 1, 1)
        indice = 0

        while (indice == 0):
            indice = random.randint(0, len(linha))

        while ((linha[indice] in listaFalsosEncontrados)
               and (linha[indice] in listaPromotores)
               and linha[indice] == 'None'):
            indice = random.randint(0, len(linha))

        return linha[indice]

######################### Programa Principal ############################
inicio = time.time()

if ('Falsos' not in os.listdir(os.curdir)):
   os.mkdir(os.curdir + "/Falsos/")

#arquivosGenomas = listFilesFromFolder('/Genomas/', 'Número de Arquivos de Genoma: ')
#for arquivoGenoma in arquivosGenomas:
pastasPromotores = listFilesFromFolder('/Promotores/', 'Genomas : ')
print('-'*100)
print('Falsos Promotores Encontrados: ')
print('-'*100)
cont = 1
for pasta in pastasPromotores:
    arquivosPromotores = listFilesFromFolder('/Promotores/' + pasta + '/', 'Numero Total de Promotores Encontrados: ')
    for arquivo in arquivosPromotores:
        linhasPromotores = getLinesFromFile('', "/Promotores/" + pasta +'/' + arquivo, 1, 1)
    listaFalsos = []
    x = 0
    for arquivo in arquivosPromotores:
        if (pasta not in os.listdir(os.curdir + "/Falsos/")):
            os.mkdir(os.curdir + "/Falsos/" + pasta)
        path = os.path.expanduser(os.curdir + "/Falsos/" + pasta)
        try:
            arquivoNaoPromotor = open(path + '/nonPromoter' + str(cont) + '.fasta', 'w')
            regiaoNaoPromotora = searchNonPromoter(listaFalsos, linhasPromotores)
            listaFalsos.append(regiaoNaoPromotora)
            print(str(cont) + ' ' + regiaoNaoPromotora)
            cont+=1
            arquivoNaoPromotor.write(regiaoNaoPromotora)
            arquivoNaoPromotor.write('\n')
            arquivoNaoPromotor.flush()
            arquivoNaoPromotor.close()
        except IOError:
            print('Erro: Impossível criar o arquivo de saída: não promoter ' + arquivo + '.fasta')
    x += 1
    file = open(os.curdir + "/Falsos/" + 'Falsos' + str(x) + '.txt', 'w')
    for naoProm in listaFalsos:
        file.write(naoProm + '\n')
        file.flush()
    file.close()
fim = time.time()
total = fim - inicio
print(' Tempo Total: ', round(total, 2), 's')
