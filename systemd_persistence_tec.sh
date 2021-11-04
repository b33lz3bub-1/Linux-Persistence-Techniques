#!/bin/bash

if [ $1 -z ]
        then
                echo "NOTE file should be in home directory"
                echo "./rc_local_persistence.sh  <filename> "
                exit 1
fi

HOME= $HOME

echo "[+] Creating service file for c.local.service ..."

echo "[+] Checking for .local.service in systemd..."
echo "[+] Creating .local.service file."
sudo touch /etc/systemd/system/$1.service 
printf "[Unit]\n Description=$1 Compatibility\n\n[Service]\n ExecStart=$HOME/$1\n TimeoutSec=0\n RemainAfterExit=yes\n Restart=always\n\n[Install]\n WantedBy=multi.user.target\n" | sudo tee /etc/systemd/system/c.sh.service

echo "[+] Enabling the service in systemctl..."
sudo systemctl enable $1.service
sleep 0.2

echo "[+] Running the service..."
sudo systemctl start $1

sudo systemctl status $1
