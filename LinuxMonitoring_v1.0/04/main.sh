#!/bin/bash

re='[1-6]'
FCDB='color_font_db'
BGCDB='color_bg_db'
CFCFG='colors.cfg'
CFDCFG='colors_default.cfg'
RESET='\033[0m'

BC1_DF=0
FC1_DF=0
BC2_DF=0
FC2_DF=0

BC1=`grep column1_background $CFCFG | awk -F'=' '{print $2}'`
FC1=`grep column1_font_color $CFCFG | awk -F'=' '{print $2}'`
BC2=`grep column2_background $CFCFG | awk -F'=' '{print $2}'`
FC2=`grep column2_font_color $CFCFG | awk -F'=' '{print $2}'`

if [[ $BC1 != $re ]]
then
  BC1_DF=1
  BC1=`grep column1_background $CFDCFG | awk -F'=' '{print $2}'`
fi

if [[ $FC1 != $re ]]
then
  FC1_DF=1
  FC1=`grep column1_font_color $CFDCFG | awk -F'=' '{print $2}'`
fi

if [[ $BC2 != $re ]]
then
  BC2_DF=1
  BC2=`grep column2_background $CFDCFG | awk -F'=' '{print $2}'`
fi

if [[ $FC2 != $re ]]
then
  FC2_DF=1
  FC2=`grep column2_font_color $CFDCFG | awk -F'=' '{print $2}'`
fi

if [ $# -gt 0 ]
then
  echo "Error: too many options"
else
  CC1=`grep ^$BC1 $BGCDB | awk '{print $2}'``grep ^$FC1 $FCDB | awk '{print $2}'`
  CC2=`grep ^$BC2 $BGCDB | awk '{print $2}'``grep ^$FC2 $FCDB | awk '{print $2}'`
  if [ $BC1 = $FC1 ] || [ $BC2 = $FC2 ]
  then
  echo -e "\033[31mWarning: Matching font and background colours are found."
  echo -e "\033[33mMaybe do you want to fix it and restart script?"$RESET
  fi
  ./print_table.sh $CC1 $CC2
  echo ""

  COLORNUM=`./get_colornum.sh $BC1_DF column1_background`
  COLOR=`grep ^$BC1 $BGCDB | awk '{print $3}'`
  echo Column 1 background = $COLORNUM "($COLOR)"

  COLORNUM=`./get_colornum.sh $FC1_DF column1_font_color`
  COLOR=`grep ^$FC1 $BGCDB | awk '{print $3}'`
  echo Column 1 background = $COLORNUM "($COLOR)"

  COLORNUM=`./get_colornum.sh $BC2_DF column2_background`
  COLOR=`grep ^$BC2 $BGCDB | awk '{print $3}'`
  echo Column 1 background = $COLORNUM "($COLOR)"

  COLORNUM=`./get_colornum.sh $FC2_DF column2_font_color`
  COLOR=`grep ^$FC2 $BGCDB | awk '{print $3}'`
  echo Column 1 background = $COLORNUM "($COLOR)"
fi
