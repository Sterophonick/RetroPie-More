#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-vemulator"
rp_module_desc="Dreamcast VMU emulator"
rp_module_help="ROM Extensions: .vmi"
rp_module_licence="GPL3 https://github.com/libretro/vemulator-libretro/blob/master/LICENSE"
rp_module_section="exp"

function sources_lr-vemulator() {
    gitPullOrClone "$md_build" https://github.com/MJaoune/vemulator-libretro
}

function build_lr-vemulator() {
    make clean
    make
    md_ret_require="$md_build/vemulator_libretro.so"
}

function install_lr-vemulator() {
    md_ret_files=(
        'README.md'
        'vemulator_libretro.so'
    )
}

function configure_lr-vemulator() {
    mkRomDir "vmu"
    ensureSystemretroconfig "vmu"
    addEmulator 1 "$md_id" "vmu" "$md_inst/vemulator_libretro.so"
    addSystem "vmu"
}