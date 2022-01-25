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
	# $(HOST_MAKE_ENV) CAML_LD_LIBRARY_PATH=/usr/bin/make
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) release DESTDIR_ARG=$(HOST_DIR)
endef

define HOST_OCAML_DUNE_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR_ARG=$(HOST_DIR)
endef

$(eval $(host-generic-package))