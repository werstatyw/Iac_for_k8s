echo "adding repository for helm charts"
helm repo add grafana https://grafana.github.io/helm-charts
echo "updating helm"
helm repo update
echo "creating namespace for monitoring"
kubectl create namespace monitoring
echo "installing grafana. We are installing specific version for adding users (latest not working)"
helm upgrade --install loki-grafana --namespace monitoring -f grafana-values.yaml grafana/grafana --version 6.22.0 --set type=LoadBalancer

