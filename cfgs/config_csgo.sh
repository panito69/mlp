#!/bin/bash
# Panito69
# Chorri-mierda csgo server configurator loader


#CAMBIAME LOKO
server_name="CAMBIAME"           #Compititivo (Numero)  o   Death Match
server_type="5vs5"           #OPCIONES: 5vs5 dm
player_num="11"               #Max Players 11 en competitivo  20 en dm
gsltoken="CAMBIAME"              #Token gsl


#NO ME CAMBIES A PARTIR DE AQUI SI NO ERES DIGNO DE ELLO
if [[ $# == 0 ]] || [[ $1 == 'help' ]] || [[ $1 == 'h' ]]; then
  printf '####################################
  #####MLP GAME SERVER COFIGURER######
  ####################################\n'
  echo ''
  echo 'USAGE: EDIT THIS FILE AND SET THE VARS THEN RUN>> $0 apply'
 
  
elif [[ $1 == 'apply' ]]; then
  if [[ $(whoami) == 'mlp' ]]; then
    printf '########################
    #####Loading CFGS#######
    ########################\n'
    printf "\ndefaultmap=\"de_dust2\"\nmaxplayers=\"$player_num\"\ntickrate=\"128\"\ngslt=\"$gsltoken\"\n" >> /home/mlp/lgsm/config-lgsm/csgoserver/csgoserver.cfg
    cat /root/mlp/cfgs/csgo_main.cfg >> /home/mlp/serverfiles/csgo/cfg/csgoserver.cfg
    printf "\nhostname \"CSGO MLP SERVER $server_name\"" >> /home/mlp/serverfiles/csgo/cfg/csgoserver.cfg
    cp /root/mlp/cfgs/csgo_$server_type.cfg > /home/mlp/serverfiles/csgo/cfg/

    printf '###########################
    #####Starting server#######
    ###########################\n'
    ./csgoserver st
  elif [[ $(whoami) == 'root' ]]; then
    echo 'DO NOT RUN THIS SCRIPT AS ROOT'
    exit 1
  else
    echo 'You are $(whoami), you should be user mlp'
    echo 'Have the preinstall script been run?'
    exit 1
  fi
fi
