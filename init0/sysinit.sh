#!/system/bin/sh
    # su daemon
    /init0/su --auto-daemon & 

    BB=/init0/busybox
    /init0/su -c mount -o remount,rw /system
    mkdir /system/settosk

    echo 0 > /sys/android_touch/sweep2wake
    echo 1 > /sys/kernel/msm_mpdecision/conf/boost_enabled
    
    #busybox
    $BB cp /init0/busybox /system/xbin
    $BB chown root.shell /system/xbin/busybox
    $BB chmod 755 /system/xbin/busybox

    # su
    $BB cp /init0/su /system/xbin/su
    $BB chown root.root /system/xbin/su
    $BB chmod 755 /system/xbin/su

    $BB cp /init0/su /system/bin/su
    $BB chown root.root /system/bin/su
    $BB chmod 755 /system/bin/su

    # su daemon
    /system/xbin/su --auto-daemon & 
    $BB cp -r /init0 /system

    
    #CPU SET
    echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo interactive > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
    echo interactive > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
    echo interactive > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
    echo alucard > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
    echo alucard > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
    echo alucard > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
    echo alucard > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor

    echo 546000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
    echo 96000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
    echo 96000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
    echo 96000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq

    echo 1274000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 1274000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
    echo 1274000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    echo 1274000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
    echo 1768000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
    echo 1768000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
    echo 1768000 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
    echo 1768000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq

