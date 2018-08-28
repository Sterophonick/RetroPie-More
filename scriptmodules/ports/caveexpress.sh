#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="caveexpress"
rp_module_desc="Cave Express - 2D platformer with physics-based gameplay"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_caveexpress() {
    getDepends xorg matchbox caveexpress-data libbox2d2.3.0 liblua5.2-0 libmodplug1 libsdl2-mixer-2.0-0 libsdl2-net-2.0-0
}

function install_bin_caveexpress() {
    [[ -f "$md_inst/caveexpress" ]] && rm -rf "$md_inst/"*
    aptInstall caveexpress
}

function remove_caveexpress() {
    aptRemove caveexpress
}

function configure_caveexpress() {
<<<<<<< HEAD
    addPort "$md_id" "caveexpress" "caveexpress" "xinit $md_inst/Cave Express.sh"
=======
    addPort "$md_id" "caveexpress" "caveexpres" "xinit $md_inst/Cave Express.sh"
>>>>>>> 12d4679ddca40cd205cf7c35330e42317c52bbb9

    cat >"$md_inst/Cave Express.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
caveexpress
_EOF_
    chmod +x "$md_inst/Cave Express.sh"
}
