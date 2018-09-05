#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="numptyphysics"
rp_module_desc="Numpty Physics - crayon based physics puzzle game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_numptyphysics() {
    getDepends xorg matchbox libfontconfig1 libfreetype6 libgcc1 libsdl-image1.2 libsdl-ttf2.0-0 libstc++6 libx11-6 fonts-femkeklaver ttf-femkeklaver zlib1g
}

function install_bin_numptyphysics() {
    [[ -f "$md_inst/numptyphysics" ]] && rm -rf "$md_inst/"*
    aptInstall numptyphysics
}

function remove_numptyphysics() {
    aptRemove numptyphysics
}

function configure_numptyphysics() {
    addPort "$md_id" "numptyphysics" "numptyphysics" "xinit $md_inst/numptyphysics.sh"

    cat >"$md_inst/numptyphysics.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
numptyphysics
_EOF_
    chmod +x "$md_inst/numptyphysics.sh"
}
