#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="2048-qt"
rp_module_desc="2048-qt - Mathematics based puzzle game"
rp_module_licence="PROP"
rp_module_section="opt"
rp_module_flags="!mali !kms"

function depends_2048-qt() {
    getDepends xorg matchbox libatomic1 libc6 libgcc1 libgl1-mesa-glx libgles2-mesa libqt5core5a libqt5gui5 libqt5network5 libqt5qml5 libqt5quick5 libqt5widgets5 libstdc++6 qmlmodule-qtquick-controls qml-module-qtquick-dialogs
}

function install_bin_2048-qt() {
    [[ -f "$md_inst/2048-qt" ]] && rm -rf "$md_inst/"*
    aptInstall 2048-qt
}

function remove_2048-qt() {
    aptRemove 2048-qt
}

function configure_2048-qt() {
    addPort "$md_id" "2048-qt" "2048-qt" "xinit $md_inst/2048-qt.sh"

    cat >"$md_inst/2048-qt.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
2048-qt
_EOF_
    chmod +x "$md_inst/2048-qt.sh"
}
