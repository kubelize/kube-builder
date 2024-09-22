kubeseal --format=yaml \
  --cert=pub-home-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/home-dhe/secrets/incubator/connectivity/teleport-kube-agent/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/home-dhe/secrets/incubator/connectivity/teleport-kube-agent/teleport-kube-agent-join-token.yaml