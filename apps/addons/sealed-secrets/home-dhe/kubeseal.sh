# Fetch the public key from the sealed-secrets controller
kubeseal --fetch-cert --controller-namespace=sealed-secrets > /home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem

# alertmanager config
kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/secret-dhe.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/home-dhe/alertmanager-secret.yaml

# teleport-kube-agent join token
kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/teleport-kube-agent/join-token/home-dhe/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/teleport-kube-agent/join-token/home-dhe/teleport-kube-agent-join-token.yaml

# renovate bot token
kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/operators/stable/gitops/renovate/deploy/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/operators/stable/gitops/renovate/deploy/renovate-env.yaml