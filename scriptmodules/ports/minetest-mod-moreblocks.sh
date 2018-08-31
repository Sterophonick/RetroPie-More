#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="minetest-mod-moreblocks"
rp_module_desc="Minetest Mod - More Blocks"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !kms"

function install_bin_minetest() {
    aptInstall minetest-mod-moreblocks
}

function remove_minetest() {
    aptRemove minetest-mod-moreblocks
}

function configure_minetest() {
}
