#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="xjump"
rp_module_desc="XJump - Infinite tower climbing game"
rp_module_licence="PROP"
rp_module_section="opt"
rp_module_flags="!mali !x86 !kms"

function depends_xjump() {
    getDepends xorg matchbox
}

function install_bin_xjump() {
    [[ -f "$md_inst/xjump" ]] && rm -rf "$md_inst/"*
    aptInstall xjump
}

function remove_xjump() {
    aptRemove xjump
}

function configure_xjump() {
    addPort "$md_id" "xjump" "XJump" "xinit $md_inst/xjump.sh"

    cat >"$md_inst/xjump.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
xjump
_EOF_
    chmod +x "$md_inst/xjump.sh"
}
