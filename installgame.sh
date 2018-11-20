#!/bin/bash
# Panito69
# Chorri-mierda MLP Game Server Installer for ubuntu

#SE QUE TE HE PEDIDO QUE ME LANCES COMO ROOT, NECEDSITO INSTALAR LIBRERIAS




#NO ME TOQUES SI NO ERES DIGNO DE ELLO
server_game=$(echo $1 | awk '{print tolower($0)}')

if [[ $server_game == 'minecraft' ]]; then
  server_game='mc'
fi

if [[ $# == 0 ]] || [[ $1 == 'help' ]] || [[ $1 == 'h' ]]; then
  printf '####################################
  #####MLP GAME SERVER INSTALLER######
  ####################################\n'
  echo ''
  echo 'USAGE: $0 <GAME>'
  echo 'GAME LIST: CSGO MC ' #FUTURE: UNREAL MINECRAFT
  exit 1
fi

if [[ $(whoami) != 'root' ]]; then
    echo "Run this as root"
    exit 1
fi
 echo "Habbim mola mucho"
cd

printf '#################################
#####Installing dependences######
#################################\n'
if [[ $server_game == 'csgo' ]]; then
  dpkg --add-architecture i386; sudo apt update; sudo apt install -y mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386
elif [[ $server_game == 'mc' ]]; then
  sudo dpkg --add-architecture i386; sudo apt update; sudo apt install -y mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux default-jre
fi


printf '############################
#####Creating user MLP######
############################\n'
adduser --disabled-password --disabled-login --gecos "" mlp

printf '################################
#####Downloading installer######
################################\n'
chmod a+x /root
chmod -R a+rx /root/mlp/cfgs
cp /root/mlp/cfgs/config_${server_game}.sh /home/mlp/
cd /home/mlp/
wget -O linuxgsm.sh https://linuxgsm.sh
chown mlp:mlp * && chmod +x *.sh



printf '
#####Installing $server_game######\n'
su mlp ./linuxgsm.sh ${server_game}
su mlp ./${server_game}server ai
