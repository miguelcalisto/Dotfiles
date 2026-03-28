#!/bin/bash
eth_status=$(ip link show enp1s0 | grep 'state UP' | wc -l)
if [ "$eth_status" -eq 1 ]; then
  eth_speed=$(cat /sys/class/net/enp1s0/speed)
  echo " <b>🌐 Eth: ${eth_speed}Mb/s</b> "
else
  echo " <b>Eth: down</b> "
fi

