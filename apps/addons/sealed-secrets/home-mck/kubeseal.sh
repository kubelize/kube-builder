# Fetch the public key from the sealed-secrets controller
kubeseal --fetch-cert --controller-namespace=sealed-secrets > /home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-mck/pub-home-mck-sealed-secrets.pem

# alertmanager config
kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-mck/pub-home-mck-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/secret-mck.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/home-mck/alertmanager-secret.yaml

# teleport-kube-agent join token
kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-mck/pub-home-mck-sealed-secrets.pem \
  --secret-file apps/addons/teleport-kube-agent/join-token/home-mck/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/teleport-kube-agent/join-token/home-mck/teleport-kube-agent-join-token.yaml

# minecraft rcon password
kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-mck/pub-home-mck-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-projects/base/stable/gameservers/minecraft-vanilla/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-projects/base/stable/gameservers/minecraft-vanilla/minecraft-rcon-password.yaml

# etcd-backup
kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-mck/pub-home-mck-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/storage/minio-tenants/etcd-backup/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/storage/minio-tenants/etcd-backup/home-mck/env-config.yaml

# longhorn-backup
kubeseal --format=yaml \
  --cert=/Users/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-mck/pub-home-mck-sealed-secrets.pem \
  --secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/storage/minio-tenants/longhorn-backup/home-mck/secret.yaml \
  --sealed-secret-file /Users/dan/Git/kubelize/kube-builder/apps/addons/storage/minio-tenants/longhorn-backup/home-mck/env-config.yaml