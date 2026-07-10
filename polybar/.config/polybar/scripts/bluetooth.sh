#!/bin/bash

if hciconfig | grep -q "UP RUNNING"; then
    echo ""
else
    echo""
fi
