# #!/bin/bash
# source = ~/conf/scripts/init.sh

# export WALLPAPERS_NUM=5
# export WALLPAPERS_DIR=~/wallpapers
# export WALLPAPER_TRANSITION_TYPE="grow"
# export WALLPAPER_TRANSITION_DURATION=1 # in seconds
# FLAGS="--invert-y"

# chose_wallpaper() {
#     local RAND=$(($RANDOM % $WALLPAPERS_NUM + 1))
#     if [[$RAND -eq $ACTIVE_WALLPAPER]]; then
#         echo $(chose_wallpaper)
#     else
#         export ACTIVE_WALLPAPER=$RAND
#         echo "$WALLPAPERS_DIR/$RAND.jpg"
#     fi
# }

# change_wallpaper() {
#     COMMAND="swww img ~/wallpapers/$(($RANDOM % $WALLPAPERS_NUM + 1)).jpg
#     --transition-type $WALLPAPER_TRANSITION_TYPE 
#     --transition-duration $WALLPAPER_TRANSITION_DURATION 
#     --transition-pos $(hyprctl cursorpos | tr -d ' ') 
#     $FLAGS"
#     echo "$COMMAND" >> ~/script.log
#     echo $($COMMAND) >> ~/script.log
#     echo 
# }

# update_env_colors() {
#     # todo:
#     echo
# }

# print_vars() {
#     echo $COMMAND
#     echo $($RANDOM % $WALLPAPERS_NUM + 1)
#     echo "$"

#     echo "$WALLPAPER_TRANSITION_TYPE"
#     echo "$WALLPAPERS_DIR"
#     echo "$"
#     echo "$"
# }

# echo $($RANDOM % $WALLPAPERS_NUM + 1)
# echo "$"

# echo "$WALLPAPER_TRANSITION_TYPE"
# echo "$WALLPAPERS_DIR"
# echo "$"
# echo "$"

# echo $(change_wallpaper) >> ~/script.log
# echo
# echo "$COMMAND"




echo "Script Log" >> ~/script.log