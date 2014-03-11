# Copyright (c) 2014 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4
CROS_WORKON_COMMIT=("5955350cd57fd1b3732b6db62911d824712a5413" "b5a8ca7e5cac7c4559cc928abc02db3cb8799946")
CROS_WORKON_TREE=("25a370afa72845da80fb37c1cb6a90859e756134" "6c72197cede19ee70ccd896753c3c5d8aed75d43")
CROS_WORKON_PROJECT=("chromiumos/third_party/coreboot" "chromiumos/third_party/coreboot/blobs")
CROS_WORKON_LOCALNAME=("coreboot" "coreboot/3rdparty")
CROS_WORKON_DESTDIR=("${S}" "${S}/3rdparty")

inherit cros-board cros-workon cros-coreboot

KEYWORDS="amd64 x86"

RDEPEND="!sys-boot/chromeos-coreboot"
