#!/bin/bash
echo "dime el nombre de un equipo"
read eq1
echo "dime el nombre de otro equipo"
read eq2
echo "$eq1 VS $eq2"
turnos=1
aleatorio=$(expr $RANDOM % 4)
#if [$aleatorio -eq 1]
#then
#	canasta=2
#else
#	canasta=$aleatorio
#fi
while [ $turnos -le 24 ] 
do
	echo "$turnos"
	sleep 1
	num=`expr $turnos % 2`
	if [ $num -eq 0 ] 
	then
		case $aleatorio in
			0) canasta="0 puntos"
				puntos1=`expr $puntos1+0`;;
			1 | 2) canasta="2 puntos"
					puntos1=`expr $puntos1+2`;;
			3) canasta="3 puntos"
				puntos1=`expr $puntos1+3`;;
		esac
		echo "equipo $eq1 $canasta"

	else
		
		case $aleatorio in
			0) canasta="0 puntos"
				puntos2=`expr $puntos1+0`;;
			1 | 2) canasta="2 puntos"
					puntos2=`expr $puntos1+2`;;
			3) canasta="3 puntos"
				puntos2=`expr $puntos1+3`;;
		esac
		echo "equipo $eq2 $canasta"
	fi
	turnos=`expr $turnos+1`
done
sleep 1
echo "puntuacion: $eq1 $puntos1 : $eq2 $puntos2"
