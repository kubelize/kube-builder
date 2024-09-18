kubeseal --format=yaml \
  --cert=pub-prod-mck-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/clusters/prod-mck/secrets/projects/incubator/gameservers/minecraft/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/clusters/prod-mck/secrets/projects/incubator/gameservers/minecraft/minecraft-rcon-password.yaml