#!/bin/bash

if [ "$UID" -ne "0" ]
then
  echo "Please run this script as sudo"
  exit
fi  

read -p "Who are you ? " login
sed -i "s/LOGIN/$login/g" "./srcs/mysql/pv/pv-volume.yaml"
sed -i "s/LOGIN/$login/g" "./srcs/ftps/pv/pv-volume.yaml"
sed -i "s/LOGIN/$login/g" "./srcs/influxdb/pv/pv-volume.yaml"

sudo apt install conntrack
sudo apt-get install filezilla
sudo minikube start --driver=none

# MetalLB
sudo kubectl apply -f  ./srcs/metalLB/metallb-namespace.yaml
sudo kubectl apply -f ./srcs/metalLB/metallb-setup.yaml
sudo kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
sudo kubectl create -f ./srcs/metalLB/metallb-configmap.yaml

# WORDPRESS + MYSQL + PHPMYADMIN
sudo docker build -t wordpress ./srcs/wordpress/
sudo kubectl create -f ./srcs/wordpress/wordpress-deployment.yaml
sudo kubectl create -f ./srcs/wordpress/wordpress-service.yaml
sleep 60
sudo docker build -t mysql ./srcs/mysql
sudo kubectl apply -f ./srcs/mysql/pv/pv-volume.yaml
sudo kubectl apply -f ./srcs/mysql/pv/pv-claim.yaml
sudo kubectl create -f ./srcs/mysql/mysql-deployment.yaml
sudo kubectl create -f ./srcs/mysql/mysql-service.yaml
sudo docker build -t phpmyadmin ./srcs/phpmyadmin
sudo kubectl create -f ./srcs/phpmyadmin/phpmyadmin-deployment.yaml
sudo kubectl create -f ./srcs/phpmyadmin/phpmyadmin-service.yaml

# NGINX
sudo docker build -t nginx ./srcs/nginx
sudo kubectl apply -f ./srcs/nginx/nginx-deployment.yaml
sudo kubectl apply -f ./srcs/nginx/nginx-service.yaml

# FTPS
sudo docker build -t ftps ./srcs/ftps
sudo kubectl apply -f ./srcs/ftps/pv/pv-volume.yaml
sudo kubectl apply -f ./srcs/ftps/pv/pv-claim.yaml
sudo kubectl apply -f ./srcs/ftps/ftps-deployment.yaml
sudo kubectl apply -f ./srcs/ftps/ftps-service.yaml


# INFLUXDB + TELEGRAF + GRAFANA
sudo docker build -t influxdb ./srcs/influxdb
sudo kubectl apply -f ./srcs/influxdb/pv/pv-volume.yaml
sudo kubectl apply -f ./srcs/influxdb/pv/pv-claim.yaml
sudo kubectl apply -f ./srcs/influxdb/influxdb-deployment.yaml
sudo kubectl apply -f ./srcs/influxdb/influxdb-service.yaml
sudo docker build -t telegraf ./srcs/telegraf
sudo kubectl apply -f ./srcs/telegraf/telegraf-deployment.yaml
sudo kubectl apply -f ./srcs/telegraf/telegraf-service.yaml
sudo docker build -t grafana ./srcs/grafana
sudo kubectl apply -f ./srcs/grafana/grafana-deployment.yaml
sudo kubectl apply -f ./srcs/grafana/grafana-service.yaml

# Kubernetes Dashboard
sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
sudo kubectl create serviceaccount dashboard-admin
sudo kubectl create clusterrolebinding dashboard-admin --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin
printf "Please copy the token aboce to log into the Kubernetes Dashbboard at the following address\n\n"
printf "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/\n\n"
sudo kubectl describe secret dashboard-admin

sudo xterm -e sudo kubectl proxy &
sudo xterm -e watch sudo kubectl get pods &
sudo xterm -e watch sudo kubectl get svc &
sudo xterm -e sudo ./utils/database_backup.sh &