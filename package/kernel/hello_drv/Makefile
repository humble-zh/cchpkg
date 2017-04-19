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
