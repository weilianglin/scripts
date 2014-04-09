#!/bin/sh

for cpu in `find /sys/devices/system/cpu -name "cpu?"`
do
    [ -d "$cpu/cpufreq" ] || continue
    echo $cpu | cut -d / -f 6
    echo -n "  `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`"
    echo -n "  min: `cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`"
    echo -n "  max: `cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq`"
    echo "  cur: `cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq`"
done
