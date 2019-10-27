# Download Virtualbox Image

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

`vagrant up` downloads the Virtual Box image for this tutorial and powers it on.
This may take 15-20 minutes and at the end of it you will have a single node Kubernetes cluster.