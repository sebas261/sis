#!/bin/bash
echo -n "Dime tu nombre: "
read nombre
if test -n "$nombre"
then
  echo "Hola $nombre"
else
  echo "Hola desconocido"
fi
