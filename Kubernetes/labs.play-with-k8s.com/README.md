1. Go to:

https://labs.play-with-k8s.com/

2. login with your dockerhub or github account



3. Create first instance.
Remember you have 4 hours to play with k8s.

4. In first (master) instance run kubernetes cluster with

 a) Initializes cluster master node:

 kubeadm init --apiserver-advertise-address $(hostname -i)


 b) Initialize cluster networking:

 kubectl apply -n kube-system -f \
    "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 |tr -d '\n')"


 c) (Optional) Create an nginx deployment:

 kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml
 
 
 
Tips

Clipboard

Shif+Insert > Paste
Ctrl+Insert -> Copy

installing packages:

yum install package_name

example: yum -y install wget lynx  
