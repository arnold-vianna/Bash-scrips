#!/bin/bash

# Function to list open ports
list_open_ports() {
    echo "Listing open ports..."
    ss -tuln
}

# Function to check the hostname
check_hostname() {
    echo "Checking hostname..."
    hostname
}

# Function to check the FQDN
check_fqdn() {
    echo "Checking FQDN..."
    hostname -f
}

# Main menu function
show_menu() {
    echo "Select an option:"
    echo "1) List open ports"
    echo "2) Check hostname"
    echo "3) Check FQDN"
    echo "4) Exit"
    read -p "Enter your choice [1-4]: " choice

    case $choice in
        1)
            list_open_ports
            ;;
        2)
            check_hostname
            ;;
        3)
            check_fqdn
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option selected. Please try again."
            ;;
    esac
}

# Loop the menu until the user decides to exit
while true; do
    show_menu
done

