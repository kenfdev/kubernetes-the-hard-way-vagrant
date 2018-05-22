# Kubernetes the hard way with vagrant

You can study kubernetes with vagrant. Credits go to the Kinvolk team because this repository is based on https://github.com/kinvolk/kubernetes-the-hard-way-vagrant .

#### Differences with the Kinvolk version atm

* Uses containerd
* Uses gVisor
* The pod-cidr is the same as the tutorial ( `10.200.${i}.0/24` )

## How to  use this repository

* Hit `vagrant up` to bring up the vms (1 load balancer node, 3 controllers nodes , 3 worker nodes)
* Use the `workspace` directory to follow Kelsey Hightower's repository https://github.com/kelseyhightower/kubernetes-the-hard-way
* A few things to care about is
  * `gcloud` commands won't work (of course). Skip everything related to `gcloud` or use an alternative command. Have a look at the `scripts` directory if you get stuck. They correspond with the chapters.
  * `EXTERNAL_IP` , `KUBERNETES_PUBLIC_ADDRESS` would be `10.240.0.40` (the load balancer's ip)
  * [vagrant-scp](https://github.com/invernizzi/vagrant-scp) would come in handy for `scp` commands
  * Careful about `INTERNAL_IP`s and `POD_CIDR` because you cannot fetch them with `gcloud` commands.
  * Be sure to add the `[plugins.cri]` config and `stream_server_address` setting to the `containerd`'s `config.toml`. If you miss this, you won't be able to `exec` in to the container. Have a look at the [script](./scripts/k8s-the-hard-way/0902-configure-containerd.sh) .
* `vagrant destroy -f` when you finish and clean up the `workspace` .



All the scripts inside the `scripts` directory correspond to the commands and chapters mentioned in the tutorial. It uses alternative commands which correspond to `gcloud` commands. This has been tested with [this version](https://github.com/kelseyhightower/kubernetes-the-hard-way/tree/36d4bbf4ad16cbe3c6eb809d9f567c07eaddea8c) of the tutorial.



