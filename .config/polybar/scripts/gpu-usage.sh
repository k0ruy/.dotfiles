#!/bin/bash

sudo cat /sys/kernel/debug/dri/0/amdgpu_pm_info | grep "GPU Load" | awk '{print $3, $4}'
