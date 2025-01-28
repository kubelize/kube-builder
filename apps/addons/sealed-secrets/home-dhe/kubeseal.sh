# Fetch the public key from the sealed-secrets controller
kubeseal --fetch-cert --controller-namespace=sealed-secrets > /Users/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem

# alertmanager config
kubeseal --format=yaml \
  --cert=/Users/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/secret-dhe.yaml \
  --sealed-secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/home-dhe/alertmanager-secret.yaml

# teleport-kube-agent join token
kubeseal --format=yaml \
  --cert=/Users/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/teleport-kube-agent/join-token/home-dhe/secret.yaml \
  --sealed-secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/teleport-kube-agent/join-token/home-dhe/teleport-kube-agent-join-token.yaml

# renovate bot token
kubeseal --format=yaml \
  --cert=/Users/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /Users/dan/Git/kubelize/kube-builder/apps/operators/stable/gitops/renovate/deploy/secret.yaml \
  --sealed-secret-file /Users/dan/Git/kubelize/kube-builder/apps/operators/stable/gitops/renovate/deploy/renovate-env.yaml

# etcd-backup minio tenant
kubeseal --format=yaml \
  --cert=/Users/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/storage/minio-tenants/etcd-backup/home-dhe/secret.yaml \
  --sealed-secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/storage/minio-tenants/etcd-backup/home-dhe/env-config.yaml

# longhorn-backup minio tenant
kubeseal --format=yaml \
  --cert=/Users/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/storage/minio-tenants/longhorn-backup/home-dhe/secret.yaml \
  --sealed-secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/storage/minio-tenants/longhorn-backup/home-dhe/env-config.yaml