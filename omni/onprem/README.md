# Deploying Omni with Docker Compose

Omni is deployed using a docker compose derived from the command used in the official documentation which can be found here: https://omni.siderolabs.com/docs/how-to-guides/self-hosted/how-to-deploy-omni-on-prem/

## Generate Certificates

Omni requires SSL certificates from a recognized CA, for simplicity this will be implemented with certbot and letsencrypt

### Installing certbot

Using the official apt repository

```shell
apt update && apt install certbot -y
```

generate the cretificate

```shell
EMAIL="<YOUR_EMAIL>"
sudo certbot certonly \
--manual --preferred-challenges dns \
--email $EMAIL --server https://acme-v02.api.letsencrypt.org/directory \
--agree-tos -d <YOUR_DOMAIN>
```

a txt record will be generated and will require you to configure it on the DNS server before continuing

## Creating an ETCD encryption key

generate a gpg key

```shell
gpg --quick-generate-key "<YOUR_EMAIL>" rsa4096 cert never
```

using the fingerprint add an encryption subkey and export it

```shell
gpg --quick-add-key <KEY_FINGERPRINT> rsa4096 encr never
gpg --export-secret-key --armor <YOUR_EMAIL> > omni.asc
```

## Deploy omni

first create a uuid for the omni-account to run with

```shell
export OMNI_ACCOUNT_UUID=$(uuidgen)
```

run docker compose

```shell
docker compose up --detach
```

shut down omni

```shell
docker compose down
```


