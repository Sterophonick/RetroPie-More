#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="xbomb"
rp_module_desc="xbomb - Minesweeper clone"
rp_module_licence="PROP"
rp_module_section="opt"
rp_module_flags="!mali !x86 !kms"

function depends_xbomb() {
    getDepends xorg matchbox
}

function install_bin_xbomb() {
    [[ -f "$md_inst/xbomb" ]] && rm -rf "$md_inst/"*
    aptInstall xbomb
}

function remove_xbomb() {
    aptRemove xbomb
}

function configure_xbomb() {
    addPort "$md_id" "xbomb" "xbomb" "xinit $md_inst/xbomb.sh"

    cat >"$md_inst/xbomb.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
xbomb
_EOF_
    chmod +x "$md_inst/xbomb.sh"
}
