#!/bin/bash

# Config vars
source ~/conf/scripts/init.sh

FLAGS="--invert-y"

chose_wallpaper() {
    local RAND=$(($RANDOM % $WALLPAPERS_NUM + 1))
    if [[$RAND -eq $ACTIVE_WALLPAPER]]; then
        echo $(chose_wallpaper)
    else
        export ACTIVE_WALLPAPER=$RAND
        echo "$WALLPAPERS_DIR/$RAND.jpg"
    fi
}

change_wallpaper() {
    COMMAND="swww img $(chose_wallpaper)
    --transition-type $WALLPAPER_TRANSITION_TYPE 
    --transition-duration $WALLPAPER_TRANSITION_DURATION 
    --transition-pos $(hyprctl cursorpos | tr -d ' ') 
    $FLAGS"
    echo
    # echo "$COMMAND"
    echo
    echo $($COMMAND)
}

update_env_colors() {
    # todo:
    echo
}

print_vars() {
    echo $COMMAND
    echo $($RANDOM % $WALLPAPERS_NUM + 1)
    echo "$"

    echo "$WALLPAPER_TRANSITION_TYPE"
    echo "$WALLPAPERS_DIR"
    echo "$"
    echo "$"
}

echo $(change_wallpaper) >> $LOG_DIR/change-wallpaper.log
