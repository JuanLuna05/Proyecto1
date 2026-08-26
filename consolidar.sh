#!/bin/bash

shopt -s nullglob

cd ~/EPNro1/entrada

while true
do
   for archivo in *.txt
   do
	cat "$archivo" >> ~/EPNro1/salida/"$FILENAME".txt


	FECHA=`date +"%d/%m/%Y %H:%M:%S"`

	echo "$FECHA - Procesado archivo $archivo" >> ~/EPNro1/procesado.log

	mv "$archivo" ~/EPNro1/procesado/
   done

   sleep 5

done
