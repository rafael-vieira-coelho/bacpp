from operator import pos

__author__ = 'Rafael Vieira Coelho'
##############################################################################
# DESCRIÇÃO: programa procura por regições promotoras em genomas completos a #
#            partir dos fatores de transcrição.                              #
##############################################################################
# ENTRADAS:                                                                  #
#     - arquivos texto na pasta /Sigmas/ contendo as sequencias com os       #
#       fatores de transcrição (ex: SigA.txt)                                #
#                                                                            #
#     - arquivos texto na pasta /Genomas/ contendo as sequencias completas de#
#       dna das bacterias (ex: file1.txt).                                   #
##############################################################################
# SAÍDAS:                                                                    #
#     - arquivos texto na pasta /Promotores/ contendo as sequencias          #
#       dos respectivos genomas e fatores de transcrição. É criada uma       #
#       subpasta para cada genoma. Ex: o fator de transcrição acuABC gera o  #
#       arquivo cuABC.promoter quando encontrado um promotor do mesmo.       #
##############################################################################
import sys, os, time, re

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
    file.write(text)
    file.write('\n')
    file.flush()
    file.close()
#########################################################
# Função remove as linhas em branco contidas no arquivo #
#########################################################
# @fileName: nome do arquivo                            #
#########################################################
def removeBlankLines(fileName):
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
            file.write('\n')
            file.flush()
            file.close()
        except IOError as erro:
            print('Erro: Impossível abrir o arquivo para escrita: ', erro)
            sys.exit(-2)
    except IOError as erro:
        print ('Erro: Impossível abrir o arquivo para leitura: ', erro)
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
    print(title, fileName)
    if (removeBlanks == 1):
        removeBlankLines(os.curdir + fileName)
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
    #print(text + str(numberFiles))
    return files
#########################################################
# Função que remove caracteres inválidos para nome de   #
# pasta ou arquivo(' ', ':', '|')                       #
#########################################################
#@name: texto a ser analisado                           #
#########################################################
def removeInvalidChar(name):
    name = str(name.replace(' ', '_'))
    name = str(name.replace(':', '-'))
    name = str(name.replace('|', '.'))
    return name
#########################################################
#Função que grava sequencia promotora em arquivo        #
#########################################################
#@sigmaFormated: identificador do promotor no formato do#
#                arquivo FASTA do fator de transcrição  #
#                pronto para gravação no arquivo (sem   #
#                erro de sintaxe)                       #
#@sigma: sequencia de dna do fator de transcrição       #
#@folderName: nome da pasta onde será salvo o arquivo   #
#@name: identificador do promotor no formato do arquivo#
#        FASTA do fator de transcrição não formatado    #
#########################################################
def recordPromoterInFile(sigmaFormated, sigma, folderName, name):
    folderName = removeInvalidChar(folderName)
    if ('Promotores' not in os.listdir(os.curdir)):
        os.mkdir(os.curdir + "/Promotores/")
    if (folderName not in os.listdir(os.curdir + "/Promotores/")):
        os.mkdir(os.curdir + "/Promotores/" + folderName)
    path = os.path.expanduser(os.curdir + "/Promotores/" + folderName)
    try:
        if (len(sigma) == 80):
            filePromoter = open(path + '/' + name + '.promoter.fasta', 'w')
            #filePromoter.write(sigmaFormated + '\n' + sigma)
            print(sigma + ' - ' + str(len(sigma)))
            filePromoter.write(sigma)
            filePromoter.write('\n')
            filePromoter.flush()
            filePromoter.close()
            return sigma
    except IOError:
        print('Erro: Impossível criar o arquivo de saída: promoter ' + name + '.txt')
    return ''
#########################################################
# Função que salva promotor encontrado                  #
#########################################################
# @lines: linhas do arquivo genoma                      #
# @sigma: linha do arquivo fator de transcrição (sigma) #
# @folderName: nome da pasta na qual será salva a       #
#              sequencia promotora encontrada           #
# @index: posição inicial do fator sigma no genoma      #
#########################################################
def savePromoter(lines, sigma, folderName, index, name, isAbsolute):
    #>acuABC|acuA|3040002..3040068|-49:+18|AAAATATAAACCATGTTGAAAACGCTTTATAATTTGGTATTCTTAAAGAAGGCATGTATTTTTGATA
    posAnterior = int((sigma.split('\t')[3]).split(':')[0])
    posPosterior = int((sigma.split('\t')[3]).split(':')[1])
    sigmaFormated = '>' + re.sub("\t", "|", sigma)
    #print('\nPromotor encontrado:')
    return recordPromoter(lines, posAnterior, posPosterior, sigmaFormated, folderName, index, name, isAbsolute)
#########################################################
# Função que salva promotor encontrado com falta de     #
# dados de posição (None)                               #
#########################################################
# @lines: linhas do arquivo genoma                      #
# @sigma: linha do arquivo fator de transcrição (sigma) #
# @folderName: nome da pasta na qual será salva a       #
#              sequencia promotora encontrada           #
#########################################################
def recordPromoterNone(lines, posAnterior, tamSigma, posPosterior, sigmaFormated, folderName, name, i):

    antes = lines[(i - posAnterior):(i + 1)]
    meio = lines[(i + 1):(i + 1 + tamSigma)]
    depois = lines[(i + 1 + tamSigma):(i + 1 + tamSigma + posPosterior)]

    if (antes.__contains__('\n')):
        antes = antes.split('\n')[0] + antes.split('\n')[1]
    if (meio.__contains__('\n')):
        meio = meio.split('\n')[0] + meio.split('\n')[1]
    if (depois.__contains__('\n')):
        depois = depois.split('\n')[0] + depois.split('\n')[1]
    sigma = antes + meio + depois

    if (len(sigma) == 79):
        depois = lines[(i + 1 + tamSigma):(i + 2 + tamSigma + posPosterior)]
    sigma = antes + meio + depois
    if (sigma.__contains__('\n')):
        sigma = sigma.split('\n')[0] + sigma.split('\n')[1]
    #if (len(sigma) != 80):
    #print('\n' + sigma + ' - ' + str(len(sigma)))
    #    print('ANTES: ' + antes + ' ' + str(len(antes)))
    #    print('SIGMA: ' + meio + ' ' + str(len(meio)))
    #    print('DEPOIS: ', depois + ' ' + str(len(depois)))
    return recordPromoterInFile(sigmaFormated, sigma, folderName, name)

def savePromoterNone(lines, sigmas, folderName, name, i):
    tamSigma = len(sigmas.split('\t')[4])
    position = ((80 - tamSigma) / 2)
    posAnterior = int(round(position, 0)) #arredonda pra cima. Ex: 22.5 => 23
    posPosterior = int(position) #arredonda pra baixo. Ex: 22.5 => 22
    #print('ANTES:' + str(posAnterior))
    #print('DEPOIS:' + str(posPosterior))
    sigmaFormated = '>' + re.sub("\t", "|", sigmas)
    total = posAnterior + tamSigma + posPosterior
    return recordPromoterNone(lines, posAnterior, tamSigma, posPosterior, sigmaFormated, folderName, name, i)

#########################################################
# Função que mostra informaçoes do promotor encontrado  #
# na tela e chama do método para salvá-lo em arquivo.   #
#########################################################
# @lines: linhas do arquivo genoma                      #
# @posAnterior: número de caracteres da sequencia antes #
#               do fator de transcrição.                #
# @posPosterior:número de caracteres da sequencia depois#
#               do fator de transcrição.                #
# @sigmaFormated: fator de transcrição (sigma)          #
# @folderName: nome da pasta na qual será salva a       #
#              sequencia promotora encontrada           #
# @isNone: indica se o promotor encontrado tem as       #
#          posições necessárias. Caso seja 1, não tem.  #
# @i: posição inicial do fator sigma no genoma          #
#########################################################
def recordPromoter(lines, posAnterior, posPosterior, sigmaFormated, folderName, i, name, isAbsolute):
    sobrando = 0
    if (isAbsolute == 1):
        tamSigma = posPosterior - posAnterior
        if (tamSigma > 80):
            sobrando = tamSigma - 81
    else:
        tamSigma = len(sigmaFormated.split("|")[4])

    posPosterior =  19 - posPosterior
    posAnterior  =  61 + posAnterior
    if (posPosterior < 0):
        posAnterior += posPosterior
    if (posAnterior < 0):
        posPosterior += posAnterior + 1
    if (posAnterior >= 0):
        tamSigma -= sobrando
        antes = lines[(i - posAnterior):(i + 1)]
        meio = lines[(i + 1):(i + 1 + tamSigma)]
        depois = lines[(i + 1 + tamSigma):(i + 1 + tamSigma + posPosterior)]
        if (meio.__contains__('\n')):
            meio = meio.split('\n')[0] + meio.split('\n')[1]
        if (antes.__contains__('\n')):
            antes = antes.split('\n')[0] + antes.split('\n')[1]
        if (depois.__contains__('\n')):
            depois = depois.split('\n')[0] + depois.split('\n')[1]

        sigma = antes + meio + depois
    else:
        sigma = lines[i:(i + 81)]

    if (sigma.__contains__('\n')):
       sigma = sigma.split('\n')[0] + sigma.split('\n')[1]

    #if (len(sigma) != 80):
    #print(sigma + ' - ' + str(len(sigma)))
        #print(str(sobrando))
        #print('posAnterior: ' + str(posAnterior))
        #print('posPosterior: ' + str(posPosterior))
        #print('ANTES: ' + antes + ' ' + str(len(antes)))
        #print('SIGMA: ' + meio + ' ' + str(len(meio)))
        #print('DEPOIS: ', depois + ' ' + str(len(depois)))
    return recordPromoterInFile(sigmaFormated, sigma, folderName, name)

######################### Programa Principal ############################
######################## FORMATO DO ARQUIVO SIGMAS.TXT #############################################
#Operon	Regulated Gene	Absolute position	Location	Binding seq.(cis-element)                  #
#abnA	abnA	2950133..2950187	-48:+7	CTATTTTTTTGTCTGTACAAATTACAGCATAGTGACTACAATAAAGGGGATACCG#
#   0     1         2                 3            4                                               #
####################################################################################################
inicio = time.time()
arquivosSigma = listFilesFromFolder('/Sigmas/', 'Número de Arquivos de Fatores de Transcrição: ')
arquivosGenomas = listFilesFromFolder('/Genomas/', 'Número de Arquivos de Genoma: ')
for arquivoGenoma in arquivosGenomas:
    linhasGenomas = getLinesFromFile('Genoma ', "/Genomas/" + arquivoGenoma, 0, 0)
    print('_'*100)
    number_genome = 1
    number_promoters = 1
    arquivoFinal = ''
    for arquivoSigma in arquivosSigma:
        sigmas = getLinesFromFile('Arquivo: ', '/Sigmas/' + arquivoSigma, 1, 1)
        print('Numero de Fatores de Transcricao: ', len(sigmas))
        index = 0
        while (index < len(sigmas)):
                try:
                    sigma = sigmas[index].split('\t')[4]
                    if (linhasGenomas.find(sigma) != -1):
                        i = linhasGenomas.index(sigma)
                        try:
                            sigmaOk = savePromoter(linhasGenomas, sigmas[index], 'GENOMA_' + str(number_genome), i, str(number_promoters), 0)
                            if (sigmaOk != ''):
                                print(str(number_promoters) + ' - ' + sigmas[index] + ' (SIG)')
                                number_promoters += 1
                                arquivoFinal += sigmaOk + '\n'
                        except ValueError:
                            posicoes = sigmas[index].split('\t')[2]
                            if (posicoes != 'ND'):
                                sigmaOk = savePromoterNone(linhasGenomas, sigmas[index], 'GENOMA_' + str(number_genome), str(number_promoters), i)#casos None
                                if (sigmaOk != ''):
                                    print(str(number_promoters) + ' - ' + sigmas[index] + ' (None)')
                                    number_promoters += 1
                                    arquivoFinal += sigmaOk + '\n'
                    else:
                        posicoes = sigmas[index].split('\t')[2]
                        if (posicoes != 'ND'):
                            sigmaFormated = '>' + re.sub("\t", "|", sigmas[index])
                            try:
                                posAbs1 = int((sigmas[index].split('\t')[2]).split('..')[0])
                                sigmaOk = savePromoter(linhasGenomas, sigmas[index], 'GENOMA_' + str(number_genome), posAbs1, str(number_promoters), 1)
                                if (number_promoters == 403):
                                #if (int(sigmas[index].split('\t')[2].split('..')[0]) - 60 + int(sigmas[index].split('\t')[3].split(':')[0]) < 0):
                                #    print('\n\n')
                                #    print(sigmaOk + ' (NO) ')
                                    absolut = linhasGenomas[posAbs1:(posAbs1 + 81)]
                                    sigmaOk = str(absolut.split('\n')[0] + absolut.split('\n')[1])
                                #    print(sigmaFormated)
                                    print(sigmaOk + ' (Corrigido) ')
                                #    print('\n\n')
                                #    exit(99)

                                if (sigmaOk != ''):
                                    print(str(number_promoters) + ' - ' + sigmaFormated + ' (ABS)')
                                    number_promoters += 1
                                    arquivoFinal += sigmaOk + '\n'
                            except ValueError:
                                sigmaOk = savePromoterNone(linhasGenomas, sigmas[index], 'GENOMA_' + str(number_genome), str(number_promoters), i)#casos None
                                if (sigmaOk != ''):
                                    print(str(number_promoters) + ' - ' + sigmaFormated + ' (None)')
                                    number_promoters += 1
                                    arquivoFinal += sigmaOk + '\n'
                        else:
                            print('ERRO: ' + sigmas[index])
                            ads=1
                except IndexError:
                    print(sigmas[index])
                index+=1
    recordInFile('/Promotores/Promotores' + str(number_genome) + '.txt', arquivoFinal, 1)
    number_genome += 1
print('_' * 100)
print('Arquivos promotores gravados com sucesso!')
print('_' * 100)
print('TOTAL DE PROMOTORES ENCONTRADOS: ', str(number_promoters - 1))
fim = time.time()
total = fim - inicio
print('\nTempo Total: ', round(total, 2), 's')
