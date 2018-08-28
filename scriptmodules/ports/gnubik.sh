#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="gnubik"
rp_module_desc="GNUbik - GNU Rubik's Cube"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_gnubik() {
    getDepends xorg matchbox guile-2.0-libs libatk1.0-0 libc6 libcaio2 libfontconfig1 libfreetype6 libgc1c2 libgdk-pixbuf2.0-0 libgl1-mesa-gix libglib2.0-0 libglu1-mesa libgtkglext1 libice6 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpangox-1.0-0 libsm6 libx11-6 libxmu6 libxt6
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
