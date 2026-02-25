#!/bin/bash
echo "He pensado un nº del 1 al 100"
aleatorio=`expr $RANDOM % 100 + 1`
numero=0
intentos=1
while [ $numero -ne $aleatorio -a $intentos -le 6 ]
do
  echo "Intento nº $intentos"
  echo -n "Cual es el numero? "
  read numero
  intentos=`expr $intentos + 1`
  if [ $numero -lt $aleatorio ]
  then
    echo "No has acertado, el que he pensado es mayor"
  elif [ $numero -gt $aleatorio ]
  then
    echo "No has acertado, el que he pensado es menor"
  else
    break
  fi
done
if [ $numero -eq $aleatorio ]
then
  echo "Si, era ese, enhorabuena!"
else
  echo "Lo siento, has superado el numero de intentos"
  echo "El numero era $aleatorio"
fi
