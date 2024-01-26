#!/usr/bin/env python3

import gi

gi.require_version('GOpenHMD', '1.0')
from gi.repository import GOpenHMD


def devs_info(context):
    for dev in context.enumerate():
        print(f"Discovered device: vendor '{dev.get_vendor()}'"
            f", product '{dev.get_product()}'"
        )


def dev_quat_info(context, dev):
    context.update()
    quat = dev.rotation_quat()
    print(f"quat: x={quat.x} y={quat.y} z={quat.z} w={quat.w}")
    GOpenHMD.sleep(0.01)


print(f"Version: {GOpenHMD.version().to_string()}")

context = GOpenHMD.Context()

devs_info(context)

dev = context.open_device(0) 

for i in range(0, 300):
    dev_quat_info(context, dev)
