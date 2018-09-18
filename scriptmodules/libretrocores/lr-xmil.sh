#!/usr/bin/env bash
# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are too numerous to list 
# here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and at 
# https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
rp_module_id="lr-xmil"
rp_module_desc="Libretro port of X Millenium Sharp X1 Emulator" 
rp_module_help="ROM Extensions: "
rp_module_licence="???"
rp_module_section="exp"
function sources_lr-xmil() {
    gitPullOrClone "$md_build" https://github.com/r-type/xmil-libretro.git
}
function build_lr-xmil() {
    cd libretro
	make clean
	make
    md_ret_require="$md_build/libretro/x1_libretro.so"
}
function install_lr-xmil() {
    md_ret_files=(
        'README.MD'
        'libretro/x1_libretro.so'
    )
}
function configure_lr-xmil() {
    mkRomDir "sharpx1"
    ensureSystemretroconfig "sharpx1"
    addEmulator 1 "$md_id" "sharpx1" "$md_inst/x1_libretro.so"
    addSystem "sharpx1"
}
