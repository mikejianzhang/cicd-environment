#!/bin/bash

echo "Start CI/CD platform ..."
echo "Start nginx-ingress"
helm upgrade nginx-ingress -i nginx-ingress/ --namespace kube-system -f nginx-ingress/values-prod.yaml
sleep 3

echo "Start jenkins"
helm upgrade jenkins jenkins/ -i --namespace devops-cicd -f jenkins/values-prod.yaml
sleep 3

echo "Start docker-registry"
helm upgrade docker-registry docker-registry/ -i --namespace devops-cicd
sleep 3

echo "Start metrics-server"
kubectl apply -f metrics-server/