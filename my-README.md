### Create Persistent Volume (gce Persistent Volume)

```shell
kubectl create -f create-pv-master.yaml
kubectl create -f create-pv-data.yaml
```

Let's check if those PV were created successfully and ready for use:

```shell
kubectl get svc,deployment,pods
NNAME                         CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
persistentvolume/pv-data     100Gi      RWO            Retain           Available           standard                8s
persistentvolume/pv-master   100Gi      RWO            Retain           Available           standard                11s
```