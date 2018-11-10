#!/bin/bash
# Panito69
# Chorri-mierda MLP Game Server Installer for ubuntu

#SE QUE TE HE PEDIDO QUE ME LANCES COMO ROOT, NECEDSITO INSTALAR LIBRERIAS




#NO ME TOQUES SI NO ERES DIGNO DE ELLO
server_game=$(echo $1 | awk '{print tolower($0)}')

if [[ $# -eq 0 ]] || [[ $1 -eq 'help' ]] || [[ $1 -eq 'h' ]]; then
  printf '####################################
  #####MLP GAME SERVER INSTALLER######
  ####################################\n'
  echo ''
  echo 'USAGE: $0 <GAME>'
  echo 'GAME LIST: CSGO ' #FUTURE: UNREAL MINECRAFT
fi

if [[ $(whoami) != 'root' ]]; then
    echo "Run this as root"
    exit 1
fi

cd

printf '#################################
#####Installing dependences######
#################################\n'
if [[ $server_game -eq 'csgo' ]]; then
  dpkg --add-architecture i386; sudo apt update; sudo apt install -y mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386
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
cp cfgs/config_csgo.sh /home/mlp/
cd /home/mlp/
wget -O linuxgsm.sh https://linuxgsm.sh
chown mlp:mlp * && chmod +x *.sh



printf '
#####Installing $server_game######\n'
su mlp ./linuxgsm.sh ${server_game}server
su mlp ./${server_games}server ai
