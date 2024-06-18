#!/bin/bash

# ASCII art
echo -e "\e[38;5;203m
_________ _______    _______           _        _        _______  _______ 
\__   __/(  ____ )  (  ____ )|\     /|( \      ( \      (  ____ \(  ____ )
   ) (   | (    )|  | (    )|| )   ( || (      | (      | (    \/| (    )|
   | |   | (____)|  | (____)|| |   | || |      | |      | (__    | (____)|
   | |   |  _____)  |  _____)| |   | || |      | |      |  __)   |     __)
   | |   | (        | (      | |   | || |      | |      | (      | (\ (   
___) (___| )        | )      | (___) || (____/\| (____/\| (____/\| ) \ \__
\_______/|/         |/       (_______)(_______/(_______/(_______/|/   \__/
\e[0m"

# Pink text function
function echo_pink {
    echo -e "\e[38;5;211m$1\e[0m"
}

# Orange text function
function echo_orange {
    echo -e "\e[38;5;214m$1\e[0m"
}

# Display "by d2"
echo_orange "by d2"

# Prompt start and stop
echo -e "\e[1;33mPress any key to start capturing IPs using tcpdump. Press Ctrl+C to stop...\e[0m"
read -rsp $'Press any key to continue...\n' -n1 key

# Capture traffic, process IPs, and output results
capture_traffic() {
    tcpdump -n | while read -r line; do
        timestamp=$(date +"%Y-%m-%d %H:%M:%S")
        ip=$(echo "$line" | awk '{print $3}' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}')
        
        # Display timestamp and IP address horizontally
        echo -e "[$timestamp]    \e[38;5;211m$ip\e[0m"
    done
}

# Run capture function until Ctrl+C is pressed
capture_traffic

echo -e "\e[38;5;203mCapture stopped.\e[0m"
