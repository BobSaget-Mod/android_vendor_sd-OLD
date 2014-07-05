ifeq (aospal_mako,$(TARGET_PRODUCT))
include vendor/aospal/configs/aospal_modular.mk

# Optimize memory
OPT_MEMORY := true

# Enable graphite
ENABLE_GRAPHITE := true

# Saber linux toolchains
USING_SABER_LINUX := yes

# Set -fstrict-aliasing flag to global for mako (for real this time)
MAKE_STRICT_GLOBAL := true

# Include AOSPAL common configuration
include vendor/aospal/main.mk

# Call AOSPAL device
$(call inherit-product, vendor/aospal/products/aospal_mako.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/lge/mako/full_mako.mk)

# Override AOSP build properties
PRODUCT_NAME := aospal_mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT=google/occam/mako:4.4.2/KOT49H/937116:user/release-keys PRIVATE_BUILD_DESC="occam-user 4.4.2 KOT49H 937116 release-keys"
endif
