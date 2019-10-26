# Install Kubernetes

Clone the repository for this workshop.
```console
git clone https://github.com/tfworldkatib/tutorial
cd tutorial
```

Start the Vagrant virtual machine that we will use 
```console
vagrant up
```
<details>
<summary>
 Sample Output
 </summary>
vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'minikatib/tfworld'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'minikatib/tfworld' version '0.2.0' is up to date...
==> default: Setting the name of the VM: tfworld_default_1571554286050_26802
==> default: Fixed port collision for 22 => 2222. Now on port 2200.
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 31230 (guest) => 31230 (host) (adapter 1)
    default: 22 (guest) => 2200 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2200
    default: SSH username: vagrant
    default: SSH auth method: private key
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Mounting shared folders...
    default: /vagrant => /Users/neelimam/minikatib/t3/tfworld
==> default: Running provisioner: shell...
    default: Running: inline script
    default: [init] Using Kubernetes version: v1.14.8
    default: [preflight] Running pre-flight checks
    default: 	[WARNING Service-Docker]: docker service is not enabled, please run 'systemctl enable docker.service'
    default: 	[WARNING IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd". Please follow the guide at https://kubernetes.io/docs/setup/cri/
    default: [preflight] Pulling images required for setting up a Kubernetes cluster
    default: [preflight] This might take a minute or two, depending on the speed of your internet connection
    default: [preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
    default: [kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
    default: [kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
    default: [kubelet-start] Activating the kubelet service
    default: [certs] Using certificateDir folder "/etc/kubernetes/pki"
    default: [certs] Generating "ca" certificate and key
    default: [certs] Generating "apiserver" certificate and key
    default: [certs] apiserver serving cert is signed for DNS names [katib kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 10.0.2.15]
    default: [certs] Generating "apiserver-kubelet-client" certificate and key
    default: [certs] Generating "front-proxy-ca" certificate and key
    default: [certs] Generating "front-proxy-client" certificate and key
    default: [certs] Generating "etcd/ca" certificate and key
    default: [certs] Generating "etcd/server" certificate and key
    default: [certs] etcd/server serving cert is signed for DNS names [katib localhost] and IPs [10.0.2.15 127.0.0.1 ::1]
    default: [certs] Generating "etcd/peer" certificate and key
    default: [certs] etcd/peer serving cert is signed for DNS names [katib localhost] and IPs [10.0.2.15 127.0.0.1 ::1]
    default: [certs] Generating "etcd/healthcheck-client" certificate and key
    default: [certs] Generating "apiserver-etcd-client" certificate and key
    default: [certs] Generating "sa" key and public key
    default: [kubeconfig] Using kubeconfig folder "/etc/kubernetes"
    default: [kubeconfig] Writing "admin.conf" kubeconfig file
    default: [kubeconfig] Writing "kubelet.conf" kubeconfig file
    default: [kubeconfig] Writing "controller-manager.conf" kubeconfig file
    default: [kubeconfig] Writing "scheduler.conf" kubeconfig file
    default: [control-plane] Using manifest folder "/etc/kubernetes/manifests"
    default: [control-plane] Creating static Pod manifest for "kube-apiserver"
    default: [control-plane] Creating static Pod manifest for "kube-controller-manager"
    default: [control-plane] Creating static Pod manifest for "kube-scheduler"
    default: [etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
    default: [wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
    default: [apiclient] All control plane components are healthy after 36.003972 seconds
    default: [upload-config] storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
    default: [kubelet] Creating a ConfigMap "kubelet-config-1.14" in namespace kube-system with the configuration for the kubelets in the cluster
    default: [upload-certs] Skipping phase. Please see --experimental-upload-certs
    default: [mark-control-plane] Marking the node katib as control-plane by adding the label "node-role.kubernetes.io/master=''"
    default: [mark-control-plane] Marking the node katib as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
    default: [bootstrap-token] Using token: 6cvjk2.7kwbwb0oedxmmxnf
    default: [bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
    default: [bootstrap-token] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
    default: [bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
    default: [bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
    default: [bootstrap-token] creating the "cluster-info" ConfigMap in the "kube-public" namespace
    default: [addons] Applied essential addon: CoreDNS
    default: [addons] Applied essential addon: kube-proxy
    default:
    default: Your Kubernetes control-plane has initialized successfully!
    default:
    default: To start using your cluster, you need to run the following as a regular user:
    default:
    default:   mkdir -p $HOME/.kube
    default:   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    default:   sudo chown $(id -u):$(id -g) $HOME/.kube/config
    default:
    default: You should now deploy a pod network to the cluster.
    default: Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
    default:   https://kubernetes.io/docs/concepts/cluster-administration/addons/
    default:
    default: Then you can join any number of worker nodes by running the following on each as root:
    default:
    default: kubeadm join 10.0.2.15:6443 --token 6cvjk2.7kwbwb0oedxmmxnf \
    default:     --discovery-token-ca-cert-hash sha256:081c1fe5d9e42a8d2c85ffc7465a3b606d8ae90e7511861cb7eeba3397a7e3f5
    default: node/katib untainted
    default: configmap/kube-router-cfg created
    default: daemonset.apps/kube-router created
    default: serviceaccount/kube-router created
    default: clusterrole.rbac.authorization.k8s.io/kube-router created
    default: clusterrolebinding.rbac.authorization.k8s.io/kube-router created
    default: persistentvolume/data-kf-nfs-server-provisioner-0 created
</details>

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
