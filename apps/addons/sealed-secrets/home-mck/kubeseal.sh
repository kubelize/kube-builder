kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-mck/pub-home-mck-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/teleport-kube-agent/join-token/home-mck/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/teleport-kube-agent/join-token/home-mck/teleport-kube-agent-join-token.yaml