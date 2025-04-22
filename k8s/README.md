## Short Introduction to ``minkikube``

This is a simple demonstration of how to start using ``minikube``

Let's first start the ``minikube`` cluster running:

```
minikube start
```

Next, we will use DSC to bring the cluster into compliance with the 
roles required:

```
kubectl apply -f rbac.yml
```

The next step is to bring up the appropriate container and service using
the yaml file ``gold.yml``


```
kubectl apply -f gold.yml
```

We can now review the state of the pods and services using the command

```
kubectl get pods -A

```

and we will get the following output:

```
NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
default       goldpinger-9b5d75686-j2czc         1/1     Running   0               3m1s
default       goldfinger-9b5d75686-lkjhg         1/1     Running   0               3m1s
default       goldpinger-9b5d75686-p9qft         1/1     Running   0               3m1s
kube-system   coredns-787d4945fb-6j6jq           1/1     Running   0               3m20s
kube-system   etcd-minikube                      1/1     Running   0               3m31s
kube-system   kube-apiserver-minikube            1/1     Running   0               3m31s
kube-system   kube-controller-manager-minikube   1/1     Running   0               3m31s
kube-system   kube-proxy-g98sr                   1/1     Running   0               3m20s
kube-system   kube-scheduler-minikube            1/1     Running   0               3m31s
kube-system   storage-provisioner                1/1     Running   1 (2m49s ago)   3m30s
```

Next, we get a list of the services running on the cluster using this command:

```
kubectl get services
```

This should give us the following output:

```
NAME         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
goldpinger   LoadBalancer   10.106.214.186   <pending>     8080:31162/TCP   4m16s
kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          4m49s
```

Because we want to attach to the ``goldpinger`` service, we need to start the port-forwarder
running. To this, just run the file provided:

```
./port-fwd.sh &
```

Now we can attach to the cluster using the default GCP web-preview tool, listening on port 8080.
Let's review the cluster now

