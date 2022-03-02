echo "adding repostory into helm:"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
echo "updating added repository"
helm repo update
