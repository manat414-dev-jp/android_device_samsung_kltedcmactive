LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libinit_kltedcmactive
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := \
    system/core/init \
    device/samsung/msm8974-common/init

LOCAL_SRC_FILES := init_klte.cpp

LOCAL_SHARED_LIBRARIES := \
    libbase

include $(BUILD_STATIC_LIBRARY)
