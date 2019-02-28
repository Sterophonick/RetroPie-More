#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-simcoupe"
rp_module_desc="Sam Coupe emulator SimCoupe port for libretro"
rp_module_help="ROM Extensions: .sad"
rp_module_licence="GPL3 https://github.com/libretro/simcoupe-libretro/blob/master/LICENSE"
rp_module_section="exp"

function sources_lr-simcoupe() {
    gitPullOrClone "$md_build" https://github.com/libretro/libretro-simcoupe
}

function build_lr-simcoupe() {
    make clean
    make
    md_ret_require="$md_build/simcoupe_libretro.so"
}

function install_lr-simcoupe() {
    md_ret_files=(
        'README.md'
        'simcoupe_libretro.so'
    )
}

function configure_lr-simcoupe() {
    mkRomDir "samcoupe"
    ensureSystemretroconfig "samcoupe"
    addEmulator 1 "$md_id" "samcoupe" "$md_inst/simcoupe_libretro.so"
    addSystem "samcoupe"
}