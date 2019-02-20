#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-bestmame"
rp_module_desc="lr-bestmame - Sterophonick's personal recommended mame/mess drivers (libretro)."
rp_module_help="ROM Extension: .zip\n\nSupported systems: vsmile, cdimono1, arcadia, fm7, crvision, astrocde, advision, svision, sv8000, pv1000, pv2000, fmtowns, atom, gamecom, gamepock, gameking, mz700, studio2, microvision"
rp_module_licence="GPL2 https://raw.githubusercontent.com/libretro/mame/master/LICENSE.md"
rp_module_section="exp"

function _get_params_lr-bestmame() {
    local params=(OSD=retro RETRO=1 NOWERROR=1 OS=linux TARGETOS=linux CONFIG=libretro NO_USE_MIDI=1 TARGET=mame)
    isPlatform "64bit" && params+=(PTR64=1)
    echo "${params[@]}"
}

function depends_lr-bestmame() {
    if compareVersions $__gcc_version lt 5.0.0; then
        md_ret_errors+=("Sorry, you need an OS with gcc 5.0 or newer to compile lr-mame")
        return 1
    fi
}

function sources_lr-bestmame() {
    gitPullOrClone "$md_build" https://github.com/libretro/mame.git
}

function build_lr-bestmame() {
    rpSwap on 2000
    local params=($(_get_params_lr-mame) SOURCES=src/mame/drivers/vsmile.cpp,src/mame/drivers/cdi.cpp,src/mame/drivers/arcadia.cpp,src/mame/drivers/fm7.cpp,src/mame/drivers/crvision.cpp,src/mame/drivers/astrocde.cpp,src/mame/driver
s/advision.cpp,src/mame/drivers/svision.cpp,src/mame/drivers/sv8000.cpp,src/mame/drivers/pv1000.cpp,src/mame/drivers/pv2000.cpp,src/mame/drivers/fmtowns.cpp,src/mame/drivers/atom.cpp,src/mame/drivers/gamecom.cpp,src/mame/drivers/gamepock.cpp,src/mame/drivers/gameking.cpp,src/mame/drivers/mz700.cpp,src/mame/drivers/studio2.cpp,src/mame/drivers/microvsn.cpp)
    make clean
    make "${params[@]}"
    rpSwap off
	mv "$md_build/mame_libretro.so" "$md_build/bestmame_libretro.so"
    md_ret_require="$md_build/bestmame_libretro.so"
}

function install_lr-bestmame() {
    md_ret_files=(
        'bestmame_libretro.so'
    )
}

function configure_lr-bestmame() {
    local system
    for system in vsmileg svision advision sv8000 cdimono1 arcadiafm7 crvision astrocde advision pv1000 pv2000 fmtowns atom gamecom gamepock gameking mz700 studio2 microvsn; do
        mkRomDir "$system"
        ensureSystemretroconfig "$system"
        addEmulator 0 "$md_id" "$system" "$md_inst/bestmame_libretro.so"
        addSystem "$system"
    done
}