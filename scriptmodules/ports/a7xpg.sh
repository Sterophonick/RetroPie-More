#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="kobodeluxe"
rp_module_desc="a7xpg - game of space battle"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_a7xpg() {
    getDepends xorg matchbox a7xpg-data libgphobos76 libsdl-mixer1.2 libsdl1.2debian
}

function install_bin_a7xpg() {
    [[ -f "$md_inst/a7xpg" ]] && rm -rf "$md_inst/"*
    aptInstall a7xpg
}

function remove_a7xpg() {
    aptRemove a7xpg
}

function configure_a7xpg() {
    addPort "$md_id" "a7xpg" "a7xpg" "xinit $md_inst/a7xpg.sh"

    cat >"$md_inst/a7xpg.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
a7xpg --fullscreen
_EOF_
sed -i "/a7xpg = \"DMT-4\"/" /opt/retroie/configs/all/videomodes.cfg

}
