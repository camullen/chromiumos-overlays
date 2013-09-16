# Copyright (c) 2013 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit udev

DESCRIPTION="NVIDIA binary nvrm daemon and libraries for Tegra4"
SRC_URI="ftp://download.nvidia.com/chromeos/binary-ldk/t114/ER/${PV//./_}/nvidia-binaries_armhf_${PV//./_}.tbz2"

LICENSE="NVIDIA"
SLOT="0"
KEYWORDS="arm"
IUSE=""

S=${WORKDIR}

src_unpack() {
	default
	unpack ./Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2
}

src_install() {
	insinto /lib/firmware
	doins lib/firmware/*.bin

	# Not all .so files in usr/lib get installed by this ebuild, so
	# let's list each one explicitly.
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libcgdrv.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvapputil.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvcwm.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvdc.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvddk_2d.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvddk_2d_v2.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvddk_disp.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvddk_mipihsi.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvdispatch_helper.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvavp.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_audio.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_camera.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_contentpipe.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_image.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_manager.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_parser.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_service.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_utils.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_video.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmm_writer.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmmlite.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmmlite_audio.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmmlite_image.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmmlite_utils.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvmmlite_video.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvos.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvparser.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvrm_graphics.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvrm.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvsm.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvtestio.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvtestresults.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvtvmr.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvwinsys.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvwsi.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvodm_dtvtuner.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvodm_imager.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvodm_misc.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvodm_query.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvodm_disp.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libardrv_dynamic.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvfusebypass.so
	dolib.so usr/lib/arm-linux-gnueabihf/tegra/libnvglsi.so

	udev_dorules "${FILESDIR}"/51-nvrm.rules
}
