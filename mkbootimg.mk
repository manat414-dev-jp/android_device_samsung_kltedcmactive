#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

## Build and append device tree table
DTB_BIN := $(PRODUCT_OUT)/dt.img
$(DTB_BIN): $(INSTALLED_KERNEL_TARGET)
	@echo "Generating device tree binary table $(DTB_BIN)"
	$(call pretty,"Target dt image: $(DTB_BIN)")
	$(HOST_OUT_EXECUTABLES)/dtbToolCM$(HOST_EXECUTABLE_SUFFIX) $(BOARD_KERNEL_SEPARATED_DT) -o $(DTB_BIN) -s $(BOARD_KERNEL_PAGESIZE) -p $(KERNEL_OUT)/scripts/dtc/ $(KERNEL_OUT)/arch/arm/boot/dts/
	@echo "Made DT image: $(DTB_BIN)"

## Custom boot image rule with appended DT table
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS) $(DTB_BIN)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --dt $(DTB_BIN) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo "Made boot image: $@"

## Custom recovery image rule with appended DT table
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_FILES) $(RECOVERYIMAGE_EXTRA_DEPS) $(DTB_BIN)
	$(call pretty,"Target recovery image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) --dt $(DTB_BIN) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo "Made recovery image: $@"
