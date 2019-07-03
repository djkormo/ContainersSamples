Recreate deployment
===================

> Version A is terminated then version B is rolled out.

![kubernetes recreate deployment](grafana-recreate.png)

## In practice

```
# Deploy the first application
$ kubectl apply -f app-v1.yaml --namespace=my-app

$ kubectl get pods |grep my-app-re

# Then deploy version 2 of the application
$ kubectl apply -f app-v2.yaml --namespace=my-app

# Delete deployment
```bash
$ kubectl delete deployment/my-app-re --namespace=my-app
```
