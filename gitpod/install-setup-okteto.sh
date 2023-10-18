#!/bin/bash

# Install az cli via script
echo "Installing Az cli"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login AZ cli
echo "Login to az cli"
az login --service-principal \
    -u ${CLIENT_ID} \
    -p ${CLIENT_SECRET} \
    --tenant ${TENANT_ID}

# Install helm
echo "Installing helm"
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sudo bash

# install okteto
echo "Setting-up okteto"
OLD_DIR="$PWD"
TMP_DIR="$(mktemp -d)"
cd "${TMP_DIR}" || exit 1

curl https://get.okteto.com -sSfL | sh

# Use PAT from settings
okteto context use https://cloud.okteto.com --token $OKTETO_PAT

# Setup kubectl
echo "Setting-up kubectl"
OLD_DIR="$PWD"
TMP_DIR="$(mktemp -d)"
cd "${TMP_DIR}" || exit 1

# Get the Stable version of k8s
KUBE_REL=$(curl -L -s https://dl.k8s.io/release/stable.txt)

curl -LO "https://dl.k8s.io/release/${KUBE_REL}/bin/linux/amd64/kubectl"
KUBE_SHA=$(curl -sL "https://dl.k8s.io/release/${KUBE_REL}/bin/linux/amd64/kubectl.sha256")

echo "${KUBE_SHA} kubectl" >kubectl.sha256

if sha256sum -c kubectl.sha256; then
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/kubectl
fi

cd "${OLD_DIR}" || exit 1
rm -rf "${TMP_DIR}"


# tell kubectl to use okteto kubeconfig
okteto kubeconfig

# validate installation success
okteto version && kubectl version