#!/bin/bash

COMMAND_NAME="clean"
COMMAND_USAGE="<name>"
COMMAND_DESCRIPTIONS="Clean the projects files."

execute() {
    if [ ! -z $1 ]; then
        if [ -d "$(pwd)/$1" ]; then
            source $(pwd)/$1/build.sh
            cd $PROJECT_PATH/
            onClean
            cd ../
            echo -e " \033[1;35m->\033[1;0m \033[1;32mClean for $PROJECT_NAME Finished.\033[1;0m"
            exit 0
        else
            echo -e " \033[1;35m->\033[1;0m \033[31;1;5m$1 not found.\033[1;0m"
            exit 1
        fi
    fi
}