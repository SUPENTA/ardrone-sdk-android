LOCAL_PATH := $(call my-dir)

### Parrot static libraries
include $(CLEAR_VARS)
LOCAL_MODULE    := sdk 
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/sdk_$(ARDRONE_TARGET_BUILD)_vlib_$(ARDRONE_TARGET_OS)_$(GCC)/libsdk.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := pc_ardrone 
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/ardrone_lib_$(ARDRONE_TARGET_BUILD)_vlib_$(ARDRONE_TARGET_OS)_$(GCC)/libpc_ardrone.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := vlib 
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/vlib_$(ARDRONE_TARGET_BUILD)_$(ARDRONE_TARGET_OS)_$(GCC)/libvlib.a
include $(PREBUILT_STATIC_LIBRARY)

### FFMPEG shared libraries
include $(CLEAR_VARS)
LOCAL_MODULE := AVCODEC-prebuilt
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/ffmpeg_armv7_$(ARDRONE_TARGET_BUILD)_$(ARDRONE_TARGET_OS)_$(GCC)/libavcodec.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := AVUTIL-prebuilt
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/ffmpeg_armv7_$(ARDRONE_TARGET_BUILD)_$(ARDRONE_TARGET_OS)_$(GCC)/libavutil.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := SWSCALE-prebuilt
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/ffmpeg_armv7_$(ARDRONE_TARGET_BUILD)_$(ARDRONE_TARGET_OS)_$(GCC)/libswscale.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := AVFILTER-prebuilt
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/ffmpeg_armv7_$(ARDRONE_TARGET_BUILD)_$(ARDRONE_TARGET_OS)_$(GCC)/libavfilter.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := AVFORMAT-prebuilt
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/ffmpeg_armv7_$(ARDRONE_TARGET_BUILD)_$(ARDRONE_TARGET_OS)_$(GCC)/libavformat.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := AVDEVICE-prebuilt
LOCAL_SRC_FILES := $(ARDRONE_SDK_PATH)/Soft/Build/targets_versions/ffmpeg_armv7_$(ARDRONE_TARGET_BUILD)_$(ARDRONE_TARGET_OS)_$(GCC)/libavdevice.so
include $(PREBUILT_SHARED_LIBRARY)

### Real work for adfreeflight module

include $(CLEAR_VARS)

LOCAL_C_INCLUDES:=	$(ARDRONE_SDK_PATH)/FFMPEG/Includes \
					$(ARDRONE_SDK_PATH)/Soft/Lib

#LIB_PATH=$(LOCAL_PATH)/../../libs/armeabi

LOCAL_LDLIBS := -llog -lGLESv2 -ljnigraphics

LOCAL_MODULE    := adfreeflight  

LOCAL_SRC_FILES := app.c video_stage_io_file.c hardware_capabilites.c ControlData.c \
				Controller/ardrone_controller.c Controller/virtual_gamepad.c \
				Callbacks/drone_proxy_callbacks.c Callbacks/java_callbacks.c \
				Plf/plf.c \
				Stubs/drone_stub.c Stubs/drone_config_stub.c Stubs/ftp_client_stub.c Stubs/plf_file_stub.c Stubs/transcoding_service_stub.c Stubs/gl_bg_video_sprite_stub.c \
				NavData/nav_data.c \
				Video/video_stage_renderer.c Video/frame_rate.c Video/opengl_stage.c Video/opengl_shader.c

LOCAL_STATIC_LIBRARIES := pc_ardrone vlib sdk
LOCAL_SHARED_LIBRARIES := AVUTIL-prebuilt AVCODEC-prebuilt SWSCALE-prebuilt AVFILTER-prebuilt AVFORMAT-prebuilt AVDEVICE-prebuilt

LOCAL_CFLAGS += -D__USE_GNU -D__linux__ -DNO_ARDRONE_MAINLOOP -DUSE_ANDROID -DTARGET_CPU_ARM=1 -DTARGET_CPU_X86=0 -DUSE_WIFI -DFFMPEG_SUPPORT -fstack-protector
LOCAL_CFLAGS += -DANDROID_NDK
#LOCAL_LDFLAGS := -Wl,-Map,app.map

include $(BUILD_SHARED_LIBRARY)

