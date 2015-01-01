export ARCHS=arm64 armv7
export GO_EASY_ON_ME=1
export THEOS_PACKAGE_DIR_NAME=./deb_builds

include theos/makefiles/common.mk

TWEAK_NAME = splashboarddcrashfixer
splashboarddcrashfixer_FILES = Tweak.xm NSDictionary+XPCParse.m NSObject+XPCParse.m NSString+XPCParse.m
splashboarddcrashfixer_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
