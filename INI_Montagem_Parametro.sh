cd /diretorio/;

MASCARA=arquivo.txt;

echo 1 > ${MASCARA}_err.log;

QTD=`echo ${MASCARA} | wc -c`;

echo 2 >> ${MASCARA}_err.log;

#Qtd de caracteres da prefixo + lote + mascara
QTD_INI=`echo 24+$QTD | bc ` ;

echo 3 >> ${MASCARA}_err.log;

#Qtd de caracteres da prefixo + mascara + data
QTD_FIM=`echo 7+$QTD_INI | bc ` ;

echo 4 >> ${MASCARA}_err.log;

DATA=`ls  -tr R06_??????_BR_DWH_${MASCARA}_????_*_*_*.txt | head -1 | cut -c${QTD_INI}-${QTD_FIM}`;

status=$?;

echo status a = $status >> ${MASCARA}_err.log;

echo 5 >> ${MASCARA}_err.log 2>&1 ;


echo 6 >> ${MASCARA}_err.log;

ls -tr R06_??????_BR_DWH_${MASCARA}_????_${DATA}_*_*.txt  >Arq_Lista_${MASCARA}.txt;

echo 7 >> ${MASCARA}_err.log;

status=$?;

echo status b = $status >> ${MASCARA}_err.log;

echo 8 >> ${MASCARA}_err.log;

echo [PAR.WF:wf_PARARM_$MASCARA]   >> Arq_CTL_${MASCARA}.txt;

echo \$DBConnection_ODS=ODS >> Arq_CTL_${MASCARA}.txt;
echo \$DBConnection_STG=STG >> Arq_CTL_${MASCARA}.txt;
echo \$\$REFDATE=$DATA >> Arq_CTL_${MASCARA}.txt;

rm ${MASCARA}_err.log;
