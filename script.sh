#!/bin/bash

# this script will remove minikube and reinstall it on your machine
minikube stop; minikube delete
brew update
brew install minikube
brew install helm
brew upgrade
minikube start --driver=docker --kubernetes-version=v1.16.14
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo remove prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
# helm repo remove stable https://charts.helm.sh/stable
helm repo update
helm install prometheus-operator prometheus-community/kube-prometheus-stack -f helm_vals.yaml
# for default values
# helm install prometheus-operator prometheus-community/kube-prometheus-stack
sleep 240
kubectl port-forward -n default prometheus-prometheus-operator-kube-p-prometheus-0 9090 &
grafana=$(kubectl get pods --namespace=default -o jsonpath='{.items[1].metadata.name}')
kubectl port-forward -n default ${grafana} 3000 &

# username: admin
# password: prom-operator