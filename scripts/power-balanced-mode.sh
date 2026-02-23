# #!/bin/bash
# # Режим 4 ядра: включаем ядра 1,2,3, выключаем 4-7
# echo 1 | sudo tee /sys/devices/system/cpu/cpu{1..7}/online > /dev/null
# echo 0 | sudo tee /sys/devices/system/cpu/cpu{8..15}/online > /dev/null
# # notify-send "Режим: Balanced" "Активные ядра: 0, 1, 2, 3"

#!/bin/bash
# Режим 2 ядра: включаем cpu1, выключаем остальные (c 2 по 7)
echo 1 | sudo tee /sys/devices/system/cpu/cpu{1..3}/online > /dev/null
echo 0 | sudo tee /sys/devices/system/cpu/cpu{4..15}/online > /dev/null
# notify-send "Режим: Powersave" "Активные ядра: 0, 1"
