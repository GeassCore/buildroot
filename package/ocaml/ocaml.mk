################################################################################
#
# ocaml
#
################################################################################

OCAML_VERSION = 4.13.0
OCAML_SOURCE = ocaml-$(OCAML_VERSION).tar.xz
OCAML_SITE = https://caml.inria.fr/pub/distrib/ocaml-4.13
OCAML_LICENSE = LGPL-2.1
OCAML_LICENSE_FILES = LICENSE

HOST_OCAML_DEPENDENCIES = \
	toolchain

define HOST_OCAML_CONFIGURE_CMDS
	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure)
endef

define HOST_OCAML_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) world.opt
endef

define HOST_OCAML_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
endef

$(eval $(host-generic-package))