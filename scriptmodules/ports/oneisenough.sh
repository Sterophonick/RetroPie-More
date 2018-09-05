#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="oneisenough"
rp_module_desc="OneIsEnough - 2D platform game about the epic struggle of balls"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_oneisenough() {
    getDepends xorg matchbox fonts-dejavu-core
}

function install_bin_oneisenough() {
    [[ -f "$md_inst/oneisenough" ]] && rm -rf "$md_inst/"*
    aptInstall oneisenough
}

function remove_oneisenough() {
    aptRemove oneisenough
}

function configure_oneisenough() {
    addPort "$md_id" "oneisenough" "oneisenough" "xinit $md_inst/oneisenough.sh"

    cat >"$md_inst/oneisenough.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
oneisenough --fullscreen
_EOF_
    chmod +x "$md_inst/oneisenough.sh"
}
