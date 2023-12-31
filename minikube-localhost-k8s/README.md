## Running `minikube` cluster within codespace

```bash
# Check if minikube already installed (generally pre installed)
minikube version

# start the cluster
minikube start

# check kubectl working 
kubectl version --short

# metrics-server addon needed for dashboard
minikube addons enable metrics-server

# Install dashboard
# Start a new terminal, and leave this running.
minikube dashboard --url 

# Hover the url and click on `Follow Link` to open in Browser
# you might need to concatinate `/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/` at the end of the browser url 
# should look like this
`https://fantastic-space-chainsaw-g4xgrw7q6xjfwj9r-44465.app.github.dev/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/`

# Troubleshoot the dashboard issue with similar command like below 
kubectl logs pod/kubernetes-dashboard-5c5cfc8747-42fb2 --namespace=kubernetes-dashboard

# Stop cluster
minikube stop

```

## Deploying sample application on cluster

```bash
# deploy a docker container on k8s cluster
kubectl create deploy viki-web-terminal --image=raonigabriel/web-terminal:latest --port=7681

# Edit or look into the template deployed by k8s. will be helpful to write your own template later
kubectl edit deploy viki-web-terminal 

# Expose | create a internal service 
kubectl expose deployment viki-web-terminal --type=NodePort --port=7681 --target-port=7681

# Enables nginx ingress controller for outside access
minikube addons enable ingress

# apply ingress
kubectl apply -f ingress.yml 

# port fwd
kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 7681:80
```