#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/penang

# Inherit from motorola sm4350-common
include device/motorola/sm4350-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := penang

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=penang
TARGET_KERNEL_CONFIG += vendor/penang_defconfig

# DTBO
#BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# DTB
#BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt
#TARGET_PREBUILT_DTB := $(BOARD_PREBUILT_DTBIMAGE_DIR)/holi.dtb
#BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    tcpc_sgm7220.ko \
    tcpc_rt1711h.ko \
    wcd_core_dlkm.ko \
    wcd938x_dlkm.ko \
    q6_notifier_dlkm.ko \
    platform_dlkm.ko \
    stub_dlkm.ko \
    aw87xxx_dlkm.ko \
    wcd938x_slave_dlkm.ko \
    swr_ctrl_dlkm.ko \
    swr_dlkm.ko \
    wcd937x_dlkm.ko \
    camera.ko \
    aw882xx_acf.ko \
    q6_dlkm.ko \
    wsa881x_analog_dlkm.ko \
    q6_pdr_dlkm.ko \
    wcd9xxx_dlkm.ko \
    wcd937x_slave_dlkm.ko \
    mbhc_dlkm.ko \
    pinctrl_lpi_dlkm.ko \
    aw882xx_k419.ko \
    machine_dlkm.ko \
    rx_macro_dlkm.ko \
    va_macro_dlkm.ko \
    apr_dlkm.ko \
    bolero_cdc_dlkm.ko \
    tx_macro_dlkm.ko \
    snd_event_dlkm.ko \
    adsp_loader_dlkm.ko \
    nfc_i2c.ko \
    native_dlkm.ko \
    rmnet_core.ko \
    rmnet_ctl.ko \
    rmnet_offload.ko \
    rmnet_shs.ko \
    fpsensor_spi_tee.ko \
    fpc1020_mmi.ko \
    mmi_sys_temp.ko \
    rt_pd_manager.ko \
    nova_0flash_mmi.ko \
    focaltech_0flash_v2_mmi.ko

BOOT_KERNEL_MODULES := \
    tcpc_sgm7220.ko \
    tcpc_rt1711h.ko \
    rt_pd_manager.ko \
    focaltech_0flash_v2_mmi.ko \
    nova_0flash_mmi.ko

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 102247673856
BOARD_MOT_DP_GROUP_SIZE := 4961861632 # ((SUPER_PARTITION_SIZE / 2) - 4194304)
BOARD_SUPER_PARTITION_SIZE := 4966055936

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_penang
TARGET_RECOVERY_DEVICE_MODULES := init_penang

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/device_framework_matrix.xml

# Security
VENDOR_SECURITY_PATCH := 2023-06-01

# inherit from the proprietary version
include vendor/motorola/penang/BoardConfigVendor.mk
