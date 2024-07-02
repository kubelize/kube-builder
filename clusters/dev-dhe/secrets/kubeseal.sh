kubeseal --format=yaml \
  --cert=pub-dev-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/dev-dhe/secrets/operators/incubator/security/keycloak/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/dev-dhe/secrets/operators/incubator/security/keycloak/postgres-config-keycloak.yaml