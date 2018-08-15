#!/bin/bash

# colorize and add text parameters
grn=$(tput setaf 2)             # green
yellow=$(tput setaf 3)          # yellow
bldgrn=${txtbld}$(tput setaf 2) # bold green
red=$(tput setaf 1)             # red
txtbld=$(tput bold)             # bold
bldblu=${txtbld}$(tput setaf 4) # bold blue
blu=$(tput setaf 4)             # blue
txtrst=$(tput sgr0)             # reset
blink=$(tput blink)             # blink

echo -e "${bldgrn}"
echo "                                                    ";
echo "  Compiling Cranium Kernel.................         ";
echo "                                                    ";
echo -e "${txtrst}"

KERNEL_NAME="-Cranium"
INCREMENTAL_VERSION="V1.0.2"
export LOCALVERSION="${KERNEL_NAME}-${INCREMENTAL_VERSION}"
export KBUILD_BUILD_USER=sakindia123
export KBUILD_BUILD_HOST=Roaring-Lionus
export PATH=$PATH:/home/sarthak/kernels/toolchains/aarch64-linux-gnu/bin
export CROSS_COMPILE=aarch64-linux-gnu-
make ARCH=arm64 distclean
rm -rf out/
rm kernel_log
mkdir out
make ARCH=arm64 O=out cranium_los_defconfig
make ARCH=arm64 O=out -j6 > kernel_log  

echo -e "${bldgrn}"
echo "                                                    ";
echo "  Kernel has been succesfully compiled!....         ";
echo "                                                    ";
echo -e "${txtrst}"

rm ../pack/Image.gz-dtb
cp out/arch/arm64/boot/Image.gz-dtb ../pack/
