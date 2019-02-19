#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-mvsmile"
rp_module_desc="lr-mvsmile - Standalone V.Smile MAME driver for libretro"
rp_module_help="ROM Extension: .zip\n\nCopy your V.Smile roms to either $romdir/vsmileg"
rp_module_licence="GPL2 https://raw.githubusercontent.com/libretro/mame/master/LICENSE.md"
rp_module_section="exp"

function _get_params_lr-mvsmile() {
    local params=(OSD=retro RETRO=1 NOWERROR=1 OS=linux TARGETOS=linux CONFIG=libretro NO_USE_MIDI=1 TARGET=mame)
    isPlatform "64bit" && params+=(PTR64=1)
    echo "${params[@]}"
}

function depends_lr-mvsmile() {
    if compareVersions $__gcc_version lt 5.0.0; then
        md_ret_errors+=("Sorry, you need an OS with gcc 5.0 or newer to compile lr-mame")
        return 1
    fi
}

function sources_lr-mvsmile() {
    gitPullOrClone "$md_build" https://github.com/libretro/mame.git
}

function build_lr-mvsmile() {
    rpSwap on 2000
    local params=($(_get_params_lr-mame) SOURCES=src/mame/drivers/vsmile.cpp)
    make clean
    make "${params[@]}"
    rpSwap off
	mv "$md_build/mamearcade_libretro.so" "$md_build/mvsmile_libretro.so"
    md_ret_require="$md_build/mvsmile_libretro.so"
}

function install_lr-mvsmile() {
    md_ret_files=(
        'mvsmile_libretro.so'
    )
}

function configure_lr-mvsmile() {
    local system
    for system in vsmileg mvsmile-libretro; do
        mkRomDir "$system"
        ensureSystemretroconfig "$system"
        addEmulator 0 "$md_id" "$system" "$md_inst/mvsmile_libretro.so"
        addSystem "$system"
    done
}