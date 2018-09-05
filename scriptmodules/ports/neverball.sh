#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="neverball"
rp_module_desc="NeverBall - 3D floor-tilting game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_neverball() {
    getDepends xorg matchbox libgl1-mesa-glx libjpeg62-turbo libopenhmd0 libphysfs1 libpng16-16 libsdl2-2.0-0 libsdl2-ttf-2.0-0 libvorbisfile3 neverball-data
}

function install_bin_neverball() {
    [[ -f "$md_inst/neverball" ]] && rm -rf "$md_inst/"*
    aptInstall neverball
}

function remove_neverball() {
    aptRemove neverball
}

function configure_neverball() {
    addPort "$md_id" "neverball" "neverball" "xinit $md_inst/neverball.sh"

    cat >"$md_inst/neverball.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
neverball
_EOF_
    chmod +x "$md_inst/neverball.sh"
}
