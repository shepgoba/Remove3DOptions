INSTALL_TARGET_PROCESSES = SpringBoard

FINAL_PACKAGE = 1
DEBUG = 0

export TARGET = iphone:clang:11.2:11.2
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Remove3DOptions

Remove3DOptions_FILES = Tweak.x
Remove3DOptions_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += remove3doptionsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
