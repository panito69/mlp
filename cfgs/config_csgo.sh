#!/bin/bash
# Panito69
# Chorri-mierda csgo server configurator loader


#CAMBIAME LOKO
server_name="CAMBIAME"          #Nombre
server_type="CAMBIAME"          #OPCIONES: 5vs5 ffa
rcon_passwd="CAMBIAME"          #RCON password
player_num="CAMBIAME"           #Max Players
gsltoken="CAMBIAME"             #Token gsl
telegram_bot_token="CAMBIAME"   #Token bot telegram
telegran_chat_id="CAMBIAME"     #Id chat telegram




#NO ME CAMBIES A PARTIR DE AQUI SI NO ERES DIGNO DE ELLO
if [[ $# == 0 ]] || [[ $1 == 'help' ]] || [[ $1 == 'h' ]]; then
  printf '####################################
  #####MLP GAME SERVER COFIGURER######
  ####################################\n'
  echo ''
  echo 'USAGE: EDIT THIS FILE AND SET THE VARS THEN RUN>> $0 apply'
elif [[ $1 == 'apply' ]]; then
  if [[ $(whoami) == 'mlp' ]; then
    printf '########################
    #####Loading CFGS#######
    ########################\n'
    printf "\nmaxplayers=\"$player_num\"\ntickrate=\"128\"\ngslt=\"$gsltoken\"\ntelegramalert=\"on\"\ntelegramtoken=\"$telegram_bot_token\"\ntelegramchatid=\"$telegram_chat_id\"\n" >> /home/mlp/lgsm/config-lgsm/csgoserver/csgoserver.cfg
    printf "\nhostname \"$server_name\"\nrcon_password \"$rcon_passwd\"\n" >> /home/mlp/serverfiles/csgo/cfg/csgoserver.cfg
    cp /root/mlp/cfgs/csgo_$server_type.cfg /home/mlp/serverfiles/csgo/cfg/ALGO.cfg

    printf '###########################
    #####Starting server#######
    ###########################\n'
    ./csgoserver st
  elif [[ $(whoami) == 'root']]; then
    echo 'DO NOT RUN THIS SCRIPT AS ROOT'
    exit 1
  else
    echo 'You are $(whoami), you should be user mlp'
    echo 'Have the preinstall script been run?'
    exit 1
  fi
fi
