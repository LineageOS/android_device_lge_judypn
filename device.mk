#
# Copyright (C) 2018 The LineageOS Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_NAME := judypn

# Include from common device configuration
$(call inherit-product, device/lge/sdm845-common/sdm845.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# DAC
PRODUCT_PACKAGES += \
    QuadDACPanel \
    vendor.lge.hardware.audio.dac.control@2.0-service.proprietary

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.lineage

# Init
PRODUCT_COPY_FILES += \
    device/lge/sdm845-common/rootdir/etc/fstab.judy:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.judypn \
    device/lge/sdm845-common/rootdir/etc/fstab.judy:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.judypn

# LiveDisplay
$(call soong_config_set,livedisplay_lge,enable_se,true)

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    vendor.nxp.nxpese@1.0.vendor:64 \
    vendor.nxp.nxpnfc@1.0.vendor:64

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.lge

# Wi-Fi Overlay
PRODUCT_PACKAGES += \
    WifiOverlayV40

# Get non-open-source specific aspects
$(call inherit-product, vendor/lge/judypn/judypn-vendor.mk)
