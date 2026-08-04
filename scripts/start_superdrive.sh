#!/bin/bash

# requires sg3_utils, loads cd into apple superdrive

scan="$(sg_scan)"
arg=(${scan//:/ })
drive=(${arg[0]})

if [[ -z "$drive"  || ! -e "$drive" ]]; then 
  drive="/dev/sr0"
fi

sg_raw $drive EA 00 00 00 00 00 01
