#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="minetest"
rp_module_desc="Minetest - Multiplayer infinite-world block sandbox"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function depends_minetest() {
    getDepends xorg matchbox libcurl3-gnutils libfreetype6 libgcc1 libirrlicht1.8 libjsoncpp1 libleveldb1v5 liblua5.1-0 libluajit-5.1-2 libopenal1 libsqlite3-0 libstdc++6 libvorbisfile3 libx11-6 minetest-data zlib1g
}

function install_bin_minetest() {
    [[ -f "$md_inst/minetest" ]] && rm -rf "$md_inst/"*
    aptInstall minetest
}

function remove_minetest() {
    aptRemove minetest
}

function configure_minetest() {
    addPort "$md_id" "minetest" "minetest" "xinit $md_inst/Minetest.sh"

    cat >"$md_inst/Minetest.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
minetest
_EOF_
    chmod +x "$md_inst/Minetest.sh"
}
