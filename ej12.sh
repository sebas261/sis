#!/bin/bash
echo -n "Dime una ruta de un fichero o directorio: "
read ruta
if test -e "$ruta"
then
  if test -f "$ruta"
  then
    echo "Existe y es fichero"
  elif test -d "$ruta"
  then
    echo "Existe y es directorio"
  fi
else
  echo "No existe"
fi
