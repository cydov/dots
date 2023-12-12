function startbar -d "Kills any running Waybars, then restarts it."
    killall waybar
    sleep 0.2
    waybar &
end