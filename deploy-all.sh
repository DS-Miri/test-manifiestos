#!/bin/bash

set -e

echo "Aplicando namespace"
kubectl apply -f namespace.yaml

echo "Desplegando SQL Server"
kubectl apply -f sqlserver/sqlserver-secret.yaml
kubectl apply -f sqlserver/sqlserver-pvc.yaml
kubectl apply -f sqlserver/sqlserver-statefulset.yaml
kubectl apply -f sqlserver/sqlserver-service.yaml

echo "Desplegando GeoServer"
kubectl apply -f geoserver/geoserver-pvc.yaml
kubectl apply -f geoserver/geoserver-deployment.yaml
kubectl apply -f geoserver/geoserver-service.yaml

echo "Backend"
kubectl apply -f backend/backend-deployment.yaml
kubectl apply -f backend/backend-service.yaml

echo "Frontend"
kubectl apply -f frontend/frontend-deployment.yaml
kubectl apply -f frontend/frontend-service.yaml

echo "Ingress (API + Frontend)"
kubectl apply -f ingress-sigemad-api.yaml
kubectl apply -f ingress-sigemad-frontend.yaml

echo "Despliegue completo de SIGEMAD terminado."

