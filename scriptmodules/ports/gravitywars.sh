#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="gravitywars"
rp_module_desc="Gravity Wars - Gravity Force clone"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_gravitywars() {
    getDepends xorg matchbox libsdl1.2debian
}

function install_bin_gravitywars() {
    [[ -f "$md_inst/gravitywars" ]] && rm -rf "$md_inst/"*
    aptInstall gravitywars
}

function remove_gravitywars() {
    aptRemove gravitywars
}

function configure_gravitywars() {
    addPort "$md_id" "gravitywars" "gravitywars" "xinit $md_inst/Gravity Wars.sh"

    cat >"$md_inst/Gravity Wars.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
gravitywars
_EOF_
    chmod +x "$md_inst/Gravity Wars.sh"
}
