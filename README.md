# kubevirt

## Onhost:

```bash

$ sudo apt install libvirt-clients
ubuntu@ip-10-0-1-199:~$  virt-host-validate qemu
  QEMU: Checking for hardware virtualization                                 : FAIL (Only emulated CPUs are available, performance will be significantly limited)
  QEMU: Checking if device /dev/vhost-net exists                             : PASS
  QEMU: Checking if device /dev/net/tun exists                               : PASS
  QEMU: Checking for cgroup 'cpu' controller support                         : PASS
  QEMU: Checking for cgroup 'cpuacct' controller support                     : PASS
  QEMU: Checking for cgroup 'cpuset' controller support                      : PASS
  QEMU: Checking for cgroup 'memory' controller support                      : PASS
  QEMU: Checking for cgroup 'devices' controller support                     : PASS
  QEMU: Checking for cgroup 'blkio' controller support                       : PASS
WARN (Unknown if this platform has IOMMU support)
  QEMU: Checking for secure guest support                                    : WARN (Unknown if this platform has Secure Guest support)
$ sudo apt install qemu-kvm
```

## BB installation
Assumptions:
* Local kubectl access to an existing cluster
* Local installation of [helm](https://helm.sh/docs/intro/install/)
* Local copy of the [bigbang repository](https://repo1.dso.mil/platform-one/big-bang/bigbang)
* Valid ironbank creds


1. CD to the bigbang repository root directory 
2. Create a local values file to store your ironbank credentials (`<local_creds_file>`) for bigbang in the format:
```
registryCredentials:
- registry: registry1.dso.mil
  username: <username>
  password: <token>
```
3. Create the bigbang namespace `kubectl create ns bigbang`
4. Install flux: `./scripts/install_flux.sh -u <ironbank_user> -p <ironbank_token>`
5. Install the helm release: `helm upgrade -i bigbang chart -n bigbang -f <local_creds_file> -f <path_to_bigbang-values.yaml>`
6. ...
7. Profit?