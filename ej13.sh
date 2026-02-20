#!/bin/bash
echo "Tiramos 3 dados: "
rango=6
inicial=1
dado1=`expr $RANDOM % $rango + $inicial`
dado2=`expr $RANDOM % $rango + $inicial`
dado3=`expr $RANDOM % $rango + $inicial`
echo "$dado1 ; $dado2 ; $dado3"
