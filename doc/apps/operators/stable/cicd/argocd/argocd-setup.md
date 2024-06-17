# ArgoCD
## Installation
Created argocd namespace
```bash
k create ns argocd
```
Install argocd per helm
```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd -n argocd -f apps/operators/stable/cicd/argocd/values.yaml
```
Change argocd-server service Type to NodePort, save and exit 
```bash
k edit svc argocd-server
```
View the Nodeport assigned to the service
```bash
k get svc argocd-server
```
Get the initial access password for the user admin
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d 
```
Access the Web-UI in the browser using `https://[master-node ip]:[NodePort]` 
