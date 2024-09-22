kubeseal --format=yaml \
  --cert=pub-home-mck-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/home-mck/secrets/incubator/connectivity/teleport-agent/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/home-mck/secrets/incubator/connectivity/teleport-agent/teleport-kube-agent-join-token.yaml