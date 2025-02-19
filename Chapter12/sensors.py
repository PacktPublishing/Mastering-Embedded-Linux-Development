#!/usr/bin/env python3

import time

paths = [
    '/sys/bus/iio/devices/iio:device0/in_humidityrelative_input',
    '/sys/bus/iio/devices/iio:device0/in_pressure_input',
    '/sys/bus/iio/devices/iio:device0/in_resistance_input',
    '/sys/bus/iio/devices/iio:device0/in_temp_input'
]

def read_sysfs_value(path):
    with open(path, 'r') as f:
        return f.read().strip()

while True:
    values = [0] * len(paths)
    for i, path in enumerate(paths):
        try:
            values[i] = read_sysfs_value(path)
        except IOError as e:
            print(f"Error: {e}")
    print(f"humidity: {values[0]}  pressure: {values[1]}  resistance: {values[2]}  temperature: {values[3]}")
    time.sleep(1)
