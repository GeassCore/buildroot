################################################################################
#
# herdtools7
#
################################################################################

HERDTOOLS7_VERSION = 2.8.0
HERDTOOLS7_SITE = $(call github,herd,herdtools7,$(OCAML_DUNE_VERSION))
HERDTOOLS7_LICENSE = MIT
HERDTOOLS7_LICENSE_FILES = LICENSE.txt

define HOST_HERDTOOLS7_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
endef

define HOST_HERDTOOLS7_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
endef

$(eval $(host-generic-package))