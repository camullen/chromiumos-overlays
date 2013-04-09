# Copyright (c) 2013 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Chrome OS Firmware"
HOMEPAGE="http://www.chromium.org/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="arm"
IUSE=""

S=${WORKDIR}

FW_REV="f90b104f4ba8acd14a622b52d1526487a83b62a4"
SRC_URI="https://github.com/raspberrypi/firmware/archive/${FW_REV}.zip -> ${P}.zip"

src_install() {
	cd "firmware-master"
	insinto /firmware/rpi
	newins boot/start_x.elf start.elf
	newins boot/fixup_x.dat fixup.dat
	doins boot/bootcode.bin
}
