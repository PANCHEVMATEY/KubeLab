
# Project Title

A brief description of what this project does and who it's for

# Flask Lucky App with Postgres on Minikube

This repository contains a simple Flask application that reads "lucky messages" from a PostgreSQL database. The app and the database are deployed on a local Kubernetes cluster using Minikube.

---

## Prerequisites

- [Minikube](https://minikube.sigs.k8s.io/docs/start/) installed on your machine
- [kubectl](https://kubernetes.io/docs/tasks/tools/) configured to access your Minikube cluster
- Docker installed (used to build the app image)

---

## Project Structure

- `Dockerfile` — Builds the Flask app image
- `main.py` — Flask application source code
- `psql-pvc.yml` — PersistentVolumeClaim for Postgres data persistence
- `psql-deployment.yml` — Postgres deployment manifest
- `psql-service.yml` — Postgres service manifest
- `app-deployment.yml` — Flask app deployment manifest
- `app-service.yml` — Flask app service manifest (optional)

---

docker build -t flask-lucky-app:latest .
kubectl apply -f psql-pvc.yml -n demo-app
kubectl apply -f psql-deployment.yml -n demo-app
kubectl apply -f psql-service.yml -n demo-app
kubectl apply -f app-deployment.yml -n demo-app
kubectl apply -f app-service.yml
kubectl get pods -n demo-app
kubectl logs -n demo-app <my-app-pod-name>

<!-- 5. Deploy the Flask app using the local image
Make sure app-deployment.yml contains the following to use the local Docker image:
imagePullPolicy: Never -->

