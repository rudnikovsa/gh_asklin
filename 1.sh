#!/bin/bash

rm 1.log

filename=ip.txt

declare -a myArray
myArray=(`cat "$filename" | tr ',' '\n'`)

for (( i = 0 ; i < ${#myArray[*]} ; i++))
do
  echo "IP: " ${myArray[$i]} >> 1.log
  ssh -o ConnectTimeout=1 root@${myArray[$i]} "echo -n 'Hostname: '; hostname; echo -n 'Linux version: '; uname -a; echo 'Java version: '; java --version; echo 'Разметка диска: '; df -h" >> 1.log
done