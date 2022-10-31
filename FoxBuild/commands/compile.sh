#!/bin/bash

COMMAND_NAME="compile"
COMMAND_USAGE="<name>"
COMMAND_DESCRIPTIONS="Compile the project."

execute() {
    if [ ! -z $1 ]; then
        if [ -d "$(pwd)/$1" ]; then
            source $(pwd)/$1/build.sh
            cd $PROJECT_PATH/
            onBuild
            cd ../
            echo -e " \033[1;35m->\033[1;0m \033[1;32mCompilation for $PROJECT_NAME Finished.\033[1;0m"
            exit 0
        else
            echo -e " \033[1;35m->\033[1;0m \033[31;1;5m$1 not found.\033[1;0m"
            exit 1
        fi
    fi
}