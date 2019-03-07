#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-quasi88"
rp_module_desc="lr-quasi88 - Port of Quasi88 to libretro"
rp_module_help="ROM Extensions: .d88"
rp_module_licence="GPL3 https://github.com/celerizer/quasi88-libretro/blob/master/LICENSE"
rp_module_section="exp"

function sources_lr-quasi88() {
    gitPullOrClone "$md_build" https://github.com/celerizer/quasi88-libretro.git
}

function build_lr-quasi88() {
    make clean
    make libretro
    md_ret_require="$md_build/quasi88_libretro.so"
}

function install_lr-quasi88() {
    md_ret_files=(
        'README.md'
        'quasi88_libretro.so'
    )
}

function configure_lr-quasi88() {
    mkRomDir "pc88"
    ensureSystemretroconfig "pc88"
    addEmulator 1 "$md_id" "pc88" "$md_inst/quasi88_libretro.so"
    addSystem "pc88"
}