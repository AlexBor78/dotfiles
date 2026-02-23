#!/bin/bash

# wallpaper changer

export ACTIVE_WALLPAPER="ff"
WALLPAPER_DIR=~/wallpapers
RAND=$(($RANDOM % 5 + 1))
WALLPAPER="$WALLPAPER_DIR/$RAND.jpg"

# geting mouse location
#!/bin/bash

# Получаем координаты мыши
XY=$(hyprctl cursorpos | tr -d ' ')

TRANSITION_TYPE="grow"
# TRANSITION_TYPE="center"

TRANSITION_DURATION=1 # in seconds

chose_wallpaper() {
    local RAND=$($RANDOM % 6 + 1)
    if [[$RAND == $ACTIVE_WALLPAPER]]; then
        echo $(chose_wallpaper)
    else
        ACTIVE_WALLPAPER=$RAND
        echo $RAND
    fi
}

echo
echo $WALLPAPER 
echo $TRANSITION_TYPE
echo 

echo "swww img "$WALLPAPER" -t $TRANSITION_TYPE --transition-duration $TRANSITION_DURATION --transition-pos $XY --invert-y"
echo
swww img "$WALLPAPER" -t $TRANSITION_TYPE --transition-duration $TRANSITION_DURATION --transition-pos $XY --invert-y

# todo: update env colors
