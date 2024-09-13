kubeseal --format=yaml \
  --cert=pub-standalone-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/standalone/secrets/projects/incubator/gameservers/minecraft/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/standalone/secrets/projects/incubator/gameservers/minecraft/minecraft-rcon-password.yaml