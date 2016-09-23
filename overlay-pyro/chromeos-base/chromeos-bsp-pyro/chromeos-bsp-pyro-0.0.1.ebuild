# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit appid udev

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/ec-utils
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{4846109C-38A8-413F-E1FE-DCB98031EA65}" "CHROMEBOOK"

	# Install Power Manager rules.
	udev_dorules "${FILESDIR}/92-powerd-overrides.rules"
}
