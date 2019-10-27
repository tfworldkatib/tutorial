# Cleanup

Deleting the vagrant VM

Go to the folder where you ran git clone in [Step 1.3](../prereqs/download.html).
```console
vagrant destroy
```

Get the list of Virtual Box VMs
```console
vboxmanage list vms
```

Delete any unused VMs.
```console
vboxmanage unregistervm <vmid from the previous step> --delete
```