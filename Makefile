INSTALL_TARGET_PROCESSES = SpringBoard

FINAL_PACKAGE = 1
DEBUG = 0

export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = No3DDelete

No3DDelete_FILES = Tweak.x
No3DDelete_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
