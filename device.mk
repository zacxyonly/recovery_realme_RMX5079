#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 The TWRP Open Source Project
#

LOCAL_PATH := device/realme/RMX5079
DEVICE_PATH := device/realme/RMX5079

# Build standalone recovery image
PRODUCT_BUILD_RECOVERY_IMAGE := true

# Enable Virtual A/B
ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    init_boot \
    vendor_boot \
    dtbo \
    recovery \
    system \
    system_ext \
    system_dlkm \
    product \
    vendor \
    vendor_dlkm \
    odm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# Boot control HAL (Slot A/B switching)
PRODUCT_PACKAGES += \
    android.hardware.boot-service.qti \
    android.hardware.boot-service.qti.recovery

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti \
    android.hardware.health-service.qti.recovery

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot-service.example.recovery \
    fastbootd

# Update engine (A/B)
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    checkpoint_gc \
    otapreopt_script

# Recovery dependencies & custom init rc
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/system/etc/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags \
    $(DEVICE_PATH)/recovery/root/init.recovery.usb.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.usb.rc \
    $(DEVICE_PATH)/recovery/root/fstab.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/fstab.qcom
