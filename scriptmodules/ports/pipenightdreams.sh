#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="pipenightdreams"
rp_module_desc="PipeNightDreams - 2D Puzzle Game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !x86 !kms"

function depends_pipenightdreams() {
    getDepends xorg matchbox pipenightdreams-data
}

function install_bin_pipenightdreams() {
    [[ -f "$md_inst/pipenightdreams" ]] && rm -rf "$md_inst/"*
    aptInstall pipenightdreams
}

function remove_pipenightdreams() {
    aptRemove pipenightdreams
}

function configure_pipenightdreams() {
    addPort "$md_id" "pipenightdreams" "PipeNightDreams" "xinit $md_inst/pipenightdreams.sh"

    cat >"$md_inst/pipenightdreams.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
/usr/bin/pipenightdreams
_EOF_
    chmod +x "$md_inst/pipenightdreams.sh"
}
