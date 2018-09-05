#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="swell-foop"
rp_module_desc="Swell Foop - colored ball puzzle game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_swell-foop() {
    getDepends xorg matchbox libc6 libclutter-1.0-0 libclutter-gtk-1.0-0 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 dconf-gsettings-backend yelp
}

function install_bin_swell-foop() {
    [[ -f "$md_inst/swell-foop" ]] && rm -rf "$md_inst/"*
    aptInstall swell-foop
}

function remove_swell-foop() {
    aptRemove swell-foop
}

function configure_swell-foop() {
    addPort "$md_id" "swell-foop" "swell-foop" "xinit $md_inst/swell-foop.sh"

    cat >"$md_inst/swell-foop.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
swell-foop
_EOF_
    chmod +x "$md_inst/swell-foop.sh"
}
