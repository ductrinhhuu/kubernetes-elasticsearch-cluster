### For new environment setup
[Kubernetes initial setup](https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/)

## Set memlock to unlimited and max open file
Open file `/etc/systemd/system.conf`, uncomment 2 fields `DefaultLimitNOFILE` and `DefaultLimitMEMLOCK`

Open file `/etc/security/limits.conf`, add those lines to the end of file:

```shell
* - nofile 100000
root - nofile 100000
<your-user> - memlock unlimited
```

## Set vm.max_map_count
Open file `/etc/sysctl.conf`, add this line at the end of file:

```shell
vm.max_map_count=300000
```

### Create Persistent Volume (gce Persistent Volume)
This should be included in config file for pod

```shell
kubectl create -f create-pv-master.yaml
kubectl create -f create-pv-data.yaml
```

Let's check if those PV were created successfully and ready for use:

```shell
kubectl get svc,deployment,pods
NAME                         CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
persistentvolume/pv-data     200Gi      RWO            Retain           Available           standard                8s
persistentvolume/pv-master   10Gi      RWO            Retain           Available           standard                11s
```

## Notes

* One should clone create-pv-master.yaml to the number of master-eligible nodes. Similarly to create-pv-data.yaml
