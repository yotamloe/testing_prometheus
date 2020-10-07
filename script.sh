#!/bin/bash

# this script will remove minikube and reinstall it on your machine
minikube stop; minikube delete
bre update
brew install minikube
brew install helm
brew update
minikube start --driver=docker
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
helm install prometheus-operator prometheus-community/kube-prometheus-stack -f helm_vals.yaml
sleep 240
kubectl port-forward -n default prometheus-prometheus-operator-kube-p-prometheus-0 9090 &
grafana=$(kubectl get pods --namespace=default -o jsonpath='{.items[1].metadata.name}')
kubectl port-forward -n default ${grafana} 3000 &

# username: admin
# password: prom-operator

