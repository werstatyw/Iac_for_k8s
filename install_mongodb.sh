kubectl create ns mongodb
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install mongodb bitnami/mongodb --set architecture="standalone" -n mongodb