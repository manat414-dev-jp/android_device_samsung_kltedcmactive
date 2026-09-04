#
# Copyright (C) 2024 TeamWin Recovery Project
#
# Custom mkbootimg rule to append SEAndroid footer for Samsung Knox bootloader
#

LZMA_BIN := $(shell which lzma)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e "--- Making recovery image for Samsung Galaxy S5 Active: $@ ---"
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo -e "--- Appending SEANDROIDENFORCE footer for Samsung bootloader ---"
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
