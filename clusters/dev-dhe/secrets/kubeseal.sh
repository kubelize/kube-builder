kubeseal --format=yaml \
  --cert=pub-dev-dhe-sealed-secrets.pem \
  --secret-file  [path/to/secret] \
  --sealed-secret-file [path/to/output/secret]