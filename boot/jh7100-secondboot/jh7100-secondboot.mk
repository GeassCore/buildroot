################################################################################
#
# beaglev-secondboot
#
################################################################################

# Commit on the 'starfive' branch
JH7100_SECONDBOOT_VERSION = f93f109c75ee75fe404a710a92eb9bac31eb7ec9
JH7100_SECONDBOOT_SITE = $(call github,starfive-tech,JH7100_secondBoot,$(JH7100_SECONDBOOT_VERSION))
JH7100_SECONDBOOT_INSTALL_TARGET = NO
JH7100_SECONDBOOT_INSTALL_IMAGES = YES
JH7100_SECONDBOOT_DEPENDENCIES = host-riscv64-elf-toolchain
JH7100_SECONDBOOT_LICENSE = GPL-2.0+
JH7100_SECONDBOOT_LICENSE_FILES = LICENSE

define JH7100_SECONDBOOT_BUILD_CMDS
	$(MAKE) -C $(@D)/build \
		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
		SUFFIX=buildroot \
		GIT_VERSION=$(JH7100_SECONDBOOT_VERSION)
endef

define JH7100_SECONDBOOT_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-JH7100-buildroot.bin.out \
		$(BINARIES_DIR)/bootloader-JH7100-buildroot.bin.out
endef

$(eval $(generic-package))
