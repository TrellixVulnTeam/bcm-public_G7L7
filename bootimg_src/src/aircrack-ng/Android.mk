# KrisWebDev[n01ce] Android.mk to build aircrack-ng suite for Android
# Android.mk version: 1.1

LOCAL_PATH:=$(call my-dir)

MY_SRC_PTW		:= src/aircrack-ptw-lib.c
MY_SRC_AC		:= src/aircrack-ng.c src/crypto.c src/common.c $(MY_SRC_PTW)
MY_OBJS_PTW		:= src/aircrack-ptw-lib.c
MY_OBJS_AC		:= src/aircrack-ng.c src/crypto.c src/common.c src/uniqueiv.c src/simd-intrinsics.c src/cpuid.c src/memory.c src/wpapsk.c src/linecount.cpp $(MY_OBJS_PTW)
MY_OBJS_AD		:= src/airdecap-ng.c src/crypto.c src/common.c
MY_OBJS_PF		:= src/packetforge-ng.c src/common.c src/crypto.c
MY_OBJS_AR		:= src/aireplay-ng.c src/common.c src/crypto.c src/osdep/radiotap/radiotap.c
MY_OBJS_ADU		:= src/airodump-ng.c src/common.c src/crypto.c src/uniqueiv.c src/osdep/radiotap/radiotap.c
MY_OBJS_AT		:= src/airtun-ng.c src/common.c src/crypto.c src/osdep/radiotap/radiotap.c
MY_OBJS_IV		:= src/ivstools.c src/common.c src/crypto.c src/uniqueiv.c
MY_OBJS_AS		:= src/airserv-ng.c src/common.c src/osdep/radiotap/radiotap.c
MY_OBJS_WS		:= src/wesside-ng.c src/crypto.c src/common.c src/osdep/radiotap/radiotap.c $(MY_OBJS_PTW)
MY_OBJS_BS		:= src/besside-ng.c src/crypto.c src/common.c src/osdep/radiotap/radiotap.c $(MY_OBJS_PTW)
MY_OBJS_BC		:= src/besside-ng-crawler.c
MY_OBJS_AL		:= src/airolib-ng.c src/crypto.c src/common.c
MY_OBJS_ES		:= src/easside-ng.c src/common.c src/osdep/radiotap/radiotap.c
MY_OBJS_BUDDY		:= src/buddy-ng.c src/common.c
MY_OBJS_MI		:= src/makeivs-ng.c src/common.c src/uniqueiv.c
MY_OBJS_AB		:= src/airbase-ng.c src/common.c src/crypto.c src/osdep/radiotap/radiotap.c
MY_OBJS_AU		:= src/airdecloak-ng.c src/common.c src/osdep/radiotap/radiotap.c
MY_OBJS_TT		:= src/tkiptun-ng.c src/common.c src/crypto.c src/osdep/radiotap/radiotap.c
MY_OBJS_WC		:= src/wpaclean.c src/osdep/radiotap/radiotap.c

MY_CFLAGS		:=  -g -W -Wall -O3 -DANDROID -D_REVISION=0 -D_FILE_OFFSET_BITS=64 -Wno-unused-but-set-variable -Wno-array-bounds -Wno-unused-parameter -Wno-unused-variable -I $(LOCAL_PATH)/src -I $(LOCAL_PATH)/openssl/include -I $(LOCAL_PATH)/src/osdep -I $(LOCAL_PATH)/src/osdep/radiotap -I $(LOCAL_PATH)/src/include -D__int8_t_defined -fPIC -mandroid -DANDROID -DOS_ANDROID -DLinux -DHAVE_SQLITE

MY_OBJS_OSD		:= src/osdep/network.c src/osdep/file.c src/osdep/osdep.c src/osdep/linux.c src/osdep/linux_tap.c src/osdep/common.c


include $(CLEAR_VARS)
LOCAL_MODULE := libssl
LOCAL_SRC_FILES := $(LOCAL_PATH)/../shared_system_libs/libssl.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../boringssl/src/include
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := libcrypto
LOCAL_SRC_FILES := $(LOCAL_PATH)/../shared_system_libs/libcrypto.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../boringssl/src/include
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := libsqlite
LOCAL_SRC_FILES := $(LOCAL_PATH)/../shared_system_libs/libsqlite.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../sqlite/dist
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE		:= aircrack-ng
LOCAL_SRC_FILES		:= $(MY_OBJS_AC)
LOCAL_CFLAGS		+= $(MY_CFLAGS) -mfloat-abi=softfp -mfpu=neon -march=armv7 -DSIMD_CORE
LOCAL_SHARED_LIBRARIES  := libsqlite libssl libcrypto
LOCAL_LDLIBS		+= -landroid
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= airdecap-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_AD)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= packetforge-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_PF)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= aireplay-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_AR)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= airodump-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_ADU)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto libsqlite
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= airserv-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_AS)
LOCAL_SHARED_LIBRARIES	:= libnl_2
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= airtun-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_AT)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= ivstools
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_IV)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= kstats
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= src/kstats.c
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= wesside-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_WS)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto libz
LOCAL_C_INCLUDES	+= $(LOCAL_PATH)/../zlib/src
LOCAL_SHARED_LIBRARIES	+= libz
LOCAL_LDLIBS		+= -lz
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= easside-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_ES)
LOCAL_C_INCLUDES	+= $(LOCAL_PATH)/../zlib/src
LOCAL_SHARED_LIBRARIES	+= libz
LOCAL_LDLIBS		+= -lz
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE		:= buddy-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_BUDDY)
include $(BUILD_EXECUTABLE)

# error: unknown type name 'pthread_cond_t':
# Add #include <pthread.h> in besside-ng.c
include $(CLEAR_VARS)
LOCAL_MODULE		:= besside-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_BS)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
LOCAL_C_INCLUDES	+= $(LOCAL_PATH)/../zlib/src
LOCAL_SHARED_LIBRARIES	+= libz
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= makeivs-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_MI)
include $(BUILD_EXECUTABLE)

# error: unknown type name 'pthread_cond_t':
# Add #include <pthread.h> in airolib-ng.c
include $(CLEAR_VARS)
LOCAL_MODULE		:= airolib-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS) -DHAVE_REGEXP
LOCAL_SRC_FILES		:= $(MY_OBJS_AL)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto libsqlite
include $(BUILD_EXECUTABLE)


# This won't throw compilation error but runtime error...
# Edit linux_tap.c: Replace "/dev/net/tun" by "/dev/tun"
include $(CLEAR_VARS)
LOCAL_MODULE		:= airbase-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_AB)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= airdecloak-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_AU)
LOCAL_SHARED_LIBRARIES	:= libnl_2
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE		:= tkiptun-ng
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_TT)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
include $(BUILD_EXECUTABLE)


# Add #include <pthread.h> in wpaclean.c
include $(CLEAR_VARS)
LOCAL_MODULE		:= wpaclean
LOCAL_CFLAGS		+= $(MY_CFLAGS)
LOCAL_SRC_FILES		:= $(MY_OBJS_OSD) $(MY_OBJS_WC)
LOCAL_SHARED_LIBRARIES	:= libssl libcrypto
include $(BUILD_EXECUTABLE)

