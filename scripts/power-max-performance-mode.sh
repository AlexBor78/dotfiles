#!/bin/bash
# Включаем ВСЕ ядра (с 0 по 7)
echo 1 | sudo tee /sys/devices/system/cpu/cpu{1..15}/online > /dev/null
# notify-send "Режим: 8 ядра" "Все ядра активны"1
