#!/bin/sh


# based on

# https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/aks/kubernetes-helm.md
# https://unofficialism.info/posts/accessing-rbac-enabled-kubernetes-dashboard/
# https://blog.nilayparikh.com/azure/computing/aks/getting-started-with-helm-and-azure-kubernetes-services/
# https://www.digitalocean.com/community/tutorials/how-to-install-software-on-kubernetes-clusters-with-the-helm-package-manager

helm init --history-max 200



kubectl get pods --namespace kube-system


helm version



helm repo update


helm search mysql

helm install stable/mysql --name=mysql

helm inspect stable/mysql

helm ls


helm delete mysql

#### wordpress

helm install --name wordpress stable/wordpress

# pods 

kubectl get pods | grep wordpress

# services 

kubectl get svc --namespace default |grep wordpress 

 # secrets
 
kubectl get secrets |grep wordpress


# how to login

echo Username: user
echo Password: $(kubectl get secret --namespace default wordpress-wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode)


kubectl get svc --namespace default wordpress-wordpress


kubectl describe svc --namespace default wordpress-wordpress




helm delete wordpress 





# grafana 





helm inspect stable/grafana


# dashboard 

helm install stable/kubernetes-dashboard --name dashboard-demo

helm list

kubectl get services

helm upgrade dashboard-demo stable/kubernetes-dashboard --set fullnameOverride="dashboard"


kubectl get services

kubectl proxy

http://localhost:8001/api/v1/namespaces/default/services/https:dashboard:/proxy/


# using RBAC 
kubectl apply -f helm-rbac.yaml

helm init --upgrade --service-account tiller

kubectl get sa tiller -n kube-system


kubectl create -f https://raw.githubusercontent.com/djkormo/ContainersSamples/master/Kubernetes/AKS/kube-dashboard-access.yaml








