#!/usr/bin/env bash
set -euo pipefail

# Configuration
readonly BATTERY_PATH="/org/freedesktop/UPower/devices/battery_BAT0"
readonly THRESHOLD_LOW=74
readonly THRESHOLD_CRITICAL=75
readonly NOTIFY_TIMEOUT=10000

# State
NOTIFIED_LOW=false
NOTIFIED_CRITICAL=false

# Get battery percentage
get_battery_percent() {
    upower -i "$BATTERY_PATH" | grep 'percentage:' | awk '{print $2}' | tr -d '%'
}

# Get battery state (charging/discharging)
get_battery_state() {
    upower -i "$BATTERY_PATH" | grep 'state:' | awk '{print $2}'
}

# Send notification via Hyprland
send_notification() {
    local title="$1"
    local message="$2"
    local color="$3"
    hyprctl notify -1 "$NOTIFY_TIMEOUT" "$color" "$title" "$message"
}

# Reset notification state
reset_state() {
    NOTIFIED_LOW=false
    NOTIFIED_CRITICAL=false
}

# Handle battery event
handle_event() {
    local percent state
    percent=$(get_battery_percent)
    state=$(get_battery_state)
    
    # Reset when charging
    if [[ "$state" == "charging" ]]; then
        reset_state
        return
    fi
    
    # Only notify when discharging
    if [[ "$state" != "discharging" ]]; then
        return
    fi
    
    # Critical threshold
    if [[ "$percent" -le "$THRESHOLD_CRITICAL" && "$NOTIFIED_CRITICAL" == false ]]; then
        send_notification "Battery Critical" "${percent}% remaining" "rgb(ff0000)"
        NOTIFIED_CRITICAL=true
        NOTIFIED_LOW=true
    fi
    
    # Low threshold
    if [[ "$percent" -le "$THRESHOLD_LOW" && "$NOTIFIED_LOW" == false ]]; then
        send_notification "Battery Low" "${percent}% remaining" "rgb(ffa500)"
        NOTIFIED_LOW=true
    fi
}

# Main - listen for D-Bus events
main() {
    dbus-monitor --system \
        "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged',path='${BATTERY_PATH}'" \
    | while read -r _line; do
          handle_event
      done
}

main "$@"

