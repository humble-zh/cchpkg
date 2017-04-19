# hello_drv

```Bash
humble@humble-pc:~/lede$ cat package/kernel/hello_drv/Makefile 
#
# Copyright (C) 2008-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=hello_drv
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/hello_drv
  SUBMENU:=Other modules
  TITLE:=I am an hello driver.
  FILES:=$(PKG_BUILD_DIR)/hello_drv.ko
  KCONFIG:=
endef

define KernelPackage/hello_drv/description
  This is an example for the drivers which is builded-in kernel:
    I am just an hello_drv.
endef

MAKE_OPTS:= \
ARCH="$(LINUX_KARCH)" \
CROSS_COMPILE="$(TARGET_CROSS)" \
SUBDIRS="$(PKG_BUILD_DIR)"

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
	$(MAKE_OPTS) \
	modules
endef

$(eval $(call KernelPackage,hello_drv))
humble@humble-pc:~/lede$ 
humble@humble-pc:~/lede$ 
humble@humble-pc:~/lede$ cat package/kernel/hello_drv/src/hello_drv.c 
#include <linux/module.h>
#include <linux/version.h>
#include <linux/kmod.h>

static int __init hello_drv_init(void)
{
	printk("Calling hello_drv_init\n");
	printk("Hello,I am an hello driver on OpenWrt!\n");
	return 0;
}

static void __exit hello_drv_exit(void)
{
	printk("Calling hello_drv_exit\n");
}

module_init(hello_drv_init);
module_exit(hello_drv_exit);

MODULE_AUTHOR("Humble");
MODULE_LICENSE("GPL");
humble@humble-pc:~/lede$ 
humble@humble-pc:~/lede$ 
humble@humble-pc:~/lede$ cat package/kernel/hello_drv/src/Makefile 
obj-m += hello_drv.o
humble@humble-pc:~/lede$ 
humble@humble-pc:~/lede$ ./scripts/feeds install -a
humble@humble-pc:~/lede$ make menuconfig
	Kernel modules  --->
		Other modules  --->
		        <M> kmod-hello_drv
humble@humble-pc:~/lede$ make package/kernel/hello_drv/compile V=99
humble@humble-pc:~/lede$ find bin/ -name kmod-hello*
bin/targets/ar71xx/generic/packages/kmod-hello_drv_4.4.61-1_mips_24kc.ipk
humble@humble-pc:~/lede$ scp bin/targets/ar71xx/generic/packages/kmod-hello_drv_4.4.61-1_mips_24kc.ipk root@192.168.1.1:/tmp
root@192.168.1.1's password: 
kmod-hello_drv_4.4.61-1_mips_24kc.ipk         100% 1498     1.5KB/s   00:00    
humble@humble-pc:~/lede$ 
humble@humble-pc:~/lede$ ssh -l root 192.168.1.1
root@192.168.1.1's password: 


BusyBox v1.25.1 () built-in shell (ash)

     _________
    /        /\      _    ___ ___  ___
   /  LE    /  \    | |  | __|   \| __|
  /    DE  /    \   | |__| _|| |) | _|
 /________/  LE  \  |____|___|___/|___|                      lede-project.org
 \        \   DE /
  \    LE  \    /  -----------------------------------------------------------
   \  DE    \  /    Reboot (17.01-SNAPSHOT, r3316-7eb58cf)
    \________\/    -----------------------------------------------------------

root@LEDE:~# opkg install /tmp/kmod-hello_drv_4.4.61-1_mips_24kc.ipk 
Installing kmod-hello_drv (4.4.61-1) to root...
Configuring kmod-hello_drv.
root@LEDE:~# 
root@LEDE:~# 
root@LEDE:~# find / -name *hello*.ko
/lib/modules/4.4.61/hello_drv.ko
/overlay/upper/lib/modules/4.4.61/hello_drv.ko
root@LEDE:~# 
root@LEDE:~# insmod /lib/modules/4.4.61/hello_drv.ko 
root@LEDE:~# lsmod | grep "hello_drv"
hello_drv                528  0 
root@LEDE:~# 
root@LEDE:~# rmmod hello_drv
root@LEDE:~# dmesg | tail -n3
[ 1796.590191] Calling hello_drv_init
[ 1796.593901] Hello,I am an hello driver on OpenWrt!
[ 1849.910418] Calling hello_drv_exit
root@LEDE:~# 
root@LEDE:~# opkg remove kmod-hello_drv
Removing package kmod-hello_drv from root...
root@LEDE:~# exit
Connection to 192.168.1.1 closed.
humble@humble-pc:~$ 
```
