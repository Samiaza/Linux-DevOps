#!/bin/bash

START=`date +%s.%N`
STARTH="Script started: `date +"%d %b %Y %T"`"

NUMDIR=99
DIRNAMESYMS=$1
DIRNAMELIST=`./get_list_from_str.sh $DIRNAMESYMS`
FILENAMESYMS=`echo $2 | awk -F"." '{print $1}'`
FILENAMELIST=`./get_list_from_str.sh $FILENAMESYMS`
FILEEXT=`echo $2 | awk -F"." '{print $2}'`
FILESIZE=$3
RANGE=100
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

while [ $ENDFLAG -eq 0 ]; do
  DESTDIR=`./get_random_dir.sh`
  for (( j=1; j <= $NUMDIR && $ENDFLAG == 0; j++ )); do
    if [ $j -ne 1 ]; then DIRNAMELIST=`./insert_sym_to_list.sh $DIRNAMELIST`; fi
    DTEMPLATE=`./get_str_from_list.sh $DIRNAMELIST` 
    DIRNAME=`echo $DESTDIR$DTEMPLATE$NAMESUFF\/`
    echo $DIRNAME created
    mkdir $DIRNAME
    echo $DIRNAME $DATE >> $LOGFILE
    let "NUMFILES=$RANDOM % $RANGE"
    for (( i=1; i <= $NUMFILES && $ENDFLAG == 0; i++ )); do
      if [ $i -ne 1 ]; then FILENAMELIST=`./insert_sym_to_list.sh $FILENAMELIST`; fi
      FTEMPLATE=`./get_str_from_list.sh $FILENAMELIST` 
      FILENAME=`echo $DIRNAME$FTEMPLATE$NAMESUFF.$FILEEXT`
      echo $FILENAME ${FILESIZE}Mb created
      xfs_mkfile ${FILESIZE}M $FILENAME
      echo $FILENAME $DATE ${FILESIZE}Mb >> $LOGFILE
      if [ `./check_enough_space.sh` -ne 1 ]; then
      echo remained 1G or less!
      ENDFLAG=1
      fi
    done
    FILENAMELIST=$BASEFILENAMELIST
  done
  DIRNAMELIST=$BASEDIRNAMELIST
done

END=`date +%s.%N`
ENDH="Script ended: `date +"%d %b %Y %T"`"
RUNTIME=$(echo "scale=3; ($END - $START) / 1" | bc)
RUNTIMEH="Script execution time (in seconds) = $RUNTIME"

echo -e "$STARTH\n$ENDH\n$RUNTIMEH"
echo -e "$STARTH\n$ENDH\n$RUNTIMEH" >> $LOGFILE