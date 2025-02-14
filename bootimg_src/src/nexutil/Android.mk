#
# Copyright (C) 2008-2011 Broadcom Corporation
#
# $Id: Android.mk,v 2.6 2009-05-07 18:25:15 $
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
# OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	argp/mempcpy.c \
	argp/strchrnul.c \
	argp/rawmemchr.c \
	argp/basename-lgpl.c \
	argp/argp-parse.c \
	argp/argp-help.c \
	argp/argp-pvh.c \
	argp/argp-fmtstream.c \
	argp/argp-eexst.c \
	argp/getopt1.c \
	argp/getopt.c \
	nexutil.c

LOCAL_MODULE := nexutil
LOCAL_CFLAGS := -std=c99
LOCAL_CFLAGS += -D_GL_INLINE_HEADER_BEGIN=
LOCAL_CFLAGS += -D_GL_INLINE_HEADER_END=
LOCAL_CFLAGS += -DARGP_EI=inline
LOCAL_CFLAGS += -D_GL_INLINE=inline
LOCAL_CFLAGS += -D_GL_ATTRIBUTE_PURE=
LOCAL_CFLAGS += -Dfwrite_unlocked=fwrite
LOCAL_CFLAGS += -Dfputs_unlocked=fputs
LOCAL_CFLAGS += -D__getopt_argv_const=
LOCAL_CFLAGS += -D_GL_UNUSED=
ifeq ($(TARGET_ARCH),arm)
LOCAL_CFLAGS += -mabi=aapcs-linux
endif

LOCAL_C_INCLUDES +=$(LOCAL_PATH)/argp

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := debug

include $(BUILD_EXECUTABLE)
