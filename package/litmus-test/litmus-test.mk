################################################################################
#
# litmus test
#
################################################################################

LITMUS_TEST_VERSION = master
LITMUS_TEST_SITE = $(call github,litmus-tests,litmus-tests-riscv,$(LITMUS_TEST_VERSION))
LITMUS_TEST_LICENSE = BSD-2-Clause
LITMUS_TEST_LICENSE_FILES = LICENCE
LITMUS_TEST_DEPENDENCIES = host-herdtools7

define LITMUS_TEST_BUILD_CMDS
	(cd $(@D) ;$(HOST_MAKE_ENV) $(MAKE) hw-tests CORES=4 GCC="$(TARGET_CC)")
	# ls $(LINUX_DIR)/tools/memory-model/
	# mkdir -p $(@D)/klitmus
	# $(HOST_DIR)/usr/bin/klitmus7 -o $(@D)/klitmus $(LINUX_DIR)/tools/memory-model/litmus-tests/SB+fencembonceonces.litmus
endef

define LITMUS_TEST_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/litmus
	$(INSTALL) -m 0755 $(@D)/hw-tests/run.exe $(TARGET_DIR)/usr/bin/litmus/run.exe
	$(INSTALL) -m 0755 $(@D)/hw-tests/run.sh $(TARGET_DIR)/usr/bin/litmus/run.sh
endef


$(eval $(generic-package))
