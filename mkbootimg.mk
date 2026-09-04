#
# Copyright (C) 2024 TeamWin Recovery Project
#
# Custom mkbootimg rule to generate dt.img and append SEAndroid footer for Samsung Knox bootloader
#

LOCAL_PATH := $(call my-dir)

LZMA_BIN := $(shell which lzma)

# dt.img target for Qualcomm MSM8974
INSTALLED_DTIMAGE_TARGET := $(PRODUCT_OUT)/dt.img

$(INSTALLED_DTIMAGE_TARGET): $(INSTALLED_KERNEL_TARGET)
	@echo -e "--- Generating dt.img for Samsung Galaxy S5 Active ---"
	@mkdir -p $(dir $@)
	@if [ -f $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/dt.img ]; then \
		cp $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/dt.img $@; \
	elif [ -f $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/dtb.img ]; then \
		cp $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/dtb.img $@; \
	elif which dtbToolCM >/dev/null 2>&1; then \
		dtbToolCM -2 -o $@ -s $(BOARD_KERNEL_PAGESIZE) -p $(PRODUCT_OUT)/obj/KERNEL_OBJ/scripts/dtc/ $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/; \
	elif which dtbTool >/dev/null 2>&1; then \
		dtbTool -2 -o $@ -s $(BOARD_KERNEL_PAGESIZE) -p $(PRODUCT_OUT)/obj/KERNEL_OBJ/scripts/dtc/ $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/; \
	else \
		echo "Dummy dt.img fallback"; touch $@; \
	fi

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS) $(INSTALLED_DTIMAGE_TARGET)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --dt $(INSTALLED_DTIMAGE_TARGET) --output $@
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel) \
		$(INSTALLED_DTIMAGE_TARGET)
	@echo -e "--- Making recovery image for Samsung Galaxy S5 Active: $@ ---"
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --dt $(INSTALLED_DTIMAGE_TARGET) --output $@
	@echo -e "--- Appending SEANDROIDENFORCE footer for Samsung bootloader ---"
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
