# Copyright (c) 2013 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit appid udev

DESCRIPTION="Glimmer private bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="glimmer-cheets"

RDEPEND="
	chromeos-base/chromeos-accelerometer-init
	chromeos-base/chromeos-touch-config-glimmer
	chromeos-base/ec-utils
	sys-kernel/linux-firmware
"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	if use glimmer-cheets; then
		doappid "{107B04CD-3BF8-9C1F-6838-4AD43AE8EC1A}" "CHROMEBOOK"
	else
		doappid "{D0DBB0D9-6EEB-B148-F8AF-AE8AF86ECE5B}" "CHROMEBOOK" # glimmer
	fi

	# Install platform specific config files for power_manager.
	udev_dorules "${FILESDIR}/92-powerd-overrides.rules"
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	# Battery cut-off
	dosbin "${FILESDIR}/battery_cut_off.sh"
	dosbin "${FILESDIR}/board_factory_wipe.sh"
	dosbin "${FILESDIR}/board_factory_reset.sh"
	dosbin "${FILESDIR}/board_charge_battery.sh"
	dosbin "${FILESDIR}/display_wipe_message.sh"

}
