#!/bin/bash
# FoxBuild imports.
source $PWD/FoxBuild/utils/logger.sh
source $PWD/FoxBuild/utils/check.sh
source $PWD/FoxBuild/config.sh

# Requirement check.
check

# Commands arrays.
source $PWD/FoxBuild/commands/load.sh

if [ -z $1 ]; then
    custom " \033[1;35m->\033[1;0m \033[1;33mUsage:\033[1;0m"
    custom "  \033[1;35m->\033[1;0m \033[1;32m./${0##*/} info           | Get info of the script.\033[1;0m"
    for COMMANDS in $COMMANDS; do
        source $PWD/FoxBuild/commands/${COMMANDS}
        custom "  \033[1;35m->\033[1;0m \033[1;32m./${0##*/} $COMMAND_NAME $COMMAND_USAGE | $COMMAND_DESCRIPTIONS.\033[1;0m"
    done
    exit 0
fi

if [ "$1" == "info" ]; then
    custom " \033[1;35m->\033[1;0m \033[1;33mScript info:\033[1;0m"
    custom "  \033[1;35m->\033[1;0m \033[1;33mAuthor: \033[1;0m"
    custom "   \033[1;35m->\033[1;0m \033[1;32mVakea <fernix2code@gmail.com> \033[1;0m"
    custom "  \033[1;35m->\033[1;0m \033[1;33mVersion: \033[1;32m1.2.4\033[1;0m"
    custom "  \033[1;35m->\033[1;0m \033[1;33mLicence: \033[1;32mMIT\033[1;0m"
    custom "  \033[1;35m->\033[1;0m \033[1;33mDescriptions: \033[1;32mThis script is made for setup and compiled ProxMox.\033[1;0m"
    exit 0
fi

# Execute external command.
if [ ! -z $1 ]; then
    for COMMANDS in $COMMANDS; do
        ARGS="$1"
        ARGS="${ARGS}.sh"
        
        if [ ${COMMANDS} == $ARGS ]; then
            source $PWD/FoxBuild/commands/$ARGS
            if [ -z $2 ]; then
                error "Invalid arguments."
                info "Usage: ./${0##*/} $COMMAND_NAME $COMMAND_USAGE"
                exit 0
            fi
            execute "$2" "$3" "$4"
            exit 0
        fi
    done
fi

#
# Future space for new feature.
#
