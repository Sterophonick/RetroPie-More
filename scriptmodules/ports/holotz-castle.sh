#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="holotz-castle"
rp_module_desc="holotz-castle - platform game with high doses of mystery"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_holotz-castle() {
    getDepends xorg matchbox holotz-castle-data libsdl-image1.2 libsdl-mixer1.2 libsdl-ttf2.0-0 libsdl1.2debian zlib1g libstdc++6 libgcc1 libc6
}

function install_bin_holotz-castle() {
    [[ -f "$md_inst/holotz-castle" ]] && rm -rf "$md_inst/"*
    aptInstall holotz-castle
}

function remove_holotz-castle() {
    aptRemove holotz-castle
}

function configure_holotz-castle() {
    addPort "$md_id" "holotz-castle" "holotz-castle" "xinit $md_inst/Holotz-Castle.sh"

    cat >"$md_inst/Holotz-Castle.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
holotz-castle
_EOF_
    chmod +x "$md_inst/Holotz-castle.sh"
}
