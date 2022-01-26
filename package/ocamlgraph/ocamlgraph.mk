################################################################################
#
# ocamlgraph
#
################################################################################

OCAMLGRAPH_VERSION = 2.0.0
OCAMLGRAPH_SITE = $(call github,backtracking,ocamlgraph,$(OCAMLGRAPH_VERSION))
OCAMLGRAPH_LICENSE = LPGL 2.1
OCAMLGRAPH_LICENSE_FILES = LICENSE
HOST_OCAML_DEPENDENCIES =  host-autoconf  host-ocaml

define HOST_OCAMLGRAPH_CMDS
	(cd $(@D); $(AUTOCONF) && $(HOST_CONFIGURE_OPTS) ./configure )
endef

define HOST_OCAMLGRAPH_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
endef

define HOST_OCAMLGRAPH_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(HOST_DIR)
endef

$(eval $(host-generic-package))