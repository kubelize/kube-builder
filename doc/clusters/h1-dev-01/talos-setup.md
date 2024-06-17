# Setup

```bash
talosctl gen config \
    hl-dev-01 https://10.130.5.152:6443 \
    --config-patch @cilium-noproxy-patch.yaml 
```
Apply the generated config to the control planes

```bash
talosctl apply-config --insecure --nodes 10.130.5.152 --file controlplane.yaml
talosctl apply-config --insecure --nodes 10.130.5.153 --file controlplane.yaml
```

Apply the config to the worker nodes

```bash
talosctl apply-config --insecure --nodes 10.130.5.154 --file worker.yaml
talosctl apply-config --insecure --nodes 10.130.5.155 --file worker.yaml
```

Export talos-config settings

```shell
export TALOSCONFIG="talosconfig"
talosctl config endpoint 10.130.5.152    
talosctl config node 10.130.5.152 
```

Configure endpoint for the talosconfig

```bash
talosctl config endpoint 10.130.5.152
```

Set which node configs will be passed to

```shell
talosctl config node 10.130.5.152
```

Bootstrap the etcd

```shell
talosctl bootstrap
```

Pull the admin kubeconfig

```shell
talosctl kubeconfig .
```

Install Cilium CNI

```bash
cilium-cli install \ 
    --helm-set=ipam.mode=kubernetes \
    --helm-set=kubeProxyReplacement=true \
    --helm-set=securityContext.capabilities.ciliumAgent="{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}" \
    --helm-set=securityContext.capabilities.cleanCiliumState="{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}" \
    --helm-set=cgroup.autoMount.enabled=false \
    --helm-set=cgroup.hostRoot=/sys/fs/cgroup \
    --helm-set=k8sServiceHost=localhost \
    --helm-set=k8sServicePort=7445
```

Mayastor storage setup

```shell
talosctl patch --mode=no-reboot machineconfig -n <node ip> --patch @mayastor-patch.yaml
talosctl -n <node ip> service kubelet restart
```

add the following to the worker nodes machineconfig

```shell
kubelet:
    extraMounts:
    - destination: /var/local
        type: bind
        source: /var/local
        options:
        - rbind
        - rshared
        - rw
```

```shell
k create ns mayastor
k label ns mayastor pod-security.kubernetes.io/enforce=privileged  
```

```shell
helm install mayastor mayastor/mayastor -n mayastor --version 2.5.0
```