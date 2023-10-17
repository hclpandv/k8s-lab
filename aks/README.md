# Connect to AKS


## Link your Kubernetes cluster with kubectl by running the following command in Cloud Shell.

```bash
CLUSTER_NAME='aks-eas-d-demo-01'
RESOURCE_GROUP='rg-eas-d-aks-demo-01'

az aks get-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP
```
