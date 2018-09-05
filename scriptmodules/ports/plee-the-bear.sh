#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="plee-the-bear"
rp_module_desc="Plee The Bear - 2D platform game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_plee-the-bear() {
    getDepends xorg matchbox plee-the-bear-data libboost-filesystem1.62.0 libboost-regex1.62.0 libboost-thread1.62.0 libc6 libclaw-application1v5 libclaw-configuration-file1v5 libclaw-dynamic-library1v5 libclaw-graphic1v5 libclaw-logger1v5 libclaw-net1v5 libclaw-tween1v5 libgcc1 libgl1-mesa-glx libsdl-mixer1.2 libsdl1.2debian libstdc++6
}

function install_bin_plee-the-bear() {
    [[ -f "$md_inst/plee-the-bear" ]] && rm -rf "$md_inst/"*
    aptInstall plee-the-bear
}

function remove_plee-the-bear() {
    aptRemove plee-the-bear
}

function configure_plee-the-bear() {
    addPort "$md_id" "plee-the-bear" "plee-the-bear" "xinit $md_inst/plee-the-bear.sh"

    cat >"$md_inst/plee-the-bear.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
plee-the-bear
_EOF_
    chmod +x "$md_inst/plee-the-bear.sh"
}
