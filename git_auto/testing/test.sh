#!/bin/bash

# A simple function to add two numbers
add() {
    local a=$1
    local b=$2
    echo $((a + b))
}

# A function to check if a file exists
file_exists() {
    [[ -f "$1" ]]
}

#!/usr/bin/env bats

# Load the script that contains the functions
load 'my_functions.sh'

@test "add function works correctly" {
    result="$(add 2 3)"
    [ "$result" -eq 5 ]
}

@test "file_exists returns true for existing files" {
    touch test_file.txt
    [ "$(file_exists test_file.txt)" = true ]
    rm test_file.txt
}

@test "file_exists returns false for non-existent files" {
    [ "$(file_exists non_existent_file.txt)" = false ]
}



#!/bin/bash

# Function to validate the configuration file
validate_config() {
    local config_file="$1"

    if [[ ! -f "$config_file" ]]; then
        echo "Error: Configuration file '$config_file' does not exist."
        return 1
    fi

    # Example check: ensuring certain variables are defined
    source "$config_file"
    
    # Check if required variables are set
    if [[ -z "$REQUIRED_VAR" ]]; then
        echo "Error: REQUIRED_VAR is not set in '$config_file'."
        return 1
    fi

    echo "Configuration '$config_file' is valid."
    return 0
}

# Usage
validate_config "my_config.conf"




#!/bin/bash

# Check for shellcheck installation
if ! command -v shellcheck &> /dev/null; then
    echo "Error: shellcheck is not installed. Please install it first."
    exit 1
fi

# Function to perform quality checks
quality_check() {
    local script_file="$1"

    echo "Running quality checks on $script_file..."

    # Check for syntax errors
    bash -n "$script_file"
    if [ $? -ne 0 ]; then
        echo "Syntax error in $script_file"
        return 1
    fi

    # Run shellcheck
    shellcheck "$script_file"
    if [ $? -ne 0 ]; then
        echo "Quality checks failed for $script_file"
        return 1
    fi

    echo "Quality checks passed for $script_file"
}

# Usage
quality_check "my_functions.sh"
