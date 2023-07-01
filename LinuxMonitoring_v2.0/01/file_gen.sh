#!/bin/bash

DESTDIR=$1
NUMDIR=$2
DIRNAMESYMS=$3
DIRNAMELIST=`./get_list_from_str.sh $DIRNAMESYMS`
NUMFILES=$4
FILENAMESYMS=`echo $5 | awk -F"." '{print $1}'`
FILENAMELIST=`./get_list_from_str.sh $FILENAMESYMS`
FILEEXT=`echo $5 | awk -F"." '{print $2}'`
FILESIZE=$6
LOGFILE=create.log

BASEDIRNAMELIST=`./first_list_setup.sh $DIRNAMELIST`
DIRNAMELIST=$BASEDIRNAMELIST
BASEFILENAMELIST=`./first_list_setup.sh $FILENAMELIST`
FILENAMELIST=$BASEFILENAMELIST

ENDFLAG=0
if [ `./check_enough_space.sh` -ne 1 ]; then
echo remained 1G or less!
ENDFLAG=1
fi

rm -rf $LOGFILE

NAMESUFF=`date +"_%d%m%y"`
DATE=`date +"%d.%m.%y"`

for (( j=1; j <= $NUMDIR && $ENDFLAG == 0; j++ )); do
  if [ $j -ne 1 ]; then DIRNAMELIST=`./insert_sym_to_list.sh $DIRNAMELIST`; fi
  DTEMPLATE=`./get_str_from_list.sh $DIRNAMELIST` 
  DIRNAME=`echo $DESTDIR$DTEMPLATE$NAMESUFF\/`
  echo $DIRNAME created
  mkdir $DIRNAME
  echo $DIRNAME $DATE >> $LOGFILE
  for (( i=1; i <= $NUMFILES && $ENDFLAG == 0; i++ )); do
    if [ $i -ne 1 ]; then FILENAMELIST=`./insert_sym_to_list.sh $FILENAMELIST`; fi
    FTEMPLATE=`./get_str_from_list.sh $FILENAMELIST` 
    FILENAME=`echo $DIRNAME$FTEMPLATE$NAMESUFF.$FILEEXT`
    echo $FILENAME ${FILESIZE}Kb created
    xfs_mkfile ${FILESIZE}K $FILENAME
    echo $FILENAME $DATE ${FILESIZE}Kb >> $LOGFILE
    if [ `./check_enough_space.sh` -ne 1 ]; then
    echo remained 1G or less!
    ENDFLAG=1
    fi
  done
  FILENAMELIST=$BASEFILENAMELIST
done
