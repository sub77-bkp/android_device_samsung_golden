#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    // framebuffer device
    "/sys/class/graphics/fb0",

    // storage devices
    "/sys/block/mmcblk0",
	"/sys/devices/sdi2",
	"/sys/devices/sdi2/mmc_host/mmc0",
	"/sys/devices/sdi2/mmc_host/mmc0/mmc0:0001",
	"/sys/devices/sdi2/mmc_host/mmc0/mmc0:0001/block/mmcblk0",
	"/sys/devices/sdi2/mmc_host/mmc0/mmc0:0001/block/mmcblk0*",


    "/sys/bus/mmc",
    "/sys/bus/mmc/drivers/mmcblk",
    "/sys/module/mmc_core",
    "/sys/module/mmcblk",

    // input
	//"/sys/devices/gpio_keys.*/input*",
	"/sys/class/input/event1", //touch
	"/sys/class/input/event2", //touch
	"/sys/class/input/event3", //touch
	"/sys/class/input/event4", //touch
	"/sys/devices/virtual/input*",
	"/sys/devices/virtual/misc/uinput",
//    "/sys/devices/f9927000.i2c/i2c-5/5-004a/input*",
 "/sys/devices/f9927000.i2c/i2c-5/5-004a/input/input2",

    // adb
    "/sys/class/tty/ptmx",
    "/sys/class/misc/android_adb",
    "/sys/class/android_usb/android0/f_adb",
    "/sys/bus/usb",

    // USB Drive is in here
    //"/sys/devices/platform/msm_hsusb_host*",

    // for qualcomm overlay - /dev/ion
    //"/sys/devices/virtual/misc/ion",

    NULL
};
