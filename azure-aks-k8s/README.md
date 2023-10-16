# Connecting to AKS cluster hosted on Azure

1. Install az-cli and login 

```bash
# Install via script
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
aks="aks-eas-d-demo-01"
az aks get-credentials --resource-group $resource_group --name $aks
```