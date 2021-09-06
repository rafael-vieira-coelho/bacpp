#coding:utf-8
__author__ = 'Rafael Vieira Coelho'

import sys
############################################################################
# Objetivo: Este script verifica se todas as linhas tem o mesmo tamanho    #
############################################################################
# Data: criado em 23 de maioo de 2014                                      #
############################################################################
# Funcionamento:                                                           #
#    python nome_do_programa arquivo_entrada caminho_pasta                 #
############################################################################
# Parametros de Entrada da Linha de Comando: argv[]                        #
############################################################################
# * arv[1]: nome do arquivo de entrada                                     #
# * arv[2]: caminho dos arquivos                                           #
############################################################################

#input_file_name=sys.argv[1]
#file_path=sys.argv[2]
input_file_name = "Promotores1.txt"
file_path = "./Promotores/"

try:
    input_file=open(file_path + input_file_name, 'r')
except IOError as erro:
    print('Erro: Impossivel abrir o arquivo de leitura: ' + input_file_name + ' ' + str(erro))
    sys.exit(-1)

lines = input_file.read().split('\n')
input_file.close()
tam_ant = len(lines[0])
print('Linha 0: ' + str(tam_ant))
ok = 1
for x in range(1, len(lines)):
    if (len(lines[x]) != 0):
        tam = len(lines[x])
        print('Linha '+ str(x) + ': ' + str(tam))
        if (tam_ant != tam and tam != 0 and tam_ant != 0):
            print('ERRO - linha ' + str(x + 1) + ' de tamanho diferente: ' + str(tam) + ' x ' + str(tam_ant))
            ok = 0
            break
        tam_ant = tam
if (ok == 1):
    print('\nTAMANHO DE CADA LINHA: ' + str(tam))