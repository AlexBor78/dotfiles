#!/bin/bash

# Отключаем блур
hyprctl keyword decoration:blur:enabled true

# Уменьшаем/отключаем прозрачность
hyprctl keyword decoration:inactive_opacity 0.65
hyprctl keyword decoration:active_opacity 0.9
