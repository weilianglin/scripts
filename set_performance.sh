#!/bin/sh

#governor=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`
#echo "governor=$governor" > storedvalue

governor="performance"
for cpu in `find /sys/devices/system/cpu -name "cpu?"`
do
    [ -d "$cpu/cpufreq" ] || continue
    echo "$governor" > $cpu/cpufreq/scaling_governor
done
