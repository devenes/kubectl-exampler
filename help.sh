# Description: Get examples from kubectl help for a command
GREEN='\033[1;32m'
RED='\033[1;31m'

read -p "Enter kubectl command you want to see the examples for
(example: create deployment): " input

if [ -z "$input" ]; then
    echo "You must enter a command"
    exit 1
else
    if ! [ -x "$(command -v kubectl)" ]; then
        echo -e "${RED}Error: kubectl is not installed"
        exit 1
    else 
        echo -e "${GREEN}Examples for kubectl $input command:"
        kubectl $input --help | sed -n "/Examples:/,/^[A-Z]/p"  |grep -v "#"
        if ! [ $? -eq 0 ]; then
            echo -e "${RED}No examples found for kubectl $input command"
        fi
    fi
fi