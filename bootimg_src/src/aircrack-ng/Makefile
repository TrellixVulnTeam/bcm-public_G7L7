PROGS = airbase-ng airdecap-ng aireplay-ng airolib-ng airtun-ng buddy-ng ivstools tkiptun-ng wpaclean aircrack-ng airdecloak-ng airodump-ng airserv-ng besside-ng easside-ng kstats makeivs-ng packetforge-ng wesside-ng

all: libs/armeabi/aircrack-ng
	cd libs/armeabi/ && cp $(PROGS) ../../../../bin

libs/armeabi/aircrack-ng: Android.mk SYSTEM_LIBS
	$(NDK_ROOT)/ndk-build NDK_APPLICATION_MK=`pwd`/Application.mk NDK_APP_OUT=. TARGET_PLATFORM=android-21

SYSTEM_LIBS: FORCE
	cd ../shared_system_libs && make
	
FORCE:

clean:
	rm -Rf libs
	rm -Rf local
