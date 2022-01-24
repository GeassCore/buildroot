################################################################################
#
# ocaml find
#
################################################################################

OCAML_FIND_VERSION = 1.9.2
OCAML_FIND_SOURCE = findlib-$(OCAML_FIND_VERSION).tar.gz
OCAML_FIND_SITE = http://download.camlcity.org/download
OCAML_FIND_LICENSE = LGPL-2.1
OCAML_FIND_LICENSE_FILES = LICENSE
OCAML_FIND_DEPENDENCIES = host-ocaml

define HOST_OCAML_FIND_CONFIGURE_CMDS
	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure)
endef

define HOST_OCAML_FIND_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
endef

define HOST_OCAML_FIND_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
endef

$(eval $(host-generic-package))