#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-lutro"
rp_module_desc="lr-lutro - An experimental lua game framework for libretro following the LÖVE API"
rp_module_help="ROM Extensions: .lutro"
rp_module_licence="GPL3 https://github.com/libretro/lutro-libretro/blob/master/LICENSE"
rp_module_section="exp"

function sources_lr-lutro() {
    gitPullOrClone "$md_build" https://github.com/libretro/libretro-lutro
}

function build_lr-lutro() {
    make clean
    make libretro
    md_ret_require="$md_build/lutro_libretro.so"
}

function install_lr-lutro() {
    md_ret_files=(
        'README.md'
        'lutro_libretro.so'
    )
}

function configure_lr-lutro() {
    mkRomDir "lutro"
    ensureSystemretroconfig "lutro"
    addEmulator 1 "$md_id" "lutro" "$md_inst/lutro_libretro.so"
    addSystem "lutro"
}