#!/bin/bash

SIPP_TAG="v3.6.1"
#SIPP_TAG="master"
SIPP_REPO="https://github.com/SIPp/sipp.git"
#COTAINER_BINARY="podman"
COTAINER_BINARY="docker"
# git clone --depth 1 --branch ${SIPP_TAG} ${SIPP_REPO} src
# cd src 
# git submodule update --init
# cd ../
# ${COTAINER_BINARY} build -t sipp-build -v ${PWD}/src:/src .
# ${COTAINER_BINARY} run  -it --rm -v ./src:/src sipp-build

${COTAINER_BINARY} build -t sipp-build  .
