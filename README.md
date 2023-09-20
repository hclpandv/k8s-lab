# k8s-lab

## Running monikube cluster within codespace

```bash
# Check if minikube already installed (generally pre installed)
minikube version

# start the cluster
minikube start

# Enable metrics-server addon
minikube addons enable metrics-server

# Enable dashboard
minikube dashboard --url

# check kubectl working 
kubectl version --short

# Install dashboard

```
