#!/bin/bash

# 1. Información del usuario actual
whoami
id

# 2. Grupos del usuario actual
groups

# 3 y 4. Crear grupos
sudo groupadd marvel
sudo groupadd dc

# 5-8. Crear usuarios
sudo useradd -m -g marvel spiderman
echo "spiderman:spiderman" | sudo chpasswd

sudo useradd -m -g marvel ironman
echo "ironman:ironman" | sudo chpasswd

sudo useradd -m -g dc superman
echo "superman:superman" | sudo chpasswd

sudo useradd -m -g dc batman
echo "batman:batman" | sudo chpasswd

# 10. Crear estructura
for user in spiderman ironman superman batman; do
    sudo -u $user mkdir -p /home/$user/documentos
    sudo -u $user touch /home/$user/documentos/f1 /home/$user/documentos/f2 /home/$user/documentos/f3
done

# 11-26 Permisos (ejemplos básicos con ACL)
sudo setfacl -m u:superman:rw /home/spiderman/documentos/*
sudo setfacl -m u:ironman:w /home/spiderman/documentos
sudo setfacl -m u:batman:r /home/superman/documentos/*
sudo setfacl -m u:ironman:r /home/batman/documentos/*
sudo chmod u-w /home/spiderman/documentos/*
sudo setfacl -m u:superman:rw /home/ironman/documentos/*
sudo chmod o-x /home/ironman
sudo chmod o-x /home/superman
sudo chmod o-r /home/ironman/documentos/*
sudo chmod o-x /home/batman
sudo chmod o-x /home/superman
sudo chmod o+x /home/batman/documentos/*
sudo chmod u-x /home/superman/documentos/*
sudo chmod u-w /home/spiderman/documentos/*
sudo setfacl -m u:batman:rw /home/spiderman/documentos/*
sudo setfacl -x u:batman /home/ironman/documentos/*
sudo setfacl -m u:$(whoami):rw /home/ironman/documentos/*
sudo chmod o-x /home/superman
sudo setfacl -m u:$(whoami):x /home/batman/documentos/*
sudo chmod o-x /home/ironman

# 27-28 Cambiar contraseñas
echo "spiderman:marvel" | sudo chpasswd
echo "ironman:marvel" | sudo chpasswd
echo "batman:dc" | sudo chpasswd
echo "superman:dc" | sudo chpasswd

# 31-32 Grupo superheroes
sudo groupadd superheroes
sudo usermod -aG superheroes spiderman
sudo usermod -aG superheroes ironman
sudo usermod -aG superheroes batman
sudo usermod -aG superheroes superman

# 33-35 Eliminar usuarios y grupo
sudo userdel -r spiderman
sudo groupdel marvel
sudo userdel -r ironman

# 36 Cambiar grupo principal
sudo usermod -g superheroes superman

# 37 Renombrar usuario
sudo usermod -l flash batman

# 38 Eliminar grupo dc
sudo groupdel dc

# 39 Usuario thor sin home
sudo useradd thor

# 40 Ver grupos
groups thor

# 41 Cambiar nombre grupo
sudo groupmod -n trueno thor

# 42 Crear directorio
sudo mkdir /home/trueno

# 43 Asignar home
sudo usermod -d /home/trueno thor
