#
# Top level makefile for example application
#

include $(TOPDIR)/rules.mk

PKG_NAME:=socket_s
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk
 
define Package/socket_s
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=socket_s -- Socket server 1 to 99
endef
 
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef
 
define Build/Configure
endef
 
TARGET_CFLAGS += $(FPIC)

define Package/socket_s/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/socket_s $(1)/bin/
endef
 
$(eval $(call BuildPackage,socket_s))
