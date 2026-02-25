#!/bin/bash
echo -n "Dime un numero: "
read num
num=`expr $num \* 2`

num=(expr $num + 1)
let "num++"
num=$((num**2))
