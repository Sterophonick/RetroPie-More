#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="tuxfootball"
rp_module_desc="Tux Football - Soccer game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_tuxfootball() {
    getDepends xorg matchbox libc6 libgcc1 libsdl-image1.2 libsdl-mixer1.2 libsdl1.2debian libstdc++6
}

function install_bin_tuxfootball() {
    [[ -f "$md_inst/tuxfootball" ]] && rm -rf "$md_inst/"*
    aptInstall tuxfootball
}

function remove_tuxfootball() {
    aptRemove tuxfootball
}

function configure_tuxfootball() {
    addPort "$md_id" "tuxfootball" "tuxfootball" "xinit $md_inst/tuxfootball.sh"

    cat >"$md_inst/tuxfootball.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
tuxfootball
_EOF_
    chmod +x "$md_inst/tuxfootball.sh"
}
