#!/bin/bash

#
# Capy wont work in wayland yet 
#

if [ -z "$WSL_INTEROP" ]; then
    echo "Not running in WSL"
    exit 1
fi
## This a workaround for wayland with VcXsrv for wsL2 ( VcXsrv uses X server )
DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0
export DISPLAY

zig build run
