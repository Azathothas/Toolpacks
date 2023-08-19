#!/bin/bash

# initialize arrays to hold patterns and antipatterns
patterns=()
antipatterns=()

# parse command line arguments
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s|--scope)
    scope_file="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    echo "Usage: $0 [-s|--scope SCOPE_FILE]"
    echo "Filters a list of domains to those that match patterns in a scope file."
    echo ""
    echo "Options:"
    echo "-s, --scope SCOPE_FILE  Path to the scope file to use. If not provided,"
    echo "                        the script will look for a .scope file in the"
    echo "                        current directory and parent directories."
    echo "-h, --help              Show this help message."
    exit 0
    ;;
    *)    # unknown option
    echo "Unknown option: $1"
    exit 1
    ;;
esac
done

# read patterns and antipatterns from scope file
if [[ -n "$scope_file" ]]; then
    while read line; do
        line=$(echo $line | tr -d '\r\n') # remove any line endings
        if [[ -z "$line" ]]; then
            continue # skip empty lines
        fi
        if [[ ${line:0:1} == '!' ]]; then
            antipatterns+=("${line:1}")
        else
            patterns+=("$line")
        fi
    done < "$scope_file"
else
    # look for .scope file in current directory and parent directories
    checker="notfound"
    while [[ "$checker" == "notfound" ]]; do
        if [[ -f ".scope" ]]; then
            checker="found"
            while read line; do
                line=$(echo $line | tr -d '\r\n') # remove any line endings
                if [[ -z "$line" ]]; then
                    continue # skip empty lines
                fi
                if [[ ${line:0:1} == '!' ]]; then
                    antipatterns+=("${line:1}")
                else
                    patterns+=("$line")
                fi
            done < ".scope"
        else
            cd ..
            if [[ $(pwd) == '/' ]]; then
                echo "Could not find .scope file"
                exit 1
            fi
        fi
    done
fi

# check if domain is in scope
function in_scope {
    domain="$1"
    if [[ $domain == http* ]]; then
        domain=$(echo "$domain" | awk -F/ '{print $3}') # extract domain from URL
    fi
    for p in "${patterns[@]}"; do
        if [[ $domain =~ $p ]]; then
            for a in "${antipatterns[@]}"; do
                if [[ $domain =~ $a ]]; then
                    return 1
                fi
            done
            return 0
        fi
    done
    return 1
}

# read input from stdin and print domains that are in scope
while read line; do
    line=$(echo $line | tr -d '\r\n') # remove any line endings
    if in_scope "$line"; then
        echo "$line"
    fi
done < /dev/stdin
