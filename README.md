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
