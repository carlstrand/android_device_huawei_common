#
# Copyright (C) 2018 CarbonRom
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Platform Path
PLATFORM_PATH := device/huawei/common

# Generic A-only Target
include build/make/target/board/generic_arm64_a/BoardConfig.mk

TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.kirin

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
PRODUCT_FULL_TREBLE := true

# Platform
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true

# Charger 
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := "/sys/class/leds/lcd_backlight0/brightness"
HEALTHD_BACKLIGHT_LEVEL := 102
HEALTHD_FORCE_BACKLIGHT_CONTROL := true

# Charge Detection
HEALTHD_ENABLE_HUAWEI_FASTCHG_CHECK := true

# Extended Filesystem Support
TARGET_EXFAT_DRIVER := exfat

# Lineage hardware
#BOARD_HARDWARE_CLASS += \
#    $(PLATFORM_PATH)/lineagehw

# Cpuset
ENABLE_CPUSETS := true

# Schedboost
ENABLE_SCHEDBOOST := true

# Graphics
OVERRIDE_RS_DRIVER := libRSDriverArm.so
HWUI_COMPILE_SYMBOLS := true

# linker
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Audio
BOARD_USES_ALSA_AUDIO := true

# Properties
TARGET_SYSTEM_PROP := $(PLATFORM_PATH)/system.prop

# Radio
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# Release tools
# TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)/releasetools

# Sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(PLATFORM_PATH)/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(PLATFORM_PATH)/sepolicy/public
include vendor/omni/sepolicy/sepolicy.mk

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/lib64/libdisplayenginesvc_1_0.so|libshims_hwsmartdisplay_jni.so \
    /system/lib64/libdisplayenginesvc_1_1.so|libshims_hwsmartdisplay_jni.so \
    /system/lib64/libhwpwmanager_jni.so|libshims_hwsmartdisplay_jni.so \
    /system/lib64/libhwsmartdisplay_jni.so|libshims_hwsmartdisplay_jni.so

# System size
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2000000000	# 2.0 GB
