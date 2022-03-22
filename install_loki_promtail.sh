echo "installing loki"
helm upgrade --install loki grafana/loki --namespace=monitoring
echo "installing promtail"
helm upgrade --install promtail grafana/promtail --set config.lokiAddress=http://loki:3100/loki/api/v1/push  -n monitoring