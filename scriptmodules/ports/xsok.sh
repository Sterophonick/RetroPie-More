#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="xsokoban"
rp_module_desc="Xsokoban - Block Pushing Puzzle Game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !x86 !kms"

function depends_xsokoban() {
    getDepends xorg matchbox
}

function install_bin_xsokoban() {
    [[ -f "$md_inst/xsokoban" ]] && rm -rf "$md_inst/"*
    aptInstall xsok
}

function remove_xsokoban() {
    aptRemove xsok
}

function configure_xsokoban() {
    addPort "$md_id" "xsokoban" "xsokoban" "xinit $md_inst/xsok.sh"

    cat >"$md_inst/xsok.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
xsok
_EOF_
    chmod +x "$md_inst/xsok.sh"
}
