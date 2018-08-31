#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="alex4"
rp_module_desc="Alex the Allegator 4 - 2D Retro Platformer"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_alex4() {
    getDepends xorg matchbox alex4-data
}

function install_bin_alex4() {
    [[ -f "$md_inst/alex4" ]] && rm -rf "$md_inst/"*
    aptInstall alex4
}

function remove_alex4() {
    aptRemove alex4
}

function configure_alex4() {
    addPort "$md_id" "alex4" "alex4" "xinit $md_inst/Alex The Allegator 4.sh"

    cat >"$md_inst/Alex the Allegator 4.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
alex4
_EOF_
    chmod +x "$md_inst/Alex the Allegator 4.sh"
}
