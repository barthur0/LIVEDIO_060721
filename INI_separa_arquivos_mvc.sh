#!/bin/bash

#### 
#### Recebe o valor das variaveis de entrada (diretorio e nome do arquivo)
#### 

DIR_BASTAO="/diretorio1/"
MASCARA="mvc*.txt"
ARQ_ORIG=`ls $DIR_BASTAO"/"mvc*.txt`

####
#### Cria arquivo de CUPOM
####

cat $DIR_BASTAO"/"$MASCARA | awk '{if ((substr($1,1,2) == 51) && (substr($1,1,11) != 51999999999)) print}' > $DIR_BASTAO"/"MVC_CUPOM.txt


####
#### Cria arquivo de TRANSACAO_CUPOM
####

cat $DIR_BASTAO"/"$MASCARA | awk '{if ((substr($1,1,2) == 52) && (substr($1,1,11) != 52999999999)) print}' > $DIR_BASTAO"/"MVC_TRANSACAO_CUPOM.txt

####
#### Cria arquivo de ITEMCUPOM
####

cat $DIR_BASTAO"/"$MASCARA | awk '{if ((substr($1,1,2) == 53) && (substr($1,1,11) != 53999999999)) print}' > $DIR_BASTAO"/"MVC_ITEMCUPOM.txt

####
#### Cria arquivo de NOTA
####

cat $DIR_BASTAO"/"$MASCARA | awk '{if ((substr($1,1,2) == 54) && (substr($1,1,11) != 54999999999)) print}' > $DIR_BASTAO"/"MVC_NOTA.txt

####
#### Cria arquivo de TRANSACAO_NOTA
####

cat $DIR_BASTAO"/"$MASCARA | awk '{if ((substr($1,1,2) == 55) && (substr($1,1,11) != 55999999999)) print}' > $DIR_BASTAO"/"MVC_TRANSACAO_NOTA.txt

####
#### Cria arquivo de ITEMNOTA
####

cat $DIR_BASTAO"/"$MASCARA | awk '{if ((substr($1,1,2) == 56) && (substr($1,1,11) != 56999999999)) print}' > $DIR_BASTAO"/"MVC_ITEMNOTA.txt


##
##
##
QTD_ARQS=`ls -lt $DIR_BASTAO"/"MVC*.txt | wc -l`

	if [ $QTD_ARQS -ge 4 ];
			then
			mv $DIR_BASTAO"/"mvc*.txt /diretorio/backup
	else
			 touch /diretorio/Logs/Erro_separacao_arquivo_mvc.txt
	fi

	


