#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-theodore"
rp_module_desc="lr-theodore - Thomson TO8 Emu for libretro"
rp_module_help="ROM Extension: .iso\n\nCopy your 3do roms to $romdir/3do\n\nCopy the required BIOS file panazf10.bin to $biosdir"
rp_module_licence="LGPL https://raw.githubusercontent.com/libretro/theodore-libretro/master/libfreedo/_3do_sys.c"
rp_module_section="exp"

function sources_lr-theodore() {
    gitPullOrClone "$md_build" https://github.com/Zlika/theodore.git
}

function build_lr-theodore() {
    make clean
    make
    md_ret_require="$md_build/theodore_libretro.so"
}

function install_lr-theodore() {
    md_ret_files=(
        'theodore_libretro.so'
    )
}

function configure_lr-theodore() {
    mkRomDir "to8"
    ensureSystemretroconfig "to8"

    addEmulator 1 "$md_id" "to8" "$md_inst/theodore_libretro.so"
    addSystem "to8"
}
