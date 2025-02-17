#!/usr/bin/env python3

import numpy as np
from PIL import Image
from time import sleep
from luma.core.device import linux_framebuffer

device = linux_framebuffer()

def draw(offset):
    red = np.zeros((128, 128))
    green = np.zeros((128, 128))
    blue = np.zeros((128, 128))
    red[22 + offset : 65 + offset, 22 + offset : 65 + offset] = 255
    green[42:84, 42:84] = 255
    blue[63 - offset : 106 - offset, 63 - offset : 106 - offset] = 255
    red_img = Image.fromarray(red).convert("L")
    green_img = Image.fromarray(green).convert("L")
    blue_img = Image.fromarray((blue)).convert("L")
    device.display(
        Image.merge(
            "RGB",
            (red_img, green_img, blue_img)
        )
    )

while True:
    for offset in range(0, 21, 1):
        draw(offset)
        sleep(0.05)
    for offset in range(21, 0, -1):
        draw(offset)
        sleep(0.05)
