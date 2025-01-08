 # Cluster Resources home-dhe

Two worker-nodes with the following capacities (max single node capacity = total / 2):

| Resource | Conventional Units | Kubernetes |
| -------- | ------------------ | ---------- |
| CPU      | 20 Cores           | 20000m     |
| Memory   | 32768 MiB          | 32768Mi    |

## Usage

| Resource                | CPU Requests (m) | CPU Limits (m) | Memory Requests (Mi) | Memory Limits (Mi) |
|-------------------------|------------------|----------------|----------------------|--------------------|
| **Total Available**     | 20000            | 20000          | 32768                | 32768              |
| **Operators**           |-                 |-               |-                     |-                   |
| sealed-secret operator  | 1                | 10             | 32                   | 64                 |
| **Projects**            |-                 |-               |-                     |-                   |
| nextcloud-nextcloud     | 1000             | 2000           | 1024                 | 2044               |
| nextcloud-mariadb       | 250              | 380            | 256                  | 384                |
| nextcloud-redis         | 100              | 150            | 128                  | 192                |
| **Total Assigned**      | ΣY               | ΣZ             | ΣY                   | ΣZ                 |
| **% of Total**          | (ΣY/X)*100 %     | (ΣZ/X)*100 %   | (ΣY/X)*100 %         | (ΣZ/X)*100 %       |

## Operators

### sealed-secret operator

Utilization monitored over 7 days

| Usage  | CPU  | Memory  |
|--------|------|---------|
| Median | 0.3m | 38.8MiB |
| High   | 4.5m | 39.2MiB |

Suggested configuration:

```yaml
resources:
    requests:
    cpu: 1m
    memory: 32Mi
    limits:
    cpu: 10m
    memory: 64Mi
```

## Projects

### nextcloud

nextcloud

Utilization monitored over 6 hours (1 User)

| Usage  | CPU   | Memory  |
|--------|-------|---------|
| Median | 250m  | 180MiB  |
| High   | 1600m | 513MiB  |

Suggested configuration:

```yaml
resources:
    requests:
    cpu: 1
    memory: 1Gi
    limits:
    cpu: 2
    memory: 2Gi
```

mariadb

Utilization monitored over 6 hours (1 User)

| Usage  | CPU   | Memory  |
|--------|-------|---------|
| Median | 9.5m  | 77.8MiB |
| High   | 12.5m | 80.1MiB |

Suggested configuration:

```yaml
resources:
    requests:
    cpu: 250m
    memory: 256Mi
    limits:
    cpu: 380m
    memory: 384Mi
```

redis

Utilization monitored over 6 hours (1 User)

| Usage  | CPU   | Memory  |
|--------|-------|---------|
| Median | -     | -       |
| High   | -     | -       |

Suggested configuration:

```yaml
resources:
    requests:
    cpu: 100m
    memory: 128Mi
    limits:
    cpu: 150m
    memory: 192Mi
```