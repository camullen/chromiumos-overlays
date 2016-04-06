# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies or portage actions"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

# These packages are for servo support:
RDEPEND="
	chromeos-base/chromeos-ec
	chromeos-base/ec-devutils
	chromeos-base/ec-utils
	chromeos-base/vboot_reference
	dev-embedded/openocd
	dev-util/hdctools
	net-misc/ser2net
	sys-apps/flashrom
"

# These packages are for the test station support:
RDEPEND="${RDEPEND}
	app-emulation/lxc
	chromeos-base/chromeos-adb-env
"

# These packages are meant to setup the basic environment to enable
# labstation to handle its responsibilities.
RDEPEND="${RDEPEND}
	chromeos-base/chromeos-init
	chromeos-base/openssh-server-init
"

# These packages are meant to provide a basic environment for
# developers that need to log in to a device for purposes of
# debugging and/or resolving problems.
# TODO(kevcheng): Break these out into its own ebuild to reference in
# here and in the servo overlay.
RDEPEND="${RDEPEND}
	app-arch/gzip
	app-arch/tar
	app-editors/vim
	app-misc/screen
	app-shells/bash
	dev-util/strace
	net-analyzer/tcpdump
	net-dialup/minicom
	net-misc/iputils
	net-misc/openssh
	net-misc/rsync
	net-misc/wget
	sys-apps/diffutils
	sys-apps/file
	sys-apps/i2c-tools
	sys-apps/less
	sys-apps/usbutils
	sys-process/psmisc
	sys-process/time
"

DEPEND=""

S=${WORKDIR}

src_install() {
	insinto /etc/init
	doins "${FILESDIR}"/init/*.conf
}