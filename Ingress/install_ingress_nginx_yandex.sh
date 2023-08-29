echo "adding helm chart with ingress nginx"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
echo "updating helm..."
helm repo update
echo "installing ingress-nginx..."
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx -f nginx_prometheus_enable.yaml
