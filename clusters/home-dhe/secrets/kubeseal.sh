kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/clusters/home-dhe/secrets/pub-home-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/home-dhe/secrets/stable/observability/renovate/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/home-dhe/secrets/stable/observability/renovate/renovate-env.yaml