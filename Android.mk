LOCAL_PATH := $(call my-dir)

ifneq ($(filter p760 p768 p765 p769,$(TARGET_DEVICE)),)


#Creating Gralloc SymLink
include $(CLEAR_VARS)

LOCAL_MODULE := gralloc.omap4.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): GRALLOC_FILE := gralloc.omap4430.so
$(LOCAL_BUILT_MODULE): SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/$(LOCAL_MODULE)
$(LOCAL_BUILT_MODULE): $(LOCAL_PATH)/Android.mk
$(LOCAL_BUILT_MODULE):
	$(hide) echo "Symlink: $(SYMLINK) -> $(GRALLOC_FILE)"
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(SYMLINK))
	$(hide) rm -rf $@
	$(hide) rm -rf $(SYMLINK)
	$(hide) ln -sf $(GRALLOC_FILE) $(SYMLINK)
	$(hide) touch $@

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
