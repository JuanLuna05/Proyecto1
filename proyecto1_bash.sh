#!/bin/bash

export FILENAME="alumnos"

if [ "$1" = "-d" ]
then
    PID=`ps -ef | grep consolidar.sh | grep -v grep | awk '{print $2}'`

    if [ "$PID" != "" ]
    then
	kill $PID
    fi

    rm -r -f ~/EPNro1

    echo "Eliminado y procesos finalizados"
    exit
fi

echo -e "MENU\nQue Queres Hacer?"
echo "1) Crear Entorno"
echo "2) Correr Proceso"
echo "3) Mostrar Alumnos Ordenados por Padron"
echo "4) Mostrar las 10 Notas mas Altas"
echo "5) Buscar Alumno por Padron"
echo "6) Visualizar log"
echo "7) Salir"

echo "Ingrese una opcion del 1 al 7:"
read opcion

while [ $opcion -lt 1 ] || [ $opcion -gt 7 ]
do
	echo "Opcion invalida. Ingrese una opcion del 1 al 7:"
	read opcion
done

case $opcion in

	1)
	   mkdir -p ~/EPNro1/entrada
	   mkdir -p ~/EPNro1/salida
	   mkdir -p ~/EPNro1/procesado

       	   cp ~/consolidar.sh ~/EPNro1/consolidar.sh

	  echo "Entorno Creado Correctamente"
	  ;;

	2)
	   touch ~/EPNro1/procesado.log

	   if pgrep -f  consolidar.sh
	   then
		echo "El proceso consolidar.sh ya esta ejecutandose"
	   else
		 bash ~/EPNro1/consolidar.sh &
		 echo "Proceso iniciado en background"
	   fi
	   ;;

	4)
	   if [ -f ~/EPNro1/salida/$FILENAME.txt ]
	   then
		sort -n -r -k5 ~/EPNro1/salida/$FILENAME.txt | head
	   else
		echo "No existe" $FILENAME
	   fi
	   ;;

	6)

	   if [ -f ~/EPNro1/procesado.log ]
	   then
		 cat ~/EPNro1/procesado.log
	    else
		 echo "El archivo de log no existe"
	   fi
	   ;;

esac

