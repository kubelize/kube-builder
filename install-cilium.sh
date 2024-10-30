helm install \
    cilium \
    cilium/cilium \
    --namespace kube-system \
    --set=ipam.mode=kubernetes \
    --set=kubeProxyReplacement=true \
    --set=operator.replicas=1 \
    --set=securityContext.capabilities.ciliumAgent="{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}" \
    --set=securityContext.capabilities.cleanCiliumState="{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}" \
    --set=cgroup.autoMount.enabled=false \
    --set=cgroup.hostRoot=/sys/fs/cgroup \
    --set=l2announcements.enabled=true \
    --set=externalIPs.enabled=true \
    --set=devices=eth+ \
    --set=k8sServiceHost=localhost \
    --set=k8sServicePort=7445