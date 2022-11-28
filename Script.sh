#!/bin/bash

echo "Olá, esse é seu manual de instalação."
sleep 2
echo "!! ATENÇÃO !! ao aceitar continuar permitira que arquivos sejam instalados em sua maquina..."
sleep 2
echo "continuar? S\n"
read inst
if [ \"$inst\" == \"s\" ]
echo "Otimo!!!"
sleep 3
echo "Verificando usuario"
then
getent passwd savercliente
if [ $? -eq 0 ]
then echo "Usuário Existente"
else echo "Criando um Usuario"
sudo adduser savercliente
sudo usermod -aG sudo savercliente
cd
fi

#Java
echo "Verificando versão do java"
java -version
if [ $? -eq 0 ];
then
echo “Sua maquina ja possui uma versão java”
sleep 2

else
echo “java nao instalado”
sleep 2
echo “gostaria de instalar o java?” 
(s/n)
read inst
if [ \”$inst\” == \”s\” ];
then
sudo apt install default-jre -y
sleep 2
echo "Java instalado"
java --version
sleep 4
clear
fi

#Atualizando pacotes
echo "Instalando interface..."
sleep 2
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
sudo apt install rdesktop
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sleep 2
clear
echo "Atualizando pacotes..."
sleep 2
sudo apt update && sudo apt upgrade
sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
clear
fi