#!/bin/bash

clear
echo "Olá, esse é seu manual de instalação."
sleep 2
echo "!! ATENÇÃO !! ao aceitar continuar permitira que arquivos sejam instalados em sua maquina..."
sleep 2
echo "Gostaria de continuar? S\n"
read inst
if [ \"$inst\" == \"s\" ]
sleep 1
clear
sleep 1
echo "Otimo!!! Fique atento,ao longo do processo perguntas serão feitas"
sleep 4
echo "Caixas de escolhas com fundos roxos apareceram..."
sleep 3
echo "Marque todas opções com a tecla [SPACE] e confirme com [ENTER]..."
sleep 3

echo "Verificando usuario"
then
getent passwd savercliente
if [ $? -eq 0 ]
then echo "Usuário Existente"
sleep 5
else echo "Criando um Usuario"
sudo adduser savercliente
sudo usermod -aG sudo savercliente
sleep 2
echo "Usuario criado"
sleep 5
cd
clear
sleep 1
fi

#Atualizando pacotes
echo "Instalando interface..."
sleep 2
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
sudo apt install rdesktop
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sleep 2
clear
sleep 1
echo "Atualizando pacotes..."
sleep 2
sudo apt update && sudo apt upgrade
sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
clear
sleep 1
fi

#Java
echo "Verificando versão do java..."
sleep 3
java --version
if [ $? -eq 0 ];
then echo “Sua maquina ja possui uma versão java”
sleep 5
clear
else echo “java nao instalado”
sleep 2
sudo apt install default-jre -y
sleep 2
echo "Java instalado"
java --version
cd
sleep 2
clear
fi
echo "Intalando nosso serviço de manutenção"
sleep 3
git clone https://github.com/Saver-Monitoring/AplicacaoSaver.git 
cd ~/AplicacaoSaver/banco-saver/target
fi