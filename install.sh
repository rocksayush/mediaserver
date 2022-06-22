#!/usr/bin/env bash
#=============================================================
# https://github.com/roshanconnor123/mediaserver
# File Name: install.sh
# Author: roshanconnor
# Description:一Installation of Media Servers
# System Required: Debian/Ubuntu
#=============================================================

COLOR="\033["
NORMAL="${COLOR}0m"
YELLOW="${COLOR}1;33m"
RED="${COLOR}1;31m"
CYAN="${COLOR}1;36m"
BLUE="${COLOR}1;34m"
GREEN="${COLOR}1;32m"
PURPLE="${COLOR}1;35m"

# ★★★Installation of Rclone and Creating a remote★★★
rclone() {
  curl https://rclone.org/install.sh | bash
  apt update && sudo apt install fuse
  sed -i '/#user/s/#//g' /etc/fuse.conf
  mkdir /mnt/media
  rclone config
}
# ★★★Mounting using rclone★★★
mount() {
  echo "Provide your remote name you configured in rclone\n"
  read remote
  rclone mount "$remote": /mnt/media --allow-other --allow-non-empty --vfs-cache-mode writes &
  crontab -l > mycron
  echo "@reboot sudo rclone mount "$remote": /mnt/media --allow-other --allow-non-empty --vfs-cache-mode writes &" >> mycron
  #install new cron file
  crontab mycron
  rm mycron
} 

    rclone
    mount
    #jellyfin	
    ;;	
esac 
  
