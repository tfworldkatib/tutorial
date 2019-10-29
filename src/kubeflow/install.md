# Install Kubeflow

### Download kfctl

<details>
<summary>
Do the following on Max OS X
</summary>

```console
curl -L -O https://github.com/kubeflow/kubeflow/releases/download/v0.7.0-rc.6/kfctl_v0.7.0-rc.5-7-gc66ebff3_darwin.tar.gz
tar xf kfctl_v0.7.0-rc.5-7-gc66ebff3_darwin.tar.gz
mv kfctl-darwin /usr/local/bin/kfctl
```
</details>

<details>
<summary>
Do the following on Linux
</summary>

```console
curl -L -O https://github.com/kubeflow/kubeflow/releases/download/v0.7.0-rc.6/kfctl_v0.7.0-rc.5-7-gc66ebff3_linux.tar.gz
tar xf kfctl_v0.7.0-rc.5-7-gc66ebff3_linux.tar.gz
sudo mv kfctl /usr/local/bin/kfctl
 ```

</details>

### Create Kubeflow Configuration

```console
export KF_DIR=kubeflow-install
mkdir $KF_DIR
cd $KF_DIR

export CONFIG_FILE=https://raw.githubusercontent.com/kubeflow/manifests/master/kfdef/kfctl_k8s_istio.yaml
kfctl apply -V -f $CONFIG_FILE
```

Connect to Kubeflow Central Dashboard

```console
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath={.items[0].status.hostIP})
echo http://$INGRESS_HOST:$INGRESS_PORT

```