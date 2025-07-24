#!/bin/bash

# requires sg3_utils, loads cd into apple superdrive

scan="$(sg_scan)"
arg=(${scan//:/ })
drive=(${arg[0]})

sg_raw $drive EA 00 00 00 00 00 01
