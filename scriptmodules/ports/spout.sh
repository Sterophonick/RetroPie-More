#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="spout"
rp_module_desc="Spout - Tiny abstract black and white 2D cave-shooter"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_spout() {
    getDepends xorg matchbox libsdl1.2debian
}

function install_bin_spout() {
    [[ -f "$md_inst/spout" ]] && rm -rf "$md_inst/"*
    aptInstall spout
}

function remove_spout() {
    aptRemove spout
}

function configure_spout() {
    addPort "$md_id" "spout" "spout" "xinit $md_inst/Spout.sh"

    cat >"$md_inst/Spout.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
spout
_EOF_
    chmod +x "$md_inst/Spout.sh"
}
