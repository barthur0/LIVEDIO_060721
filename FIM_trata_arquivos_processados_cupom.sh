#!/bin/bash
########### Definição de Variaveis ##################

ROOT_DIR=/diretorio/Processar ;

FILE_NAME=MVC_CUPOM.txt;

PROCESSADOS=/diretorio/Processados ;

DT_PROCESSO=`date +"%Y%m%d_%H%M%S"`

############### Compacta os Arquivos ###########################

cd $ROOT_DIR

tar -cvf Arq_processados_buffer_atc_cupom_$DT_PROCESSO.txt.tar $FILE_NAME ;

compress Arq_processados_buffer_atc_cupom_*.txt.tar ;


######## Move o Arquivo para o Diretorio de Processados #####################

cd $ROOT_DIR

mv Arq_processados_buffer_atc_cupom_*.tar.Z $PROCESSADOS;


################## Mantem em diretorio processados somente os ultimos 4 arquivos ########################

cd $PROCESSADOS

ls -rt Arq_processados_buffer_atc_cupom*.tar.Z | tail -4 > lista1 ;

ls -rt Arq_processados_buffer_atc_cupom*.tar.Z > lista2 ;

rm -f `diff lista1 lista2` ;

rm -f lista1 lista2 ;

################## Exclui arquivos ####################

cd $ROOT_DIR

rm -f $FILE_NAME

#exit