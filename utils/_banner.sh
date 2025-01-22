#!/bin/bash

# Set TERM variable if not set
if [ -z "$TERM" ]; then
    export TERM=xterm-256color
fi

# Reset
Color_Off='\033[0m'       # Text Reset

# Blue Colors
Blue='\033[0;34m'         # Blue
Light_Blue='\033[1;34m'   # Light Blue

# Function to center and color text
print_centered() {
    local input="$1"
    local color="$2"
    local term_width=$(tput -T xterm-256color cols)
    local text_width=${#input}

    # Strip color codes for width calculation
    local stripped_input=$(echo -e "$input" | sed 's/\x1b\[[0-9;]*m//g')
    local stripped_width=${#stripped_input}

    # Calculate padding
    local pad_width=$(( (term_width - stripped_width) / 2 ))
    local padding=$(printf '%*s' "$pad_width")

    # Print with color and padding
    echo -e "${padding}${color}${input}${Color_Off}"
}

# Define BANNER_ART here
BANNER_ART="
    ____  _______    ____________  _   ___   _______________________    ____
   / __ \/ ____/ |  / / ____/ __ \/ | / / | / / ____/ ____/_  __/   |  /  _/
  / / / / __/  | | / / /   / / / /  |/ /  |/ / __/ / /     / / / /| |  / /  
 / /_/ / /___  | |/ / /___/ /_/ / /|  / /|  / /___/ /___  / / / ___ |_/ /   
/_____/_____/  |___/\____/\____/_/ |_/_/ |_/_____/\____/ /_/ /_/  |_/___/   
                                                                             "

print_banner() {
    # Clear the screen
    clear

    # Print banner art line by line, centered with animation
    while IFS= read -r line; do
        print_centered "$line" "$Blue"
        sleep 0.1
    done <<< "$BANNER_ART"

    # Print information text, centered
    print_centered "DEVCONNECTAI" "$Light_Blue"
    print_centered "Compartilhar, vender ou fornecer essa solução" "$Light_Blue"
    print_centered "sem autorização é crime previsto no artigo 184" "$Light_Blue"
    print_centered "do código penal que descreve a conduta criminosa" "$Light_Blue"
    print_centered "de infringir os direitos autorais da DEVCONNECTAI." "$Light_Blue"
    print_centered "PIRATEAR ESSA SOLUÇÃO É CRIME." "$Light_Blue"
    print_centered "© DEVCONNECTAI" "$Light_Blue"

    # Ensure the color settings are reset
    echo -e "$Color_Off"
}

# Call the function print_banner here, if necessary
print_banner