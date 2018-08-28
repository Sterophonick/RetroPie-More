#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="xbill"
rp_module_desc="XBill - Get rid of those viruses!"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags="!mali !x86 !kms"

function depends_xbill() {
    getDepends xorg matchbox
}

function install_bin_xbill() {
    [[ -f "$md_inst/xbill" ]] && rm -rf "$md_inst/"*
    aptInstall xbill
}

function remove_xbill() {
    aptRemove xbill
}

function configure_xbill() {
    addPort "$md_id" "xbill" "xbill" "xinit $md_inst/xbill.sh"

    cat >"$md_inst/xbill.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
xbill
_EOF_
    chmod +x "$md_inst/xbill.sh"
}
