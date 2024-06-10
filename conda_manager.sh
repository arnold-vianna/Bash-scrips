#!/bin/bash

# Function to download and install Miniconda
install_miniconda() {
    echo "Downloading Miniconda installer..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

    echo "Making the installer executable..."
    chmod +x Miniconda3-latest-Linux-x86_64.sh

    echo "Running the installer..."
    ./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3

    echo "Initializing Conda..."
    $HOME/miniconda3/bin/conda init

    echo "Applying changes..."
    source ~/.bashrc

    echo "Conda installation complete!"
    conda --version
}

# Function to create a new Conda environment
create_env() {
    read -p "Enter the name of the environment: " env_name
    read -p "Enter the Python version (e.g., 3.8): " python_version
    conda create --name "$env_name" python="$python_version"
}

# Function to activate a Conda environment
activate_env() {
    read -p "Enter the name of the environment to activate: " env_name
    conda activate "$env_name"
}

# Function to deactivate the current Conda environment
deactivate_env() {
    conda deactivate
}

# Function to list all Conda environments
list_envs() {
    conda env list
}

# Function to install a package in a Conda environment
install_package() {
    read -p "Enter the name of the package to install: " package_name
    conda install "$package_name"
}

# Function to update Conda
update_conda() {
    conda update conda
}

# Function to update all packages in the current Conda environment
update_packages() {
    conda update --all
}

# Function to remove a Conda environment
remove_env() {
    read -p "Enter the name of the environment to remove: " env_name
    conda env remove --name "$env_name"
}

# Menu function
menu() {
    while true; do
        echo "----------------------------------------"
        echo "Conda Installer and Manager"
        echo "----------------------------------------"
        echo "1. Install Miniconda"
        echo "2. Create a new Conda environment"
        echo "3. Activate a Conda environment"
        echo "4. Deactivate the current Conda environment"
        echo "5. List all Conda environments"
        echo "6. Install a package in a Conda environment"
        echo "7. Update Conda"
        echo "8. Update all packages in the current Conda environment"
        echo "9. Remove a Conda environment"
        echo "10. Exit"
        echo "----------------------------------------"
        read -p "Choose an option: " choice

        case $choice in
            1) install_miniconda ;;
            2) create_env ;;
            3) activate_env ;;
            4) deactivate_env ;;
            5) list_envs ;;
            6) install_package ;;
            7) update_conda ;;
            8) update_packages ;;
            9) remove_env ;;
            10) break ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# Run the menu
menu
