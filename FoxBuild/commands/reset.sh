#!/bin/bash

COMMAND_NAME="reset"
COMMAND_USAGE="<name>"
COMMAND_DESCRIPTIONS="To remove a project."

execute() {
    if [ ! -z $1 ]; then
        if [ -d "$(pwd)/$1" ]; then
            echo -e " \033[1;35m->\033[1;0m \033[1;33mCleaning up... ($1)\033[1;0m"
            source $(pwd)/$1/build.sh
            rm -rf $PROJECT_PATH
            echo -e " \033[1;35m->\033[1;0m \033[31;1;5m$PROJECT_NAME has been deleted.\033[1;0m"
            exit 0
        else
            echo -e " \033[1;35m->\033[1;0m \033[31;1;5m$1 not found.\033[1;0m"
            exit 1
        fi
    fi
}