#! /usr/bin/env bash


source ./lib2.sh

#Printig_show_menu

while true
do
GROUP=wheel
      if id -nG "$USER" | grep -q "$GROUP" || [ "$EUID" -eq 0 ]
      then
      show_menu $1 $2 $3
         read s
         case $s in
              1) change_port $1;;
              2) DISPLAY_ROOT_PERMISSION;;
              3) UPDATE_FIREWALL_SELINUX;;
              4) ADD_GROUP;;
              5) ADD_SPECIFIC_USER $2 $3;;
              6) CREATE_REPORTS;;
              7) UPDATE_SYSTEM;;
              8) EPEL_REPO;;
              9) fail2ban;;
              10) BACKUP_REPORTS;;
              11) MANAGER_ADD;;
              12) SYNC_REPORTS;;
              
              [^q]) echo "invalid input PLease choose Correct option (q to quit)";;
              q) exit
         esac
      else
      echo "Only root or sudoers can run the script"
      exit 1
      fi
done     
              
