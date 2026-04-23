#!/bin/bash

############################
# COMANDOS CON AT
############################

# a
echo "find /home/smr1 -type d -amin -120" | at now + 30 minutes

# b
echo "find /home/smr1 -type f -amin +120" | at 4am Jul 15

# c
echo "cat /etc/passwd > /home/smr1/Documentos/7planificacion/listausu" | at 7pm May 3

# d
echo "find /home/smr1 -type f -amin -900" | at 17:35 today

# e
echo "find /home/smr1 -type f -atime -1 -user smr1" | at 12:00

# f
echo "find / -name gcalctool > /home/smr1/Documentos/7planificacion/fichcalc" | at 5am Fri

############################
# SEGUNDA PARTE AT
############################

# a
echo "find /home/smr1 -type d -amin -120 > /home/smr1/Documentos/7planificacion/dirsmr12" | at now + 30 minutes

# b
echo "find /home/smr1 -type f -amin +120 > /home/smr1/Documentos/7planificacion/fichsmr12" | at 4am Jul 18

# c
echo "cat /etc/passwd > /home/smr1/Documentos/7planificacion/listausu" | at now + 3 days

# d
echo "find /home/smr1 -type f -amin -900 > /home/smr1/Documentos/7planificacion/fichsmr115" | at 17:35 today

# e
echo "find /home/smr1 -type f -atime -1 -user smr1 > /home/smr1/Documentos/7planificacion/fichsmr1usu" | at 5am Fri

# f
echo "find / -name gnome-calculator > /home/smr1/Documentos/7planificacion/fichcalc" | at 4pm + 2 days

# g
echo "kill -9 1234 > /home/smr1/Documentos/7planificacion/fichkill" | at 00:00 Dec 21 2012

# h
atq

# i (ejemplo con job 1)
at -c 1

# j (ejemplo borrar job 1)
atrm 1


############################
# CRONTAB
############################

# Crear fichero periodicidad1
cat <<EOF > periodicidad1
49 7 15 * 2 ping 127.0.0.1 > ping.txt
15 22 28 2 * reboot
20 15 * * 1,2,4,6,7 touch manolito.txt
EOF

# Añadir a crontab
crontab periodicidad1

# Mostrar tareas
crontab -l

# Copia cada 20 min fin de semana
(crontab -l 2>/dev/null; echo "*/20 * * * 6,0 cp -r /home/smr1/Documentos /home/smr1/backup") | crontab -

# Borrar fichero viernes 20:00
(crontab -l 2>/dev/null; echo "0 20 * * 5 rm /home/smr1/temp.old") | crontab -

# Procesos en julio y agosto cada hora días laborables
(crontab -l 2>/dev/null; echo "0 * * 7,8 1-5 ps aux > /home/smr1/procesos.info") | crontab -
