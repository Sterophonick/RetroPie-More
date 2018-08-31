#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="blobwars"
rp_module_desc="Blob Wars: Metal Blob Solid - platform shooting game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_blobwars() {
    getDepends xorg matchbox blobwars-data libsdl2-2.0-0 libsdl2-image-2.0-0 libsdl2-mixer-2.0-0 libsdl2-net-2.0-0 libsdl2-ttf-2.0-0 libstdc++6 zlib1g
}

function install_bin_blobwars() {
    [[ -f "$md_inst/blobwars" ]] && rm -rf "$md_inst/"*
    aptInstall blobwars
}

function remove_blobwars() {
    aptRemove blobwars
}

function configure_blobwars() {
    addPort "$md_id" "blobwars" "blobwars" "xinit $md_inst/Blob Wars - Metal Blob Solid.sh"

    cat >"$md_inst/Blob Wars - Metal Blob Solid.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
blobwars
_EOF_
    chmod +x "$md_inst/Blob Wars - Metal Blob Solid.sh"
}
