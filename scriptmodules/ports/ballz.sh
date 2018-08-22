#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="ballz"
rp_module_desc="B.A.L.L.Z. - 2D Platformer"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !x86 !kms"

function depends_ballz() {
    getDepends xorg matchbox ballz-data
}

function install_bin_ballz() {
    [[ -f "$md_inst/scratch" ]] && rm -rf "$md_inst/"*
    aptInstall scratch
}

function remove_ballz() {
    aptRemove scratch
}

function configure_ballz() {
    addPort "$md_id" "ballz" "Ballz" "xinit $md_inst/ballz.sh"

    cat >"$md_inst/ballz.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
/usr/bin/ballz
_EOF_
    chmod +x "$md_inst/ballz.sh"
}
