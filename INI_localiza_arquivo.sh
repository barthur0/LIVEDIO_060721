
#### Recebe o valor das variaveis de entrada (diretorio e nome do arquivo)

DIR=$1
FILE=$2
LOG=Arq_$FILE.log


#### Muda o diretó de execuç para o diretó do arquivo e cria um arquivo de log.

cd $DIR;
touch $LOG;

#### lista os arquivos requeridos na variavel de lista



#### verifica se o(s) arquivo(s) existem, se sim, sai do looping, se nã faz nova tentativa

while :
do
        LIST_ARQ=`ls -tr $FILE | head -1`;
        echo $LIST_ARQ >> $LOG;

        if test -e "$LIST_ARQ"
        then
                echo "Arquivo encontrado" >> $LOG
                rm -f $LOG
                break
        else
                echo "Arquivo nao encontrado" >> $LOG
                date >> $LOG
                sleep 300
        fi
done

