LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := hdmi_helper.cpp
LOCAL_LDFLAGS := -L vendor/samsung/santos10-common/proprietary/vendor/lib
LOCAL_LDLIBS := -lmultidisplay
LOCAL_SHARED_LIBRARIES += libbinder liblog libutils
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_MODULE := hdmi_helper
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
