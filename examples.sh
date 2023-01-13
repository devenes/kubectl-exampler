#!/bin/bash

get_examples() {
    local example="$1"
    local examples
    if ! [ -x "$(command -v kubectl)" ]; then
        echo "Error: kubectl is not installed"
        return 1
    else 
        examples=$(kubectl create "$example" --help | sed -n "/Examples:/,/^[A-Z]/p")
        if [ -z "$examples" ]; then
            echo "No examples found for kubectl create $example command"
        else
            echo "$examples"
        fi
    fi
}

export -f get_examples
