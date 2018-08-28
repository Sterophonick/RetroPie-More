#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="nikwi"
rp_module_desc="Nikwi - platform game where your goal is to collect candies"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_nikwi() {
    getDepends xorg matchbox nikwi-data libsdl1.2debian
}

function install_bin_nikwi() {
    [[ -f "$md_inst/nikwi" ]] && rm -rf "$md_inst/"*
    aptInstall nikwi
}

function remove_nikwi() {
    aptRemove nikwi
}

function configure_nikwi() {
    addPort "$md_id" "nikwi" "nikwi" "xinit $md_inst/nikwi.sh"

    cat >"$md_inst/nikwi.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
nikwi
_EOF_
    chmod +x "$md_inst/nikwi.sh"
}
