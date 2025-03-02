#!/bin/sh

echo "Configure USR_BUTTON (gpio 557) as input, trigger on falling edge"
echo 557 > /sys/class/gpio/export
echo falling > /sys/class/gpio/gpio557/edge
