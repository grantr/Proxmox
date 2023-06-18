#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/grantr/Proxmox/test-source/misc/build.func)
# Copyright (c) 2021-2023 tteck
# Author: tteck (tteckster)
# License: MIT
# https://github.com/tteck/Proxmox/raw/main/LICENSE

function header_info {
clear
cat <<"EOF"
 _    _ _                       _       ______                   _            
| |  | (_)      _              (_)     |  ___ \       _         (_)           
| |  | |_  ____| |_  ___   ____ _  ____| | _ | | ____| |_   ____ _  ____  ___ 
 \ \/ /| |/ ___)  _)/ _ \ / ___) |/ _  | || || |/ _  )  _) / ___) |/ ___)/___)
  \  / | ( (___| |_| |_| | |   | ( ( | | || || ( (/ /| |__| |   | ( (___|___ |
   \/  |_|\____)\___)___/|_|   |_|\_||_|_||_||_|\____)\___)_|   |_|\____|___/ 
                                                                              
EOF
}
header_info
echo -e "Loading..."
APP="VictoriaMetrics"
var_disk="8"
var_cpu="2"
var_ram="1024"
var_os="debian"
var_version="12"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="1"
  PW=""
  CT_ID=$NEXTID
  HN=$NSAPP
  DISK_SIZE="$var_disk"
  CORE_COUNT="$var_cpu"
  RAM_SIZE="$var_ram"
  BRG="vmbr0"
  NET="dhcp"
  GATE=""
  DISABLEIP6="no"
  MTU=""
  SD=""
  NS=""
  MAC=""
  VLAN=""
  SSH="no"
  VERB="no"
  echo_default
}

function update_script() {
header_info
msg_info "Updating ${APP}"
apt-get update &>/dev/null
apt-get -y upgrade &>/dev/null
msg_ok "Updated Successfully"
exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
