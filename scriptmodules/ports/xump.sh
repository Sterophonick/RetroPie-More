rp_module_id="xump"
rp_module_desc="Xump - Platform puzzler"
rp_module_section="opt"
rp_module_flags="!x86 !mali !kms"

function depends_xump() {
    getDepends libsdl1.2-dev libsdl-mixer1.2-dev libraspberrypi-dev
}

function install_bin_xump() {
    downloadAndExtract "http://www.retroguru.com/xump/xump-v.latest-raspberrypi.zip" "$md_inst"
    patchVendorGraphics "$md_inst/xump_rpi"
}

function configure_xump() {
    moveConfigDir "$home/.xump" "$md_conf_root/xump"

    addPort "$md_id" "xump" "Xump" "pushd $md_inst; $md_inst/xump_rpi; popd"

    chmod +x "$md_inst/xump_rpi"
}
