#!/bin/bash
contador=1
while [ $contador -le 10 ]
do #{
  echo "$contador"
  contador=`expr $contador + 1`
done #}

contador=1
until test $contador -gt 10
#until [ ! $contador -le 10 ]
do
  echo "$contador"
  contador=`expr $contador + 1`
done
