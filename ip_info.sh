#!/bin/bash

# https://github.com/arnold-vianna
# AUTHOR Arnold, Vianna
# ip_info.sh - A script to check public IP address using various methods
# Usage: ./ip_info.sh 
# This script provides a menu to select different methods to check your public IP address
# and displays the private IP address passed as an argument (if provided). if not will use the systems current systems public ip


# Function to check public IP
check_public_ip() {
    local option=$1
    case $option in
        1) echo "Using curl ifconfig.me"; curl ifconfig.me ;;
        2) echo "Using curl icanhazip.com"; curl icanhazip.com ;;
        3) echo "Using curl ipinfo.io/ip"; curl ipinfo.io/ip ;;
        4) echo "Using wget ifconfig.me"; wget -qO- ifconfig.me ;;
        5) echo "Using wget icanhazip.com"; wget -qO- icanhazip.com ;;
        6) echo "Using wget ipinfo.io/ip"; wget -qO- ipinfo.io/ip ;;
        7) echo "Using dig opendns.com"; dig +short myip.opendns.com @resolver1.opendns.com ;;
        8) echo "Using host opendns.com"; host myip.opendns.com resolver1.opendns.com ;;
        9) echo "Using curl ipinfo.io for detailed info"; curl ipinfo.io ;;
        10) echo "Using lynx ifconfig.me"; lynx -dump ifconfig.me ;;
        *) echo "Invalid option";;
    esac
}

# Display menu
echo "Choose an option to check your public IP address:"
echo "1. curl ifconfig.me"
echo "2. curl icanhazip.com"
echo "3. curl ipinfo.io/ip"
echo "4. wget ifconfig.me"
echo "5. wget icanhazip.com"
echo "6. wget ipinfo.io/ip"
echo "7. dig opendns.com"
echo "8. host opendns.com"
echo "9. curl ipinfo.io (detailed)"
echo "10. lynx ifconfig.me"
echo ""

# Read user input
read -p "Enter your choice (1-10): " choice

# Check public IP based on user choice
check_public_ip $choice

# Display the private IP address passed as an argument
if [ -n "$1" ]; then
    echo ""
    echo "The private IP address you provided is: $1"
else
    echo ""
    echo "No private IP address provided."
fi
