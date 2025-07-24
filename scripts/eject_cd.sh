#!/bin/bash

# requires sg3_utils, unloads cd from apple superdrive

scan="$(sg_scan)"
arg=(${scan//:/ })
drive=(${arg[0]})

sg_prevent --allow $drive
sg_start --stop --eject $drive
