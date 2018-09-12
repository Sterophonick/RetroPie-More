#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-jamvm"
rp_module_desc="Full Java Virtual Machine port to libretro"
rp_module_help="ROM Extensions: .jar"
rp_module_licence=""
rp_module_section="exp"

function sources_lr-meteor() {
    gitPullOrClone "$md_build" https://github.com/libretro/libretro-JamVM.git
}

function build_lr-meteor() {
    make clean
    make libretro
    md_ret_require="$md_build/jamvm_libretro.so"
}

function install_lr-meteor() {
    md_ret_files=(
        'README.md'
        'jamvm_libretro.so'
    )
}

function configure_lr-meteor() {
    mkRomDir "jar"
    ensureSystemretroconfig "jar"
    addEmulator 1 "$md_id" "jar" "$md_inst/jamvm_libretro.so"
    addSystem "jar"
}