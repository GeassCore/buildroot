################################################################################
#
# go-bootstrap
#
################################################################################
GOBOOTSTRAP_TAR_VERSION = 1.16.5
GOBOOTSTRAP_TAR_SITE = https://storage.googleapis.com/golang
GOBOOTSTRAP_TAR_SOURCE = go$(GOBOOTSTRAP_TAR_VERSION).src.tar.gz

GOBOOTSTRAP_TAR_LICENSE = BSD-3-Clause
GOBOOTSTRAP_TAR_LICENSE_FILES = LICENSE

HOST_GOBOOTSTRAP_TAR_MAKE_ENV = \
	GOOS=linux \
	GOROOT_BOOTSTRAP="$(HOST_PRE_GO_ROOT)" \
	GOARCH=riscv64  \
	CGO_ENABLED=0

define GOBOOTSTRAP_TAR_BUILD_CMDS
	cd $(@D)/src && $(HOST_GOBOOTSTRAP_TAR_MAKE_ENV) ./bootstrap.bash
endef

define GOBOOTSTRAP_TAR_INSTALL_TARGET_CMDS
	mkdir -p $(HOST_GOBOOTSTRAP_TAR_ROOT)
	cp -a $(@D)/../go-linux-riscv64-bootstrap.tbz $(HOST_GOBOOTSTRAP_TAR_ROOT)/
	cp $(TOPDIR)/dl/gobootstrap-tar/go$(GOBOOTSTRAP_TAR_VERSION).src.tar.gz  $(HOST_GOBOOTSTRAP_TAR_ROOT)/
	rm $(@D)/../go-linux-riscv64-bootstrap.tbz
	rm $(@D)/../go-linux-riscv64-bootstrap -rf
endef

$(eval $(generic-package))
