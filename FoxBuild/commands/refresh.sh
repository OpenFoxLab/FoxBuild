#!/bin/bash

COMMAND_NAME="refresh"
COMMAND_USAGE="<name>"
COMMAND_DESCRIPTIONS="To setup the environement"

execute() {
    if [ ! -z $1 ]; then
        if [ -d "$(pwd)/$1" ]; then
            if [ -d "$(pwd)/$1/.refresh.lock" ]; then
                echo -e " \033[1;35m->\033[1;0m \033[1;31mRefresh already running for $1.\033[1;0m"
                exit 3
            fi
            source $(pwd)/$1/build.sh
            touch $(pwd)/$1/.refresh.lock
            cd $(pwd)/$PROJECT_NAME
            repos
            cd ../
            echo -e " \033[1;35m->\033[1;0m \033[1;33mClonning repos for $PROJECT_NAME.\033[1;0m"
            rm $(pwd)/$1/.refresh.lock
            exit 0
        else
            echo -e " \033[1;35m->\033[1;0m \033[31;1;5m$1 not found.\033[1;0m"
            exit 1
        fi
    fi
}