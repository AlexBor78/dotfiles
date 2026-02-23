# #!/bin/bash
# # Включаем ВСЕ ядра (с 0 по 7)
# echo 1 | sudo tee /sys/devices/system/cpu/cpu{0..15}/online > /dev/null
# # notify-send "Режим: 8 ядра" "Все ядра активны"1

# #!/bin/bash
# # Режим 4 ядра: включаем ядра 1,2,3, выключаем 4-7
echo 1 | sudo tee /sys/devices/system/cpu/cpu{1..7}/online > /dev/null
echo 0 | sudo tee /sys/devices/system/cpu/cpu{8..15}/online > /dev/null
# # notify-send "Режим: Balanced" "Активные ядра: 0, 1, 2, 3"
