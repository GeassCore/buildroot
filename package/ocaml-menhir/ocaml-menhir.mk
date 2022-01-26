################################################################################
#
# ocaml-menhir
#
################################################################################

OCAML_MENHIR_VERSION = master
OCAML_MENHIR_SOURCE = menhir-$(OCAML_MENHIR_VERSION).tar.gz
OCAML_MENHIR_SITE = https://gitlab.inria.fr/fpottier/menhir/-/archive/$(OCAML_MENHIR_VERSION)
OCAML_MENHIR_LICENSE = LGPL-2.1
OCAML_MENHIR_LICENSE_FILES = LICENSE
OCAML_MENHIR_DEPENDENCIES = host-ocaml host-ocaml-dune

define HOST_OCAML_MENHIR_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all DESTDIR=$(HOST_DIR)
endef

define HOST_OCAML_MENHIR_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(HOST_DIR)
endef

$(eval $(host-generic-package))