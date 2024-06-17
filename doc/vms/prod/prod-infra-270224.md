# Table of Contents

1. [Summary](#summary)
2. [Setup](#setup)
    - [Satisfying the Preflight Checks](#satisfying-the-preflight-checks)
    - [Installing dependencies](#installing-dependencies)
    - [Installing the container runtime](#installing-the-container-runtime)
    - [Installing Kubernetes Tools and Componants](#installing-kubernetes-tools-and-componants)
    - [Initializing the node with kubadm](#initializing-the-node-with-kubeadm)
    - [Installing the CNI cilium](#installing-the-cni-cilium)
    - [Configuring kubectl](#configuring-kubectl)
3. [Join additionals nodes to the cluster](#join-additional-nodes-to-cluster)

# Summary

| hostname          | IP-address    | OS | Kernel |
|-------------------|---------------|----|--------|
| prod-infra-270224 | 192.168.1.127 |    |        |

# Setup

## SSH access

To use an ssh-key to access the nodes, add the public key with the following command:

```shell
ssh-copy-id core@192.168.1.127
```

It's best practise to disallow root login and password authentication. Add the a file called ssh.conf to `/etc/ssh/sshd_config.d`

```
PasswordAuthentication no
PermitRootLogin no
ChallengeResponseAuthentication no
UsePAM no
```

then restart the ssh service

```shell
sudo systemctl restart sshd
```

Now login with `ssh 192.168.1.127 -lcore`

## Satisfying the Preflight Checks

Turn off swap by commenting out the swap entry in `/etc/fstab/`

Enable the Kernelmodules br_netfilter and overlay

```shell
modprobe overlay && sudo modprobe br_netfilter && \
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf && \
sysctl -p /etc/sysctl.conf && \
reboot
```

## Installing dependencies

Fresh node will require the following packages to be installed

```shell
sudo apt update && sudo apt install -y ca-certificates curl apt-transport-https gpg
```

## Installing the container runtime

### containerd

```shell
sudo apt install -y containerd && \
sudo mkdir -p /etc/containerd && \
sudo containerd config default | sudo tee /etc/containerd/config.toml
```
Configure containerd to use systemd as the cgroup driver:

1. Open `/etc/containerd/config.toml` in an editor and search for `[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]`
2. Find the following entry: `SystemdCgroup = false` and change it to `true`

## Installing Kubernetes Tools and Componants

### Adding the Kubernetes repositories and gpg signing key

> [!WARNING]
> If the folder `/etc/apt/keyrings` does not exist, create it with the follwing permissions:`sudo mkdir -p -m 755 /etc/apt/keyrings`

```shell
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

### control-plane componants

```shell
sudo apt update && \
sudo apt install -y kubeadm kubelet kubectl && \
sudo apt-mark hold kubeadm kubelet kubectl
```

## Initializing the node with kubeadm

### control-plane

If you want to set a name for the cluster create the following YAML

```yaml
apiVersion: kubeadm.k8s.io/v1beta3
kind: ClusterConfiguration
clusterName: "your-cluster-name"
```

As I will be using the CNI cilium and it can fully replace the default k8s proxy pods, I will pass the additional argument: `--skip-phases=addon/kube-proxy`

```shell
sudo kubeadm init --skip-phases=addon/kube-proxy --config=config.yaml
```

## Installing the CNI cilium

Using the cli tool installed as described [here](https://docs.cilium.io/en/stable/gettingstarted/k8s-install-default/) run:

```shell
cilium install
```

## Configuring kubectl

```shell
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

If this results in the following warning: `~/home/.kube/config is group readable`

then execute the following command to ammend:

```shell
chmod go-r ~/.kube/config
```

## label nodes

```shell
k label node prod-infra-270224 level=infra
```

# Join additional nodes to cluster

To join a node to the cluster, create a join token on the master node with:

```shell
kubeadm token create --print-join-command
```

