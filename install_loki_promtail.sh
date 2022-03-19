echo "installing loki"
helm upgrade --install loki grafana/loki --namespace=monitoring
echo "installing promtail"
helm upgrade --install promtail grafana/promtail --set "loki.serviceName=loki" -n monitoring