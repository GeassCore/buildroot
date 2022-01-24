################################################################################
#
# opam
#
################################################################################

OPAM_VERSION = 2.1.2
OPAM_SITE = $(call github,ocaml,opam,$(OPAM_VERSION))
OPAM_LICENSE = MIT
OPAM_LICENSE_FILES = LICENSE.md

# define HOST_OPAM_CONFIGURE_CMDS
# 	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure)
# endef

define HOST_OPAM_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)  cold CONFIGURE_ARGS="--prefix ~/local"
endef

define HOST_OPAM_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR)  cold-install
endef

$(eval $(host-generic-package))