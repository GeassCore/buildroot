################################################################################
#
# ocaml-menhir
#
################################################################################

OCAML_MENHIR_VERSION = 20211230
OCAML_MENHIR_SITE = https://gitlab.inria.fr/fpottier/menhir
OCAML_MENHIR_LICENSE = LGPL-2.1
OCAML_MENHIR_LICENSE_FILES = LICENSE
OCAML_MENHIR_DEPENDENCIES = host-ocaml host-ocaml-dune

define HOST_OCAML_MENHIR_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
endef

define HOST_OCAML_MENHIR_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
endef

$(eval $(host-generic-package))