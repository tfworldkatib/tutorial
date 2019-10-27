# Installation



Let us start with the install of Katib.
```
cd $HOME
git clone https://github.com/tfworldkatib/tutorial.git
cd $HOME/tutorial/setup/katib-install
./deploy.sh
```

<details>
<summary>
 Sample Output
 </summary>
 ```
 + kubectl apply -f v1alpha3
namespace/kubeflow created
+ kubectl apply -f v1alpha3/katib-controller
customresourcedefinition.apiextensions.k8s.io/experiments.kubeflow.org created
customresourcedefinition.apiextensions.k8s.io/suggestions.kubeflow.org created
customresourcedefinition.apiextensions.k8s.io/trials.kubeflow.org created
configmap/katib-config created
deployment.apps/katib-controller created
clusterrole.rbac.authorization.k8s.io/katib-controller created
serviceaccount/katib-controller created
clusterrolebinding.rbac.authorization.k8s.io/katib-controller created
secret/katib-controller created
service/katib-controller created
configmap/trial-template created
+ kubectl apply -f v1alpha3/manager
deployment.extensions/katib-manager created
service/katib-manager created
+ kubectl apply -f v1alpha3/pv
persistentvolume/katib-mysql created
persistentvolumeclaim/katib-mysql created
+ kubectl apply -f v1alpha3/db
deployment.extensions/katib-db created
secret/katib-db-secrets created
service/katib-db created
+ kubectl apply -f v1alpha3/ui
deployment.extensions/katib-ui created
clusterrole.rbac.authorization.k8s.io/katib-ui created
serviceaccount/katib-ui created
clusterrolebinding.rbac.authorization.k8s.io/katib-ui created
service/katib-ui created
+ kubectl apply -f tf-job
customresourcedefinition.apiextensions.k8s.io/tfjobs.kubeflow.org created
serviceaccount/tf-job-dashboard created
serviceaccount/tf-job-operator created
clusterrole.rbac.authorization.k8s.io/kubeflow-tfjobs-admin created
clusterrole.rbac.authorization.k8s.io/kubeflow-tfjobs-edit created
clusterrole.rbac.authorization.k8s.io/kubeflow-tfjobs-view created
clusterrole.rbac.authorization.k8s.io/tf-job-operator created
clusterrolebinding.rbac.authorization.k8s.io/tf-job-operator created
service/tf-job-operator created
deployment.apps/tf-job-operator created
+ kubectl apply -f pytorch
customresourcedefinition.apiextensions.k8s.io/pytorchjobs.kubeflow.org created
serviceaccount/pytorch-operator created
clusterrole.rbac.authorization.k8s.io/kubeflow-pytorchjobs-admin created
clusterrole.rbac.authorization.k8s.io/kubeflow-pytorchjobs-edit created
clusterrole.rbac.authorization.k8s.io/kubeflow-pytorchjobs-view created
clusterrole.rbac.authorization.k8s.io/pytorch-operator created
clusterrolebinding.rbac.authorization.k8s.io/pytorch-operator created
service/pytorch-operator created
deployment.apps/pytorch-operator created
```
 </details>

Check that the Katib core components are installed and ready.
```
 kubectl -n kubeflow get pods
 ```

<details>
<summary>
 Sample Output
 </summary>
 
```
NAME                                READY   STATUS    RESTARTS   AGE
katib-controller-7665868558-nfghw   1/1     Running   1          80s
katib-db-594756f779-dxttq           1/1     Running   0          81s
katib-manager-769b7bcbfb-7vvgx      1/1     Running   0          81s
katib-ui-854969c97-tl4wg            1/1     Running   0          79s
pytorch-operator-794899d49b-ww59g   1/1     Running   0          79s
tf-job-operator-7b589f5f5f-fpr2p    1/1     Running   0          80s
```
</details>

`katib-controller`, `katib-manager`, `katib-db` and `katib-ui` are the core components of Katib.
We have also installed a `tf-job-operator` and `pytorch-operator` to be able to run TensorFlow Jobs and PyTorch Jobs.

You can access Katib UI [here](http://localhost:31230/katib/). If you are running on a non-Vagrant Kubernetes Cluster, you may need to use the Node IP for your VM or change the katib-ui service to use a LoadBalancer.