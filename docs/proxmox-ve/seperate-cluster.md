    ```shell
    systemctl stop pve-cluster 
    systemctl stop corosync
    pmxcfs -l
    rm /etc/pve/corosync.conf 
    rm -r /etc/corosync/*
    killall pmxcfs 
    systemctl start pve-cluster
    pvecm delnode [oldnode]
    pvecm expected 1
    rm /var/lib/corosync/*
    ```