#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="xsoldier"
rp_module_desc="XSoldier - shoot 'em up game with the \"not shooting\" bonus"
rp_module_licence="PROP"
rp_module_section="opt"
rp_module_flags="!mali !x86 !kms"

function depends_xsoldier() {
    getDepends xorg matchbox libsdl-image1.2 libsdl1.2debian
}

function install_bin_xsoldier() {
    [[ -f "$md_inst/xsoldier" ]] && rm -rf "$md_inst/"*
    aptInstall xsoldier
}

function remove_xsoldier() {
    aptRemove xsoldier
}

function configure_xsoldier() {
    addPort "$md_id" "xsoldier" "xsoldier" "xinit $md_inst/xsoldier.sh"

    cat >"$md_inst/xsoldier.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
xsoldier
_EOF_
    chmod +x "$md_inst/xsoldier.sh"
}
