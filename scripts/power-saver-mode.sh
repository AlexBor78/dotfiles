# #!/bin/bash
# # Режим 2 ядра: включаем cpu1, выключаем остальные (c 2 по 7)
# echo 1 | sudo tee /sys/devices/system/cpu/cpu{1..3}/online > /dev/null
# echo 0 | sudo tee /sys/devices/system/cpu/cpu{4..15}/online > /dev/null
# # notify-send "Режим: Powersave" "Активные ядра: 0, 1"

#!/bin/bash
# Режим 2 ядра: включаем cpu1, выключаем остальные (c 2 по 7)
echo 1 | sudo tee /sys/devices/system/cpu/cpu1/online > /dev/null
echo 0 | sudo tee /sys/devices/system/cpu/cpu{2..15}/online > /dev/null
# notify-send "Режим: Powersave" "Активные ядра: 0, 1"
