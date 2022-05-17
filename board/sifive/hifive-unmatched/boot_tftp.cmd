setenv bootargs console=ttySIF0,115200 rootwait init=/sbin/init root=/dev/nfs  rw nfsroot=192.168.1.34:/opt/nfs_root,v3,tcp,nolock ip=192.168.1.100
setenv serverip 192.168.1.34
setenv ipaddr 192.168.1.100
tftp ${kernel_addr_r} unmatched/Image
tftp ${fdt_addr_r} unmatched/hifive-unmatched-a00.dtb
booti ${kernel_addr_r} - ${fdt_addr_r}