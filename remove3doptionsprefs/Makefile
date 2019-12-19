include $(THEOS)/makefiles/common.mk
export ARCHS = arm64 arm64e
BUNDLE_NAME = Remove3DOptionsPrefs

Remove3DOptionsPrefs_FILES = R3ORootListController.m
Remove3DOptionsPrefs_INSTALL_PATH = /Library/PreferenceBundles
Remove3DOptionsPrefs_FRAMEWORKS = UIKit
Remove3DOptionsPrefs_PRIVATE_FRAMEWORKS = Preferences
Remove3DOptionsPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Remove3DOptionsPrefs.plist$(ECHO_END)
