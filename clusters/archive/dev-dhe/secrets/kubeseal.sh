kubeseal --format=yaml \
  --cert=pub-dev-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/dev-dhe/secrets/operators/stable/observability/kube-prometheus-stack/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/dev-dhe/secrets/operators/stable/observability/kube-prometheus-stack/alertmanager-config.yaml