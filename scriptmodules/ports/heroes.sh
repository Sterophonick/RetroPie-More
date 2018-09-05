#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="heroes"
rp_module_desc="Heroes - 2D Platformer"
rp_module_licence="PROP"
rp_module_section="opt"
rp_module_flags="!mali !kms"

function depends_heroes() {
    getDepends xorg matchbox heroes-data libc6 libsdl-mixer1.2 libsdl1.2debian
}

function install_bin_heroes() {
    [[ -f "$md_inst/heroes" ]] && rm -rf "$md_inst/"*
    aptInstall heroes
}

function remove_heroes() {
    aptRemove heroes
}

function configure_heroes() {
    addPort "$md_id" "heroes" "heroes" "xinit $md_inst/heroes.sh"

    cat >"$md_inst/heroes.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
heroes
_EOF_
    chmod +x "$md_inst/heroes.sh"
}
