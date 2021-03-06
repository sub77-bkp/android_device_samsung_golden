#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
# Copyright (C) 2014 Stefan Berger (s.berger81@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_SPECIFIC_HEADER_PATH := device/samsung/golden/include
PRODUCT_VENDOR_KERNEL_HEADERS := device/samsung/golden/kernel-headers
TARGET_OTA_ASSERT_DEVICE := golden,i8190,GT-I8190,goldenxx

# Board
TARGET_BOOTLOADER_BOARD_NAME := DB8520H
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform 
TARGET_BOARD_PLATFORM := montblanc
TARGET_SOC := u8500
BOARD_USES_STE_HARDWARE := true
BOARD_USES_STE_SAMSUNG_HARDWARE := true
TARGET_NEEDS_NON_PIE_SUPPORT := true
COMMON_GLOBAL_CFLAGS += -DSTE_HARDWARE -DSTE_SAMSUNG_HARDWARE
COMMON_GLOBAL_CPPFLAGS += -DSTE_HARDWARE -DSTE_SAMSUNG_HARDWARE

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_NEON := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5064622080
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# F2FS filesystem
TARGET_USERIMAGES_USE_F2FS := true

# Ramdisk
TARGET_PROVIDES_ENVIRON_RC := true

# Kernel
ifneq ($(TARGET_USE_PREBUILT_KERNEL),true)
TARGET_KERNEL_CONFIG := slim_golden_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/golden
endif
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/golden/shbootimg.mk
BOARD_KERNEL_CMDLINE := "androidboot.selinux=permissive"
TARGET_USE_ST_ERICSSON_KERNEL := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
TARGET_NOT_USE_GZIP_RECOVERY_RAMDISK := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/golden/configs/lib/egl/egl.cfg
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH -DWORKAROUND_BUG_10194508
BOARD_EGL_NEEDS_LEGACY_FB := true
# reduce PB size from 2MB to 512KB
BOARD_EGL_SYSTEMUI_PBSIZE_HACK :=true

# Screen
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Camera
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Generic BLN
BOARD_HAVE_GENERIC_BLN := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
BOARD_NO_APSME_ATTR := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/golden/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/golden/bluetooth/btvendor_golden.txt

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/golden/ril/
BOARD_NEEDS_SEC_RIL_WORKAROUND := true

# Browser
ENABLE_WEBGL := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB -DBOARD_CANT_REALLOCATE_OMX_BUFFERS
USE_LEGACY_AUDIO_POLICY := 1
BOARD_USES_LEGACY_MMAP := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 25
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true

# Charging mode
BOARD_LPM_BOOT_ARGUMENT_NAME := lpm_boot
BOARD_LPM_BOOT_ARGUMENT_VALUE := 1

# SELinux
HAVE_SELINUX := true
BOARD_SEPOLICY_DIRS += device/samsung/golden/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    device.te \
    file.te \
    geomagneticd.te \
    init.te \
    mediaserver.te \
    orientationd.te \
    system.te \
    vold.te \
    wpa_supplicant.te \
    zygote.te

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/golden/rootdir/etc/fstab.samsunggolden
RECOVERY_FSTAB_VERSION := 2
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun%d/file"

# TWRP Recovery defines
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_CUSTOM_THEME := device/samsung/golden/twres
TW_HAS_MTP := true
TW_BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/golden/recovery/twrp-graphics.c
TW_THEME := portrait_mdpi
RECOVERY_SDCARD_ON_DATA := true
#TW_INTERNAL_STORAGE_PATH := "/data/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
#BOARD_HAS_NO_REAL_SDCARD := true
#TW_NO_USB_STORAGE := true
TW_BRIGHTNESS_PATH := "/sys/devices/mcde_disp_s6e63m0_dsi.0/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_INCLUDE_CRYPTO := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_CPU_TEMP := true
#TW_EXCLUDE_MTP := true

MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/golden/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_MUL := 1
MR_DPI_FONT := 160
MR_FSTAB := device/samsung/golden/recovery/root/etc/twrp.fstab
MR_USE_MROM_FSTAB := false
# End of first RAM region is 0x05ffffff, so we set it to for example 0x03200000
# End of first RAM region is 0x083fffff, so we set it to for example 0x06500000
MR_KEXEC_MEM_MIN := 0x03200000
MR_RD_ADDR := 0x02200000
#MR_KEXEC_DTB := true
#MR_PIXEL_FORMAT := "RGBX_8888"
#MR_USE_QCOM_OVERLAY := true
#MR_QCOM_OVERLAY_HEADER := device/samsung/matisse/mr_qcom_overlay.h
#MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
#MR_DEVICE_VARIANTS := matisse matissewifi matisse3g matisselte matissewifiue
