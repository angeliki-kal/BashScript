#!/bin/bash

diseasesFile=$1
countriesFile=$2
input_dir=$3
numFilesPerDirectory=$4
numRecordsPerFile=$5

#checks if all arguments are given. If not, exit.
if [ "$#" -ne 5 ]; then
  echo "No valid number of arguments supplied"
  exit 1
fi

#checks if numFilesPerDirectory is valid. If not, exit.
[ -n "$4" ] && [ "$4" -eq "$4" ] && [ "$4" -gt 0 ] >&2
if [ $? -ne 0 ]; then
  echo "numFilesPerDirectory input is either not a number or <0"
  exit 1
fi

#checks if numRecordsPerFile is valid. If not, exit.
[ -n "$5" ] && [ "$5" -eq "$5 " ] && [ "$5" -gt 0 ] >&2
if [ $? -ne 0 ]; then
  echo "numRecordsPerFile input is either not a number or <0"
  exit 1
fi

mkdir "$input_dir"
while read -r line; do
  mkdir "$input_dir"/"$line"
  for (( i = 1; i <= "$numFilesPerDirectory"; i++ )); do
    #random number for days, months, years
    for (( y = 1; y <= 3; y++ )); do
      floor=1
      if [ "$y" = 1 ]; then
        max=30
      elif [ "$y" = 2 ]; then
        max=12
      else
        floor=1990
        max=2020
      fi            
      pick=0
      while [ "$pick" -le $floor ]; do
        pick=$RANDOM
        (("pick %= $max")) || true
      done
      if [ "$y" = 1 ]; then
        days=$pick
      elif [ "$y" = 2 ]; then
        months=$pick
      else
        years=$pick
      fi  
    done

    #create file
    filename="$days-$months-$years"
    touch "$input_dir"/"$line"/$filename

    for ((m = 1; m <= "$numRecordsPerFile"; m++)); do
      #id
      idmax=999
      id=0
      while [ "$id" -le 0 ]; do
        id=$RANDOM
        (( "id %= $idmax" )) || true
      done
      echo "ID: $id"

      #binary random for ENTER or EXIT
      num=$RANDOM
      (( "num %= 2" )) || true
      if [ "$num" -eq 1 ]; then
        hospital="ENTER"
        echo "$hospital the hospital"
      else
        hospital="EXIT the hospital"
      fi

      #age
      max=120
      age=0
      while [ "$age" -le 1 ]; do
        age=$RANDOM
        (( "age %= $max" )) || true
      done
      echo "AGE: $age"

      #random disease from diseaseFile
      disease=$(shuf "$diseasesFile" -n 1)
      echo "DISEASE: $disease"

      #random name
      name=$(cat /dev/urandom | tr -dc 'A-Za-z' | fold -w 12 | head -n 1)
      echo "NAME: $name"

      #random lastname
      lastname=$(cat /dev/urandom | tr -dc 'A-Za-z' | fold -w 12 | head -n 1)
      echo "LASTNAME: $lastname"

      #write in file
      echo "$id $hospital $name $lastname $disease $age" >>"$input_dir"/"$line"/$filename
    done
  done
done <"$countriesFile"
