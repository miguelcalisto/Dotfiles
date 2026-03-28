#!/bin/bash

mem_used=$(free -k | grep Mem | awk '{print $3}')

mem_used_gb=$(echo "scale=2; $mem_used / 1024 / 1024" | bc)

echo " <b>RAM: ${mem_used_gb}GB</b> "
