#!/bin/bash

check() {
    message " \033[1;35m->\033[1;0m \033[1;33mChecking requirement...\033[1;0m"
    if [ -d "/usr/bin/git" ]; then
        if [ -d "/usr/bin/debconf" ]; then
            message " \033[1;35m->\033[1;0m \033[1;33mPlease execute 'sudo apt-get install git'.\033[1;0m"
            exit 1
        else
            message " \033[1;35m->\033[1;0m \033[1;33mPlease install 'git'.\033[1;0m"
            exit 1
        fi
    elif [ -d "/usr/bin/gcc" ]; then
        if [ -d "/usr/bin/debconf" ]; then
            message " \033[1;35m->\033[1;0m \033[1;33mPlease execute 'sudo apt-get install build-essential'.\033[1;0m"
            exit 1
        else
            message " \033[1;35m->\033[1;0m \033[1;33mPlease install 'gcc'.\033[1;0m"
            exit 1
        fi
    elif [ -d "/usr/bin/make" ]; then
        if [ -d "/usr/bin/debconf" ]; then
            message " \033[1;35m->\033[1;0m \033[1;33mPlease execute 'sudo apt-get install make'.\033[1;0m"
            exit 1
        else
            message " \033[1;35m->\033[1;0m \033[1;33mPlease install 'make'.\033[1;0m"
            exit 1
        fi
    fi
}