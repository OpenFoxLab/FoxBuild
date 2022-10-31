#!/bin/bash

info() {
    echo -e " \033[1;35m->\033[1;0m \033[1;33m$1\033[1;0m"
}

warning() {
    echo -e " \033[1;35m->\033[1;0m \033[1;33m$1\033[1;0m"
}

error() {
    echo -e " \033[1;35m->\033[1;0m \033[1;31m$1\033[1;0m"
}

errorBlink() {
    echo -e " \033[1;35m->\033[1;0m \033[31;1;5m$1\033[1;0m"
}

message() {
    echo -e "$1"
}

custom() {
    echo -e "$1"
}
