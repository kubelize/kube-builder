kubeseal --format=yaml \
  --cert=pub-prod-mck-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/prod-mck/secrets/operators/incubator/connectivity/teleport-agent/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/prod-mck/secrets/operators/incubator/connectivity/teleport-agent/teleport-kube-agent-join-token.yaml