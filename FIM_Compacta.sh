cd /diretorio1/ ;

MASCARA=$$MASCARA;

tar -cvf Arq_$MASCARA.txt.tar `cat Arq_Lista_$MASCARA.txt` ;

compress Arq_$MASCARA.txt.tar ;


MASCARA=$$MASCARA;
PROC=/diretorio1/PROCESSADOS/;
REJ=/diretorio1/REJEITADOS/;
ARQ_CTL=/diretorio1/Arq_CTL_${MASCARA}.txt;

Data=`date +%d%m%y_%H%M%S`;

mv Arq_${MASCARA}.bad ${REJ}Arq_CTL_${MASCARA}_$Data.bad;
mv Arq_${MASCARA}.txt.tar.Z ${PROC}Arq_${MASCARA}_$Data.txt.tar.Z;


DATA=`grep REFDATE ${ARQ_CTL} | cut -d= -f2`;

echo ${DATA} >  Arq_${MASCARA}.ok;




rm -f `cat Arq_Lista_${MASCARA}.txt`;
rm -f Arq_${MASCARA}.txt ;
rm -f Arq_Lista_${MASCARA}.txt ;
rm -f Arq_CTL_${MASCARA}.txt ;
rm -f *_PastaPWC_${MASCARA}.txt ;
rm -f FolderParam_${MASCARA}.txt ;
rm -f FolderPWC_${MASCARA}.txt ;
rm -f MascaraPWC_${MASCARA}.txt ;
rm -f WFPWC_${MASCARA}.txt ;
rm -f ${MASCARA}.log ;
rm -f Arq_${MASCARA}*.bad ;

cd /diretorio1/PROCESSADOS ;
rm -f `ls -t Arq_${MASCARA}_??????_??????.txt.tar.Z | tail -n +5` ;


