#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="pifox"
rp_module_desc="PiFox - Open Source 3D Rail Shooter"
rp_module_licence="https://raw.githubusercontent.com/ICTeam28/PiFox/master/LICENSE"
rp_module_section="exp"

function depends_pifox() {
    getDepends xorg matchbox binutils-arm-none-eabi cmake
}

function sources_pifox() {
    gitPullOrClone "$md_build" https://github.com/ICTeam28/PiFox.git
	
}

function build_pifox() {
	mkdir build
	cd build 
	cmake ..
	make
}

function install_pifox() {
    md_ret_files=(
        'vfsroot'
        'src/pifoxExe'
    )
}

function configure_pifox() {
    addPort "$md_id" "pifox" "Commander Genius" "pushd $md_inst; ./pifoxExe; popd"

    mkRomDir "ports/$md_id"

    moveConfigDir "$home/.CommanderGenius"  "$md_conf_root/$md_id"
    moveConfigDir "$md_conf_root/$md_id/games"  "$romdir/ports/$md_id"
}
