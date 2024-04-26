#!/bin/bash

#Colors vars
green_color="\033[1;32m"
green_color_title="\033[0;32m"
red_color="\033[1;31m"
red_color_slim="\033[0;031m"
blue_color="\033[1;34m"
cyan_color="\033[1;36m"
brown_color="\033[0;33m"
yellow_color="\033[1;33m"
pink_color="\033[1;35m"
white_color="\e[1;97m"
normal_color="\e[1;0m"
reset_color="\033[0m"

disk1="/home/gumi/Music"
disk2="/media/gumi/3472B945063ED819/Music_kano_Size_183_525_34"
disk3="/media/gumi/66EC27DFEC27A7EF/Users/Administrator/Music/Music_kano_Size_33_4"

fileproc="DATA_mp3.txt"
filename="x/$fileproc"

#filename="musiktxt/$fileproc"
fileresult="result/jin$fileproc"
filefail="fail/$fileproc"
fail=0
total=0
count=1

echo
echo "$fileproc"
echo


while read p; do
   total=$((total+1))
done < "$filename"


while read p; do
   data=`basename "$p"`
   idisk=1

   echo "[$count/$total] Processing: $data"
   while [ 1 ]; do
      echo -ne ">> disk$idisk"

      if [ $idisk == 1 ]; then
         iter=`find "$disk1" -name "$data"`
      elif [ $idisk == 2 ]; then
         iter=`find "$disk2" -name "$data"`
      elif [ $idisk == 3 ]; then
         iter=`find "$disk3" -name "$data"`
      else
         fail=$((fail+1))
         echo
         echo "$p" >> $filefail
         break
      fi

      if [ "$iter" == "" ]; then
         echo -ne "${red_color} NOT FOUND ${normal_color}"
         echo
         idisk=$((idisk+1))
      else
         echo -ne "${yellow_color} FOUND ===>${normal_color}"
         echo
         echo
         echo "$iter" >> $fileresult
         break
      fi
   done

   count=$((count+1))
done < "$filename"

echo
echo "[*] NOT FOUND: $fail/$total"
