#!/bin/bash

echo "Delete nginx-ingress"
helm delete --purge nginx-ingress

echo "Delete jenkins"
helm delete --purge jenkins

echo "Delete docker-registry"
helm delete --purge docker-registry