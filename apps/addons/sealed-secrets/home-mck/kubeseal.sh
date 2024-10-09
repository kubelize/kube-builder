kubeseal --format=yaml \
  --cert=/home/dan/Git/kubelize/kube-builder/apps/addons/sealed-secrets/home-mck/pub-home-mck-sealed-secrets.pem \
  --secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/secret2.yaml \
  --sealed-secret-file /home/dan/Git/kubelize/kube-builder/apps/addons/alertmanager-config/alertmanager-home-mck.yaml