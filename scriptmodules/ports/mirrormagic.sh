#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#
 
rp_module_id="mirrormagic"
rp_module_desc="Mirror Magic - Deflektor clone"
rp_module_licence="PROP"
rp_module_section="opt"
rp_module_flags="!mali !kms"

function depends_mirrormagic() {
    getDepends xorg matchbox mirrormagic-data debconf libx11-6
}

function install_bin_mirrormagic() {
    [[ -f "$md_inst/mirrormagic" ]] && rm -rf "$md_inst/"*
    aptInstall mirrormagic
}

function remove_mirrormagic() {
    aptRemove mirrormagic
}

function configure_mirrormagic() {
    addPort "$md_id" "mirrormagic" "mirrormagic" "xinit $md_inst/Mirror Magic.sh"

    cat >"$md_inst/Mirror Magic.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager &
mirrormagic
_EOF_
    chmod +x "$md_inst/Mirror Magic.sh"
}
