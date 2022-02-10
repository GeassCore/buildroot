################################################################################
#
# litmus test
#
################################################################################

LITMUS_TEST_VERSION = master
LITMUS_TEST_SITE = $(call github,litmus-tests,litmus-tests-riscv,$(LITMUS_TEST_VERSION))
LITMUS_TEST_LICENSE = BSD-2-Clause
LITMUS_TEST_LICENSE_FILES = LICENCE
LITMUS_TEST_DEPENDENCIES = host-herdtools7 linux

KLITMUS_DIR = $(LINUX_DIR)/tools/memory-model/litmus-tests
KLITMUS_FILES = $(notdir $(wildcard $(KLITMUS_DIR)/*.litmus))
KLITMUS_NAMES = $(KLITMUS_FILES:%.litmus=%)

define LITMUS_TEST_BUILD_CMDS
	(cd $(@D) ;$(HOST_MAKE_ENV) $(MAKE) hw-tests CORES=4 GCC="$(TARGET_CC)")
	mkdir -p $(@D)/klitmus
	# $(HOST_DIR)/usr/bin/klitmus7 -o $(@D)/klitmus $(LINUX_DIR)/tools/memory-model/litmus-tests/SB+fencembonceonces.litmus
	$(foreach f, $(KLITMUS_NAMES), \
		@echo $(f)
		mkdir -p $(@D)/klitmus/$(f)
		$(HOST_DIR)/usr/bin/klitmus7 -o $(@D)/klitmus/$(f) $(KLITMUS_DIR)/$(f).litmus
		sed -i 's:/lib/modules/$$(shell uname -r)/build:$(LINUX_DIR):g' $(@D)/klitmus/$(f)/Makefile
		sed -i '2,3d' $(@D)/klitmus/$(f)/Makefile
		sed -i '3,6d' $(@D)/klitmus/$(f)/Makefile
		(cd $(@D)/klitmus/$(f); $(LINUX_MAKE_ENV) $(MAKE) ARCH=riscv CROSS_COMPILE="$(TARGET_CROSS)"; cd $(@D))
	)
endef

define LITMUS_TEST_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/litmus
	$(INSTALL) -m 0755 $(@D)/hw-tests/run.exe $(TARGET_DIR)/usr/bin/litmus/run.exe
	$(INSTALL) -m 0755 $(@D)/hw-tests/run.sh $(TARGET_DIR)/usr/bin/litmus/run.sh
	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/klitmus
	$(foreach f, $(KLITMUS_NAMES), \
		mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/klitmus/$(f)
		$(INSTALL) -m 0755 $(@D)/klitmus/$(f)/litmus000.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/klitmus/$(f)/litmus000.ko
	)
endef

$(eval $(generic-package))
