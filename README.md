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
