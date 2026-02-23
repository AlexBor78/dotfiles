#!/bin/bash

# Отключаем блур
hyprctl keyword decoration:blur:enabled false

# Уменьшаем/отключаем прозрачность
hyprctl keyword decoration:inactive_opacity 1.0
hyprctl keyword decoration:active_opacity 1.0
