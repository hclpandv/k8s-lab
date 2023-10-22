# Connecting to AKS cluster hosted on Azure

1. Install az-cli and login 

```bash
# Install az cli via script
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login via device code
az login --use-device-code

# Create sp for future usage
subscription="aaaaaaaa-bbbb-bbbb-bbbb-bbbbbbbbbbbbbbbb"
az ad sp create-for-rbac -n "tfuser" --role contributor --scopes /subscriptions/$subscription
```

2. Connect to cluster using kubectl

```bash
resource_group="rg-eas-aks-demo-01"
aks="aks-eas-d-democluster-01"
az aks get-credentials --resource-group $resource_group --name $aks
```

# Port Fwd to access a pod 
kubectl port-forward viki-web-terminal-6bdbcb7f4c-gp8h9 7681

# access kube-ops-view (visualizer)
kubectl port-forward kube-ops-view-866b7bf788-xfrbz 8080

#### https://schoolofdevops.github.io/ultimate-kubernetes-bootcamp/kube_visualizer/