#
# Copyright (C) 2019 The LineageOS Project
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

# Inherit from motorola sdm632-common
-include device/motorola/sdm632-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/ocean

# Assertions
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := ocean

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := ocean_defconfig
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/7824900.sdhci

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432 # 32 MB

# Retrofit dynamic partitions
BOARD_SUPER_PARTITION_GROUPS := moto_dynamic_partitions
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 2952790016 # 2816 MB
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 889192448 # 848 MB
BOARD_MOTO_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor
BOARD_SUPER_PARTITION_SIZE := 3841982464 # 3664 MB
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 3837788160 # 3660 MB

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# inherit from the proprietary version
include vendor/motorola/ocean/BoardConfigVendor.mk
