#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="xmoto"
rp_module_desc="XMoto - Motorcross Platforming Game"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !x86 !kms"

function depends_xmoto() {
    getDepends xorg matchbox xmoto-data libbz2-1.0 libc6 libcurl3-gnutls libgcc1 libgl1 libglu1 libjpeg62-turbo liblua5.1-0 libode6 libpng16-16 libsdl-mixer1.2 libsdl-net1.2 libsdl-ttf2.0-0 libsdl1.2debian libsqlite3-0 libstdc++6 libxdg-basedir1 libxml2 zlib1g
}

function install_bin_xmoto() {
    [[ -f "$md_inst/xmoto" ]] && rm -rf "$md_inst/"*
    aptInstall xmoto
}

function remove_xmoto() {
    aptRemove xmoto
}

function configure_xmoto() {
    addPort "$md_id" "xmoto" "XMoto" "xinit $md_inst/xmoto.sh"

    cat >"$md_inst/xmoto.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
xmoto
_EOF_
    chmod +x "$md_inst/xmoto.sh"
}
