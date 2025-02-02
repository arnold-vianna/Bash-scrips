#!/bin/bash

# Function to display the menu
function show_menu() {
    echo "==============================="
    echo "     IPConfig Commands Menu"
    echo "==============================="
    echo "1) Display basic IP configuration"
    echo "2) Display detailed IP configuration"
    echo "3) Release the current IP address"
    echo "4) Renew the IP address"
    echo "5) Flush DNS cache"
    echo "6) Display DNS cache"
    echo "7) Register DNS"
    echo "8) Show all interfaces"
    echo "9) Show IPv6 statistics"
    echo "10) Display help for ipconfig"
    echo "11) Exit"
    echo "==============================="
    echo -n "Enter your choice [1-11]: "
}

# Function to execute selected ipconfig command
function execute_ipconfig() {
    case $1 in
        1)
            echo "Running 'ipconfig' (Basic IP Configuration)..."
            powershell -Command "ipconfig"
            ;;
        2)
            echo "Running 'ipconfig /all' (Detailed IP Configuration)..."
            powershell -Command "ipconfig /all"
            ;;
        3)
            echo "Running 'ipconfig /release' (Release IP Address)..."
            powershell -Command "ipconfig /release"
            ;;
        4)
            echo "Running 'ipconfig /renew' (Renew IP Address)..."
            powershell -Command "ipconfig /renew"
            ;;
        5)
            echo "Running 'ipconfig /flushdns' (Flush DNS Cache)..."
            powershell -Command "ipconfig /flushdns"
            ;;
        6)
            echo "Running 'ipconfig /displaydns' (Display DNS Cache)..."
            powershell -Command "ipconfig /displaydns"
            ;;
        7)
            echo "Running 'ipconfig /registerdns' (Register DNS)..."
            powershell -Command "ipconfig /registerdns"
            ;;
        8)
            echo "Running 'ipconfig /allcompartments' (Show All Interfaces)..."
            powershell -Command "ipconfig /allcompartments"
            ;;
        9)
            echo "Running 'ipconfig /showclassid6' (Show IPv6 Statistics)..."
            powershell -Command "ipconfig /showclassid6"
            ;;
        10)
            echo "Running 'ipconfig /?' (Display Help)..."
            powershell -Command "ipconfig /?"
            ;;
        11)
            echo "Exiting... Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

# Main loop
while true; do
    show_menu
    read choice
    execute_ipconfig $choice
    echo
done
