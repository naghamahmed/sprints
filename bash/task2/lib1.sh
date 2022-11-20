#! /usr/bin/env bash


USER_ROOT_Privilage()
{
        GROUP=wheel
if id -nG "$USER" | grep -q "$GROUP"; then
    echo "$USER has root privilages"
else
    echo "$USER has not root privilage"
fi
}

CHANGE_SSH_PORT()
{
echo "Enter the new port"
read NEW_PORT


sed -i "s/#Port 22/Port $NEW_PORT/g" /etc/ssh/sshd_config
systemctl reload sshd
echo "The port has been changed to $NEW_PORT"
}


DISPLAY_ROOT_PERMISSION()
{
        sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
        systemctl reload sshd
}


ADD_USER()
{
echo "Enter the user name"
read user_name

useradd $user_name

echo "Do you want to add the user to sudoers or not:[yes or no]"
read yes_or_no
if [ "$yes_or_no" == "yes" ]
then

echo "$user_name  ALL=(ALL)       ALL"  >> visudo
echo "$user_name is sudoer now"

else
        echo "$user_name is not sudoer"
fi
}

BACKUP_HOME_DIRECTORY()
{
mkdir /home/$USER/Backup
SOURCE="/home/$USER/*"
DESTINATION="/home/$USER/Backups"
BACKUP=$"tar -czf $DESTINATION.tar.gz $SOURCE"
echo  "*       *       *       *       * "$BACKUP" "   >  "/home/$USER/RBACKUPS"
crontab "/home/$USER/RBACKUPS"
}
