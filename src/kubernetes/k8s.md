# Install Kubernetes

Login to the VM
```
vagrant ssh
 ```
<details>
<summary>
 Sample Output
 </summary>
Welcome to Ubuntu 18.04.2 LTS (GNU/Linux 4.15.0-51-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun Oct 20 06:53:33 UTC 2019

  System load:  0.87               Users logged in:            0
  Usage of /:   18.6% of 61.80GB   IP address for eth0:        10.0.2.15
  Memory usage: 14%                IP address for docker0:     172.17.0.1
  Swap usage:   0%                 IP address for kube-bridge: 192.168.0.1
  Processes:    160

 * Kata Containers are now fully integrated in Charmed Kubernetes 1.16!
   Yes, charms take the Krazy out of K8s Kata Kluster Konstruction.

     https://ubuntu.com/kubernetes/docs/release-notes

111 packages can be updated.
60 updates are security updates.


Last login: Sun Oct 20 03:54:17 2019 from 10.0.2.2
</details>

Kubernetes has been started during VM provisioning. You can confirm this as follows.
```console
kubectl get nodes
```
<details>
<summary>
 Sample Output
 </summary>
 NAME    STATUS   ROLES    AGE     VERSION
katib   Ready    master   2m15s   v1.14.8
</details>

Start helm and install NFS helm chart. This provides dynamic provisioning for Kubernetes workloads.

```
cd $HOME/tfworld/setup/k8s-config/
./start-helm.sh
 ```
 This will take a couple of minutes.
<details>
<summary>
 Sample Output
 </summary>
serviceaccount/tiller created
clusterrolebinding.rbac.authorization.k8s.io/tiller created
Creating /home/vagrant/.helm
Creating /home/vagrant/.helm/repository
Creating /home/vagrant/.helm/repository/cache
Creating /home/vagrant/.helm/repository/local
Creating /home/vagrant/.helm/plugins
Creating /home/vagrant/.helm/starters
Creating /home/vagrant/.helm/cache/archive
Creating /home/vagrant/.helm/repository/repositories.yaml
Adding stable repo with URL: https://kubernetes-charts.storage.googleapis.com
Adding local repo with URL: http://127.0.0.1:8879/charts
$HELM_HOME has been configured at /home/vagrant/.helm.

Tiller (the Helm server-side component) has been installed into your Kubernetes Cluster.

Please note: by default, Tiller is deployed with an insecure 'allow unauthenticated users' policy.
To prevent this, run `helm init` with the --tiller-tls-verify flag.
For more information on securing your installation see: https://docs.helm.sh/using_helm/#securing-your-helm-installation
Hang tight while we grab the latest from your chart repositories...
...Skip local chart repository
...Successfully got an update from the "stable" chart repository
Update Complete.
NAME:   kf
LAST DEPLOYED: Sun Oct 20 06:56:39 2019
NAMESPACE: kube-system
STATUS: DEPLOYED

RESOURCES:
==> v1/ClusterRole
NAME                       AGE
kf-nfs-server-provisioner  1s

==> v1/ClusterRoleBinding
NAME                       AGE
kf-nfs-server-provisioner  1s

==> v1/Pod(related)
NAME                         READY  STATUS   RESTARTS  AGE
kf-nfs-server-provisioner-0  0/1    Pending  0         1s

==> v1/Service
NAME                       TYPE       CLUSTER-IP     EXTERNAL-IP  PORT(S)                                 AGE
kf-nfs-server-provisioner  ClusterIP  10.100.45.158  <none>       2049/TCP,20048/TCP,51413/TCP,51413/UDP  1s

==> v1/ServiceAccount
NAME                       SECRETS  AGE
kf-nfs-server-provisioner  1        1s

==> v1/StorageClass
NAME  PROVISIONER                              AGE
nfs   cluster.local/kf-nfs-server-provisioner  1s

==> v1beta2/StatefulSet
NAME                       READY  AGE
kf-nfs-server-provisioner  0/1    1s


NOTES:
The NFS Provisioner service has now been installed.

A storage class named 'nfs' has now been created
and is available to provision dynamic volumes.

You can use this storageclass by creating a `PersistentVolumeClaim` with the
correct storageClassName attribute. For example:

    ---
    kind: PersistentVolumeClaim
    apiVersion: v1
    metadata:
      name: test-dynamic-volume-claim
    spec:
      storageClassName: "nfs"
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: 100Mi

</details>

**Congratulations!** Now you have a single node Kubernetes cluster on your laptop. The magic of Kubernetes allows you to run your workloads on this tiny Kubernetes cluster identical to how you would on your production cluster in your datacenter or in a cloud.
