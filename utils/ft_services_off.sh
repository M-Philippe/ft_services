#!/bin/bash

if [ "$UID" -ne "0" ]
then
  echo "Please run this script as sudo"
  exit
fi  

read -p "Who are you ? " user
sed -i "s/$user/LOGIN/g" "./srcs/mysql/pv/pv-volume.yaml"
sed -i "s/$user/LOGIN/g" "./srcs/ftps/pv/pv-volume.yaml"
sed -i "s/$user/LOGIN/g" "./srcs/influxdb/pv/pv-volume.yaml"

sudo apt remove filezilla
sudo apt remove conntrack
sudo minikube delete