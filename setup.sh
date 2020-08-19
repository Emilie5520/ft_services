#!/bin/sh

minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000

eval `minikube docker-env`

export MINIKUBE_IP=`minikube ip`
echo $MINIKUBE_IP > srcs/nginx/srcs/ip
echo $MINIKUBE_IP > srcs/ftps/srcs/ip
echo $MINIKUBE_IP > srcs/mysql/srcs/ip
echo $MINIKUBE_IP > srcs/phpmyadmin/srcs/ip
echo $MINIKUBE_IP > srcs/wordpress/srcs/ip
echo $MINIKUBE_IP > srcs/telegraf/srcs/ip
echo $MINIKUBE_IP > srcs/influxdb/srcs/ip
echo $MINIKUBE_IP > srcs/grafana/srcs/ip

minikube addons enable metrics-server
minikube addons enable dashboard

docker build -t nginx-image srcs/nginx/
docker build -t ftps-image srcs/ftps/
docker build -t mysql-image srcs/mysql/
docker build -t phpmyadmin-image srcs/phpmyadmin/
docker build -t wordpress-image srcs/wordpress/
docker build -t influxdb-image srcs/influxdb/
docker build -t telegraf-image srcs/telegraf/
docker build -t grafana-image srcs/grafana/

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f srcs/metallb.yaml

kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/influxdb.yaml
kubectl apply -f srcs/telegraf.yaml
kubectl apply -f srcs/grafana.yaml
