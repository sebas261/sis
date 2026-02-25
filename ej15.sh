#!/bin/bash
echo "He pensado un nº del 1 al 10"
aleatorio=`expr $RANDOM % 10 + 1`
numero=0
while [ $numero -ne $aleatorio ]
do
  echo -n "Cual es? "
  read numero
done
echo "Si, era ese, enhorabuena!"
