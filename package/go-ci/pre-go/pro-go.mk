################################################################################
#
# go-bootstrap
#
################################################################################
PRE_GO_VERSION = 1.16.5
PRE_GO_SITE = https://storage.googleapis.com/golang
PRE_GO_SOURCE = go$(PRE_GO_VERSION).linux-amd64.tar.gz

PRE_GO_LICENSE = BSD-3-Clause
PRE_GO_LICENSE_FILES = LICENSE

define PRE_GO_INSTALL_TARGET_CMDS
	mkdir -p $(PRE_GO_INSTALL)
	cp -a $(@D) $(HOST_PRE_GO_ROOT)
endef

$(eval $(generic-package))