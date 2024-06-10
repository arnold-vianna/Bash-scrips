#!/bin/bash

while true; do
    clear
    echo "====================="
    echo "  Menu Options"
    echo "====================="
    echo "1. View Windows Event Viewer Logs"
    echo "2. View Network Information"
    echo "3. Reset Password"
    echo "4. Show System Information"
    echo "5. List All Tasks"
    echo "6. Kill Task"
    echo "7. List Software and Versions"
    echo "8. Exit"
    echo "====================="
    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Viewing Windows Event Viewer Logs..."
            eventvwr
            ;;
        2)
            echo "Viewing Network Information..."
            ipconfig /all
            ;;
        3)
            read -p "Enter username to reset password: " username
            echo "Resetting password for user $username..."
            net user $username *
            ;;
        4)
            echo "Showing System Information..."
            systeminfo
            ;;
        5)
            echo "Listing all tasks..."
            tasklist
            ;;
        6)
            read -p "Enter process name to kill: " process_name
            echo "Killing process $process_name..."
            taskkill /F /IM $process_name
            ;;
        7)
            echo "Listing Software and Versions..."
            wmic product get name,version
            ;;
        8)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid option."
            ;;
    esac

    read -p "Press Enter to continue..."
done
