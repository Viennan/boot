#!/bin/bash

is_image_existed() {
    if docker image inspect "$1" &> /dev/null; then
        return 0
    fi
    return 1
}