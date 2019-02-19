rp_module_id="lr-mu"
rp_module_desc="lr-mu - Palm OS Emulator"
rp_module_help="ROM Extensions: .lutro"
rp_module_licence=""
rp_module_section="exp"

function sources_lr-mu() {
    gitPullOrClone "$md_build" https://github.com/meepingsnesroms/Mu.git
}

function build_lr-mu() {
    make clean
    make libretro
    md_ret_require="$md_build/mu_libretro.so"
}

function install_lr-lutro() {
    md_ret_files=(
        'README.md'
        'mu_libretro.so'
    )
}

function configure_lr-lutro() {
    mkRomDir "palmos"
    ensureSystemretroconfig "palmos"
    addEmulator 1 "$md_id" "mu" "$md_inst/mu_libretro.so"
    addSystem "palmos"
}