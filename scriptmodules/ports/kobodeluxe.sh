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
rp_module_desc="kobodeluxe - game of space battle"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_kobodeluxe() {
    getDepends xorg matchbox kobodeluxe-data libsdl-image1.2 libsdl1.2debian
}

function install_bin_kobodeluxe() {
    [[ -f "$md_inst/kobodeluxe" ]] && rm -rf "$md_inst/"*
    aptInstall kobodeluxe
}

function remove_kobodeluxe() {
    aptRemove kobodeluxe
}

function configure_kobodeluxe() {
    addPort "$md_id" "kobodeluxe" "kobodeluxe" "xinit $md_inst/kobodeluxe.sh"

    cat >"$md_inst/kobodeluxe.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
kobodeluxe --fullscreen
_EOF_
sed -i "/kobodeluxe = \"DMT-4\"/" /opt/retroie/configs/all/videomodes.cfg

}
