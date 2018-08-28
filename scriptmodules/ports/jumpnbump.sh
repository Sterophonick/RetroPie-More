#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="jumpnbump"
rp_module_desc="Jump 'n Bump - cute multiplayer platform game with bunnies"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_jumpnbump() {
    getDepends xorg matchbox imagemagick libbz2-1.0 libsdl-mixer1.2 libsdl-net1.2 libsdl1.2debian python pythong-glade2 python-gtk2 zlib1g jumpnbump-levels
}

function install_bin_jumpnbump() {
    [[ -f "$md_inst/jumpnbump" ]] && rm -rf "$md_inst/"*
    aptInstall jumpnbump
}

function remove_jumpnbump() {
    aptRemove jumpnbump
}

function configure_jumpnbump() {
    addPort "$md_id" "jumpnbump" "jumpnbump" "xinit $md_inst/jumpnbump.sh"

    cat >"$md_inst/jumpnbump.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
jumpnbump
_EOF_
    chmod +x "$md_inst/jumpnbump.sh"
}
