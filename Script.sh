#!/bin/bash
getent passwd ClienteUsuario
if [$? -eq 0 ]
then
echo \"Usuário Existente\"
else echo \"Usuario não existe\"
sudo adduser ClienteUsuario
sudo usermod -a -G sudo ClienteUsuario
sudo su ClienteUsuario
cd
fi
sudo apt update && sudo apt upgrade
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
sudo apt install rdesktop
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
java -version
if [ $? -eq 0 ];
then
echo “java instalado”
else
echo “java nao instalado”
echo “gostaria de instalar o java?” 
(s/n)
read inst
if [ \”$inst\” == \”s\” ];
then
sudo apt install default-jre -y
fi
fi
cd Desktop
git clone https://github.com/Saver-Monitoring/AplicacaoSaver.git
cd AplicacaoSaver/banco-saver/target/
java -jar banco-saver-1.0-SNAPSHOT-jar-with-dependencies.jar
