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

function depends_gnubik() {
    getDepends xorg matchbox libgl1-mesa-glx libjpeg62-turbo libopenhmd0 libphysfs1 libpng16-16 libsdl2-2.0-0 libsdl2-ttf-2.0-0 libvorbisfile3 neverball-data
}

function install_bin_gnubik() {
    [[ -f "$md_inst/gnubik" ]] && rm -rf "$md_inst/"*
    aptInstall gnubik
}

function remove_gnubik() {
    aptRemove gnubik
}

function configure_gnubik() {
    addPort "$md_id" "gnubik" "gnubik" "xinit $md_inst/gnubik.sh"

    cat >"$md_inst/gnubik.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
gnubik
_EOF_
    chmod +x "$md_inst/gnubik.sh"
}
