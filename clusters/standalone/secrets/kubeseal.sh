kubeseal --format=yaml \
  --cert=pub-standalone-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/standalone/secrets/operators/stable/observability/kube-prometheus-stack/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/standalone/secrets/operators/stable/observability/kube-prometheus-stack/alertmanager-config.yaml