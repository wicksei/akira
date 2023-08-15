#!/bin/bash

# Set the time for restart (5 AM)
restart_time="05:00"

# Get the current time in HH:MM format
current_time=$(date +"%H:%M")

# Check if it's the restart time
if [ "$current_time" == "$restart_time" ]; then
    echo "[$(date)] Restarting LXC containers"

    # List all running LXC containers and restart them
    for container_id in $(pct list | awk 'NR>1 {print $1}'); do
        echo "[$(date)] Restarting LXC container $container_id"
        pct stop "$container_id"
        pct start "$container_id"
    done

    echo "[$(date)] All LXC containers restarted"
else
    echo "[$(date)] It's not time to restart LXC containers yet"
fi
# chmod +x /path/to/your/script.sh
# crontab -e
# 0 5 * * * /path/to/your/script.sh
