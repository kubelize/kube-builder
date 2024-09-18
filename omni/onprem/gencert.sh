# DO NOT REMOVE OMNI.ASC IT IS THE GPG ENCRYPTION KEY FOR THE ETCD
EMAIL="<YOUR_EMAIL>"
sudo certbot certonly \
--manual --preferred-challenges dns \
--email $EMAIL --server https://acme-v02.api.letsencrypt.org/directory \
--agree-tos -d omni.kubelize.com