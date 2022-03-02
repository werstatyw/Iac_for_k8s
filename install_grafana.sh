echo "adding repository for helm charts"
helm repo add grafana https://grafana.github.io/helm-charts
echo "updating helm"
helm repo update
echo "creating namespace for monitoring"
kubectl create namespace monitoring
echo "installing grafana"
helm install loki-grafana grafana/grafana --namespace monitoring
