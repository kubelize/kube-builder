kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/secret-dhe.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/home-dhe/alertmanager-secret.yaml

kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file apps/addons/teleport-kube-agent/join-token/home-dhe/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/teleport-kube-agent/join-token/home-dhe/teleport-kube-agent-join-token.yaml