#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-fullmame"
rp_module_desc="Full version of MAME for libretro (MAME + MESS)"
rp_module_help="ROM Extension: .zip\n\nSupported systems: vsmileg svision advision sv8000 cdimono1 arcadia fm7 crvision astrocde advision pv1000 pv2000 fmtowns atom gamecom gamepock gameking mz700 studio2 microvsn gp32 apfm1000 pico omv2000 pv2000 sc3000 sordm5 socrates decocass arcade\nAny other systems that you want you would have to configure yourself."
rp_module_licence="GPL2 https://raw.githubusercontent.com/libretro/mame/master/LICENSE.md"
rp_module_section="exp"

function _get_params_lr-fullmame() {
    local params=(OSD=retro RETRO=1 NOWERROR=1 OS=linux TARGETOS=linux CONFIG=libretro NO_USE_MIDI=1 TARGET=mame)
    isPlatform "64bit" && params+=(PTR64=1)
    echo "${params[@]}"
}

function depends_lr-fullmame() {
    if compareVersions $__gcc_version lt 5.0.0; then
        md_ret_errors+=("Sorry, you need an OS with gcc 5.0 or newer to compile lr-mame")
        return 1
    fi
}

function sources_lr-fullmame() {
    gitPullOrClone "$md_build" https://github.com/libretro/mame.git
}

function build_lr-fullmame() {
    rpSwap on 2000
    local params=($(_get_params_lr-fullmame))
    make clean
    make "${params[@]}"
    rpSwap off
	mv "$md_build/mame_libretro.so" "$md_build/fullmame_libretro.so"
    md_ret_require="$md_build/fullmame_libretro.so"
}

function install_lr-fullmame() {
    md_ret_files=(
        'fullmame_libretro.so'
    )
}

function configure_lr-fullmame() {
    local system
    for system in vsmileg svision advision sv8000 cdimono1 arcadia fm7 crvision astrocde advision pv1000 pv2000 fmtowns atom gamecom gamepock gameking mz700 studio2 microvsn gp32 apfm1000 pico omv2000 pv2000 sc3000 sordm5 socrates decocass arcade; do
        mkRomDir "$system"
        ensureSystemretroconfig "$system"
        addEmulator 0 "$md_id" "$system" "$md_inst/fullmame_libretro.so"
        addSystem "$system"
    done
}