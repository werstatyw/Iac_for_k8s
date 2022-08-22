Get your 'admin' user password by running:

   kubectl get secret --namespace monitoring loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

2. The Grafana server can be accessed via port 80 on the following DNS name from within your cluster:

   loki-grafana.monitoring.svc.cluster.local

   Get the Grafana URL to visit by running these commands in the same shell:

     export POD_NAME=$(kubectl get pods --namespace monitoring -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=loki-grafana" -o jsonpath="{.items[0].metadata.name}")
     kubectl --namespace monitoring port-forward $POD_NAME 3000

     Grafana Dashboards Creation
After you log in, select Import on the navigation bar on the left. Enter 315 as the code and load it in.

Import a dashboard

On the next screen, give your dashboard a name and select prometheus as a data source. Click Import.

This template will automatically retrieve the key metrics from cAdvisor and show you the stats You can also add different metrics to this dashboard or create an entirely new dashboard from scratch.

Grafana dashboard showing network I/O pressure

Grafana dashboard showing CPU usage
