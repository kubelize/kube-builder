```log
2024-12-18T10:26:50Z INFO [PROC:2]    Detected Teleport component is running in a degraded state. pid:7.2 component:app:service service/state.go:108
2024-12-18T10:27:01Z WARN             Inventory control stream failed: inventory control stream closed: control streams do not support impersonation ("285387be-8a40-4f61-948f-a1b73cec30be" -> "ac836d1f-b338-4c47-9b6f-3b027560d51c") inventory/inventory.go:220
```
This is likely an issue to do with the pod not having valid instance credentials (which are used for sending version information to the control plane) and not being able to use its existing join method to generate new ones, or some kind of internal UUID mismatch.

The simplest way to fix this is to delete the pod's state secret which holds its credentials, then restart the pod so it joins the cluster as a fresh agent.

```shell
k delete secret <helm-release-name>-0-state
k delete pod teleport-kube-agent-0 
```