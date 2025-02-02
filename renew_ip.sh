#!/bin/bash

# Release IP address
powershell -Command "ipconfig /release"

# Wait for 5 seconds
sleep 5

# Renew IP address
powershell -Command "ipconfig /renew"

echo "IP address released and renewed successfully."
