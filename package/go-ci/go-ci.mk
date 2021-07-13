################################################################################
#
# go-bootstrap
#
################################################################################

PRE_GO_INSTALL = $(HOST_DIR)/usr/local
HOST_PRE_GO_ROOT = $(PRE_GO_INSTALL)/go
HOST_GOBOOTSTRAP_TAR_ROOT = $(TARGET_DIR)/ci/go

include $(sort $(wildcard package/go-ci/pre-go/*.mk))
include $(sort $(wildcard package/go-ci/gobootstrap-tar/*.mk))