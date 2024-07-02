kubeseal --format=yaml \
  --cert=pub-dev-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/dev-dhe/secrets/operators/incubator/connectivity/keycloak/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/dev-dhe/secrets/operators/incubator/connectivity/teleport-agent/teleport-kube-agent-join-token.yaml