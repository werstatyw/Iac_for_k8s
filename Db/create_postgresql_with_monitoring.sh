#basic postgres install with 8gb pvc
helm install postgresql --set metrics.enabled=true,auth.database=saharok_dev bitnami/postgresql -n postgresq
