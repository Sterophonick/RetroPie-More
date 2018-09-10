#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="scratch"
rp_module_desc="Scratch - Easy Programming Language"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !x86 !kms"

function depends_scratch() {
    getDepends xorg matchbox squeak-vm
}

function install_bin_scratch() {
    [[ -f "$md_inst/scratch" ]] && rm -rf "$md_inst/"*
    aptInstall scratch
}

function remove_scratch() {
    aptRemove scratch
}

function configure_scratch() {
    addPort "$md_id" "scratch" "Scratch" "xinit $md_inst/scratch.sh"

    cat >"$md_inst/scratch.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
/usr/bin/scratch
_EOF_
    chmod +x "$md_inst/scratch.sh"
}
