################################################################################
#
# ocaml-dune
#
################################################################################

OCAML_DUNE_VERSION = 2.8.0
OCAML_DUNE_SITE = $(call github,ocaml,dune,$(OCAML_DUNE_VERSION))
OCAML_DUNE_LICENSE = MIT
OCAML_DUNE_LICENSE_FILES = LICENSE.md

define HOST_OCAML_DUNE_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) release
endef

define HOST_OCAML_DUNE_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
endef

$(eval $(host-generic-package))