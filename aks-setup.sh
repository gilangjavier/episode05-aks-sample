az provider show -n Microsoft.OperationsManagement -o table
az provider show -n Microsoft.OperationalInsights -o table
##IF ALREADY REGISTERED SKIP THIS COMMAND
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.OperationalInsights
######

az group create --name myAKSrg --location eastus
az aks create -g myAKSrg -n myAKSCluster --enable-managed-identity --node-count 1 --enable-addons monitoring --enable-msi-auth-for-monitoring  --generate-ssh-keys

az aks install-cli
az aks get-credentials --resource-group myAKSrg --name myAKSCluster
kubectl get nodes

kubectl apply -f azure-vote.yaml
kubectl get service azure-vote-front --watch

##Delete Cluster
az group delete --name myResourceGroup --yes --no-wait