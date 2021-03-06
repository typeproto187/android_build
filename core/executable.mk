###########################################################
## Standard rules for building an executable file.
##
## Additional inputs from base_rules.make:
## None.
###########################################################

ifeq ($(strip $(LOCAL_MODULE_CLASS)),)
LOCAL_MODULE_CLASS := EXECUTABLES
endif
ifeq ($(strip $(LOCAL_MODULE_SUFFIX)),)
LOCAL_MODULE_SUFFIX := $(TARGET_EXECUTABLE_SUFFIX)
endif

include $(BUILD_SYSTEM)/dynamic_binary.mk

ifeq ($(LOCAL_FORCE_STATIC_EXECUTABLE),true)
$(linked_module): $(TARGET_CRTBEGIN_STATIC_O) $(all_objects) $(all_libraries) $(TARGET_CRTEND_O)
	$(transform-o-to-static-executable)
else	
$(linked_module): $(TARGET_CRTBEGIN_DYNAMIC_O) $(all_objects) $(all_libraries) $(TARGET_CRTEND_O)
	$(transform-o-to-executable)
endif
