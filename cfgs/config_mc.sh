#!/bin/bash
# Panito69
# Chorri-mierda MINECRAFT server configurator loader


#CAMBIAME LOKO

pvp="CAMBIAME"                  #PVP ( True | Flase )
server_ip="CAMBIAME"            #IP MAQUINA
server_name="CAMBIAME"          #Nombre
rcon_passwd="CAMBIAME"          #RCON password
player_num="CAMBIAME"           #Max Players




#NO ME CAMBIES A PARTIR DE AQUI SI NO ERES DIGNO DE ELLO
if [[ $# == 0 ]] || [[ $1 == 'help' ]] || [[ $1 == 'h' ]]; then
  printf '####################################
  #####MLP GAME SERVER COFIGURER######
  ####################################\n'
  echo ''
  echo 'USAGE: EDIT THIS FILE AND SET THE VARS THEN RUN>> $0 apply'
elif [[ $1 -eq 'apply' ]]; then
  if [[ $(whoami) == 'mlp' ]]; then
    printf '########################
    #####Loading CFGS#######
    ########################\n'

    printf "#Minecraft server properties (MLP 2018)
allow-flight=false
allow-nether=true
announce-player-achievements=true
difficulty=1
enable-command-block=false
enable-query=true
enable-rcon=false
force-gamemode=false
gamemode=0
generate-structures=true
generator-settings=
hardcore=false
level-name=world
level-seed=
level-type=DEFAULT
max-build-height=256
max-players=$player_num
max-tick-time=60000
max-world-size=29999984
motd=$server_name
network-compression-threshold=256
online-mode=true
op-permission-level=4
player-idle-timeout=0
pvp=$pvp
rcon.password=$rcon_passwd
rcon.port=25575
resource-pack-sha1=
resource-pack=
server-ip=$server_ip
server-port=25565
snooper-enabled=true
spawn-animals=true
spawn-monsters=true
spawn-npcs=true
use-native-transport=true
view-distance=10
white-list=false" > serverfiles/server.properties



    printf '###########################
    #####Starting server#######
    ###########################\n'
    ./mcserver st
  elif [[ $(whoami) == 'root' ]]; then
    echo 'DO NOT RUN THIS SCRIPT AS ROOT'
    exit 1
  else
    echo 'You are $(whoami), you should be user mlp'
    echo 'Have the preinstall script been run?'
    exit 1
  fi
fi
