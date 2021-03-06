#!/bin/bash

case $1 in
    "backend")
    docker-compose --project-name=$BUILD_ID-mlm-demo up --no-color --no-start --build $1
    docker stop $(docker ps -f name=mlm-demo_$1 -q)
    docker-compose --project-name=$BUILD_ID-mlm-demo start $1
    ;;
    "admin")
    docker-compose --project-name=$BUILD_ID-mlm-demo up --no-color --no-start --build $1
    docker stop $(docker ps -f name=mlm-demo_$1 -q)
    docker-compose --project-name=$BUILD_ID-mlm-demo start $1
    ;;
    "member")
    docker-compose --project-name=$BUILD_ID-mlm-demo up --no-color --no-start --build $1
    docker stop $(docker ps -f name=mlm-demo_$1 -q)
    docker-compose --project-name=$BUILD_ID-mlm-demo start $1
    ;;
    "resource")
    docker-compose --project-name=$BUILD_ID-mlm-standard up --no-color --no-start --build $1
    docker stop $(docker ps -f name=mlm-standard_$1 -q)
    docker-compose --project-name=$BUILD_ID-mlm-standard start $1
    ;;
    *) echo please provide a service name ;;
esac
