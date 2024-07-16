kubeseal --format=yaml \
  --cert=pub-prod-mck-sealed-secrets.pem \
  --secret-file operators/stable/observability/kube-prometheus-stack/secret.yaml \
  --sealed-secret-file operators/stable/observability/kube-prometheus-stack/alertmanager-config.yaml