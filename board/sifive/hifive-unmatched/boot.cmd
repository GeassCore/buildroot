if test -e mmc 0:3 boot/uEnv.txt ; then
    load mmc 0:3 ${kernel_addr_r} /boot/uEnv.txt
    env import -t $kernel_addr_r $filesize
    run tftpboot
else
    setenv bootargs earlycon=sbi root=/dev/mmcblk0p3 rootwait
    load mmc 0:3 ${kernel_addr_r} boot/Image
    load mmc 0:3 ${fdt_addr_r} boot/hifive-unmatched-a00.dtb
    booti ${kernel_addr_r} - ${fdt_addr_r}
fi