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

## Install K3s

Disabled Traefik

## Deploy BigBang

## Install Kubevirt

```bash
kubectl install -f manifests/operator
```

## VM Setup

```bash


dnf install tigervnc

[fedora@tom log]$ cat /etc/tigervnc/vncserver.users
# TigerVNC User assignment
#
# This file assigns users to specific VNC display numbers.
# The syntax is <display>=<username>. E.g.:
#
# :2=andrew
# :3=lisa
:2=fedora
:4=fedora

$ vncpasswd
$ vncserver :4 -geometry 1280x1040
```

## BB installation

Assumptions:

- Local kubectl access to an existing cluster
- Local installation of [helm](https://helm.sh/docs/intro/install/)
- Local copy of the [bigbang repository](https://repo1.dso.mil/platform-one/big-bang/bigbang)
- Valid ironbank creds

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
