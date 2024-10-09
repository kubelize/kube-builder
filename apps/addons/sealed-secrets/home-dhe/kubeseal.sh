kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-dhe/pub-home-dhe-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/secret.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/alertmanager-home-dhe.yaml