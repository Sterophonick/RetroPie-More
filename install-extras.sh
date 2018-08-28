#!/bin/bash

RPS_HOME='~/RetroPie-Setup'
if [ ! -z "$1" ];then
    RPS_HOME="$1"
fi
if [ ! -d "$RPS_HOME" ];then
    echo "RetroPie-Setup directory $RPS_HOME doesn't exist. Please input the location of RetroPie-Setup."
    echo "EX: ./install-extras.sh ~/RetroPie-Setup"
    exit
fi

echo "Placing scriptmodules in $RPS_HOME"
cp -R scriptmodules/* $RPS_HOME/scriptmodules
