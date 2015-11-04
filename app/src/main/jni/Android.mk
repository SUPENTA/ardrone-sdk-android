#CFLAGS=-Wall -O0 -g -fPIC
CFLAGS := -g
ARDRONE_SDK_PATH := ../../../../../ARDroneLib
ARDRONE_TARGET_BUILD := DEBUG_MODE
ARDRONE_TARGET_OS := Linux_3.19.0-30-generic_GNU_Linux
GCC := homedavidAndroidDeveloperToolssdkndk-bundletoolchainsarm-linux-androideabi-4.9prebuiltlinux-x86_64binarm-linux-androideabi-gcc_4.9
include $(all-subdir-makefiles)

