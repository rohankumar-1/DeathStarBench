#!/bin/bash

# Kill any existing instance of the script
pkill -f "/home/spike_script.py"

# Wait briefly to ensure process is killed
sleep 2

# Choose a random value (25, 50, or 75)
RANDOM_VALUE=$(shuf -n1 -e 25 50 75)
echo $RANDOM_VALUE

# Run the script with the random value as an argument
python3 /home/spike_script.py -a cpu -d 5 -w 5 -u "$RANDOM_VALUE" &