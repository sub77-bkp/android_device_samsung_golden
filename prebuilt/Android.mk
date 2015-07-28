LOCAL_PATH:= $(call my-dir)

ifeq ($(TARGET_USE_PREBUILT_KERNEL),true)
ifndef BOARD_CUSTOM_BOOTIMG_MK

include $(CLEAR_VARS)

# kernel modules
include $(CLEAR_VARS)
LOCAL_MODULE       := bthid.ko
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := system/lib/modules/bthid.ko
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib/modules
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := dhd.ko
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := system/lib/modules/dhd.ko
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib/modules
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := hwreg.ko
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := system/lib/modules/hwreg.ko
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib/modules
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE       := j4fs.ko
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := system/lib/modules/j4fs.ko
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib/modules
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE       := param.ko
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := system/lib/modules/param.ko
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib/modules
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE       := rng-core.ko
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := system/lib/modules/rng-core.ko
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib/modules
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE       := scsi_wait_scan.ko
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := system/lib/modules/scsi_wait_scan.ko
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib/modules
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE       := vpnclient.ko
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := system/lib/modules/vpnclient.ko
LOCAL_MODULE_PATH  := $(TARGET_OUT)/lib/modules
include $(BUILD_PREBUILT)

endif
endif
