EMAIL="<YOUR_EMAIL>"
sudo certbot certonly \
--manual --preferred-challenges dns \
--email $EMAIL --server https://acme-v02.api.letsencrypt.org/directory \
--agree-tos -d management.kubelize.com