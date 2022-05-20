if test -e ${devtype} ${devnum}:${distro_bootpart} boot/uEnv.txt ; then
    load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} /boot/uEnv.txt
    env import -t $kernel_addr_r $filesize
    run tftpboot
else
    setenv bootargs earlyprintk=sunxi-uart,0x02500000 console=ttyS0,115200 console=tty0 loglevel=8 root=/dev/mmcblk0p4 selinux=0 rootwait
    load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} boot/Image
    booti ${kernel_addr_r} - ${fdt_addr_r}
fi