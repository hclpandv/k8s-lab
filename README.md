# k8s-lab

## How to use `minikube` local cluster for dev and `cloud.okteto.com` SaaS cluster for prod deployment

We switch `kubectl` context for each environemnt 

Execute command `kubectl config get-contexts`

```output
CURRENT   NAME               CLUSTER            AUTHINFO                               NAMESPACE
          cloud_okteto_com   cloud_okteto_com   0abe7adREDATED7b7abcb5                 hclpandv
*         minikube           minikube           minikube                               default

```

The one with `*` in `CURRENT` column will be current context

```bash
# Switch context
kubectl config use-context minikube

# or
kubectl config use-context cloud_okteto_com
```

## Deploying sample application on cluster

```bash
# deploy a docker container on k8s cluster
kubectl create deploy viki-web-terminal --image=raonigabriel/web-terminal:latest --port=7681

# Expose | create an internal service 
kubectl expose deployment viki-web-terminal --type=NodePort --port=7681 --target-port=7681

# Enables nginx ingress controller for outside access
minikube addons enable ingress

# apply ingress
kubectl apply -f ingress.yml 

# port fwd
kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 7681:80
```