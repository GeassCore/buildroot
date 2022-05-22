################################################################################
#
# beaglev-ddrinit
#
################################################################################

# Commit on the 'starfive' branch
JH7100_DDRINIT_VERSION = 58c9b60eb3a3b060e98ea2333a0ca6fe77d02472
JH7100_DDRINIT_SITE = $(call github,starfive-tech,JH7100_ddrinit,$(JH7100_DDRINIT_VERSION))
JH7100_DDRINIT_INSTALL_TARGET = NO
JH7100_DDRINIT_INSTALL_IMAGES = YES
JH7100_DDRINIT_DEPENDENCIES = host-riscv64-elf-toolchain
JH7100_DDRINIT_LICENSE = GPL-2.0+
JH7100_DDRINIT_LICENSE_FILES = LICENSE

define JH7100_DDRINIT_BUILD_CMDS
	$(MAKE) -C $(@D)/build \
		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
		SUFFIX=buildroot \
		GIT_VERSION=$(JH7100_DDRINIT_VERSION)
endef

define JH7100_DDRINIT_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 $(@D)/build/ddrinit-2133-buildroot.bin.out \
		$(BINARIES_DIR)/ddrinit-2133-buildroot.bin.out
endef

$(eval $(generic-package))
