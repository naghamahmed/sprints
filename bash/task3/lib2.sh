#! /usr/bin/env bash


root_privilages()
{
        if [ "$EUID" -eq 0 ] || grep -q "$USER"  "/etc/sudoers"
        then
                echo "$USER has root privilges"
        else
                echo "$USER has not root privilges"
        fi
}

change_port()
{

sed -i "s/#Port 22/Port $1/g" /etc/ssh/sshd_config
echo "ssh Port Changed to $1"
}


DISPLAY_ROOT_PERMISSION()
{
        sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
        systemctl reload sshd
}


UPDATE_FIREWALL_SELINUX()
{
        semanage port -a -t ssh_port_t -p tcp $1
        echo "SELINUX is updated to port $1"
        firewall-cmd --zone=public --add-port=$1/tcp --permanent
        sudo systemctl reload firewalld.service
        echo "firewall is updated to port $1"
}

ADD_GROUP()
{
        groupadd Audit -g 20000
        echo " Audit group is sucssfuly added"
}
ADD_SPECIFIC_USER()
{

        password=$(openssl passwd -1 -stdin <<< $2)
        useradd $1 -p $password -g Audit
        echo "$1 user is sucessfuly added"
}


CREATE_REPORTS()
{
        mkdir -p /home/$USER/reports
        touch /home/$USER/reports/2021-{1..12}-{1..31}.xls
        chmod 660 /home/$USER/reports/*
}


UPDATE_SYSTEM()
{
        yum -y update
        echo "The system is updated suceccfuly"
}

EPEL_REPO()
{
        sudo yum -y install epel-release
        echo "Epel repo is enabled!"
}

}
fail2ban()
{
       	yum -y install "fail2ban"
	systemctl enable "fail2ban" 
       	systemctl start "fail2ban"	
}

BACKUP_REPORTS()
{
        mkdir -p  /home/$USER/backups
        echo " 0        1       *       *       1-4 "tar -czf /home/$USER/backuos/$(date +%u)-$(date +%w).tar.gz "/home/$USER/reports" " " > "/home/$USER/RBACKUP.txt"
        crontab "/home/$USER/RBACKUP.txt"
}
MANAGER_ADD()
{
        useradd manager -u 30000
}

SYNC_REPORTS()
{
        mkdir -p /home/manager/audit/reports
        echo " 0        2       *       *       1-4 " sync /home/manager/audit/reports  /home/$USER/reports" " > "/home/$USER/sync.txt"
        crontab "/home/$USER/sync.txt"
}
