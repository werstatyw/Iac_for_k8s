#first, let's add bitnami repository if it hasn't made before:
helm repo add bitnami https://charts.bitnami.com/bitnami
#then let's create additional ns for postgresql:
kubectl create ns postgresql
#then, let's add bitnami release with monitoring capability:
helm install postgresql --set metrics.enabled=true,auth.database=tsst bitnami/postgresql -n postgresql