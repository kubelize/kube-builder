kubeseal --format=yaml \
  --cert=pub-standalone-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/standalone/secrets/operators/stable/connectivity/teleport-agent/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/standalone/secrets/operators/stable/connectivity/teleport-agent/teleport-kube-agent-join-token.yaml