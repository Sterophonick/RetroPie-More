rp_module_id="es-theme-homebrew"
rp_module_desc="ES-Theme-Homebrew - Homebrew oriented theme for EmulationStation"
rp_module_licence="PROP"
rp_module_section="exp"
rp_module_flags=""

function depends_es-theme-homebrew() {
    getDepends
}

function remove_es-theme-homebrew() {
	rm -rf /etc/emulationstation/themes/ES-Theme-Homebrew
}

function install_bin_es-theme-homebrew() {
	remove_es-theme-homebrew
	gitPullOrClone /etc/emulationstation/themes/ES-Theme-Homebrew https://gitlab.com/Sterophonick/ES-Theme-Homebrew.git
}
