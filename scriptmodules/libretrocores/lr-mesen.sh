#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-mesen"
rp_module_desc="NES Emulator - Mesen port for libretro"
rp_module_help="ROM Extensions: .nes"
rp_module_licence="GPL3 https://github.com/libretro/mesen-libretro/blob/master/LICENSE"
rp_module_section="exp"

function sources_lr-mesen() {
    gitPullOrClone "$md_build" https://github.com/SourMesen/mesen-libretro.git
}

function build_lr-mesen() {
    make clean
    make libretro
    md_ret_require="$md_build/mesen_libretro.so"
}

function install_lr-mesen() {
    md_ret_files=(
        'README.md'
        'mesen_libretro.so'
    )
}

function configure_lr-mesen() {
    mkRomDir "nes"
    ensureSystemretroconfig "nes"
    addEmulator 1 "$md_id" "nes" "$md_inst/mesen_libretro.so"
    addSystem "nes"
}