rp_module_id="sqrxz"
rp_module_desc="Sqrxz - Extremely Difficult Platformer"
rp_module_section="exp"
rp_module_flags="!x86 !mali !kms"

function depends_sqrxz() {
    getDepends libsdl1.2-dev libsdl-mixer1.2-dev libraspberrypi-dev
}

function install_bin_sqrxz() {
    downloadAndExtract "https://www.retroguru.com/sqrxz/sqrxz-v.latest-raspberrypi.zip" "$md_inst"
    patchVendorGraphics "$md_inst/sqrxz_rpi"
}

function configure_sqrxz() {
    moveConfigDir "$home/.sqrxz" "$md_conf_root/sqrxz"

    addPort "$md_id" "sqrxz" "Sqrxz" "pushd $md_inst; $md_inst/sqrxz_rpi; popd"

    chmod +x "$md_inst/sqrxz_rpi"
}
