#!/bin/bash
#设置环境

# Special Clean For Huawei Kernel.
if [ -d include/config ];
then
    echo "Find config,will remove it"
	rm -rf include/config
else
	echo "No Config,good."
fi


echo " "
echo "***Setting environment...***"
# 交叉编译器路径
# 
export PATH=$PATH:
export CROSS_COMPILE=aarch64-linux-android-

export GCC_COLORS=auto
export ARCH=arm64
if [ ! -d "out" ];
then
	mkdir out
fi

#输入Ravel内核版本号
printf "Please enter Ravel Kernel version number: "
read v
echo " "
echo "Setting EXTRAVERSION"
export EV=EXTRAVERSION=_Kirin970_Ravel_KSU_V$v

date="$(date +%Y.%m.%d-%I:%M)"

#构建Ravel内核部分
echo "***Building for Ravel version...***"
make ARCH=arm64 O=out $EV Ravel_kirin970_KSU_defconfig
# 定义编译线程数
make ARCH=arm64 O=out $EV -j256 2>&1 | tee kernel_log-${date}.txt

#打包Ravel版内核

if [ -f out/arch/arm64/boot/Image.gz ];
then
	echo "***Packing Ravel version kernel...***"
	tools/mkbootimg --kernel out/arch/arm64/boot/Image.gz --base 0x0 --cmdline "loglevel=4 initcall_debug=n page_tracker=on unmovable_isolate1=2:192M,3:224M,4:256M printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=enforcing buildvariant=user" --tags_offset 0x07A00000 --kernel_offset 0x00080000 --ramdisk_offset 0x07C00000 --header_version 1 --os_version 9 --os_patch_level 2020-01-01 --output Kirin970_Ravel_KSU_V"$v"_9.1.0-${date}.img

	tools/mkbootimg --kernel out/arch/arm64/boot/Image.gz --base 0x0 --cmdline "loglevel=4 initcall_debug=n page_tracker=on unmovable_isolate1=2:192M,3:224M,4:256M printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=permissive buildvariant=user" --tags_offset 0x07A00000 --kernel_offset 0x00080000 --ramdisk_offset 0x07C00000 --header_version 1 --os_version 9 --os_patch_level 2020-01-01  --output Kirin970_Ravel_KSU_V"$v"_9.1.0_PM-${date}.img

	cp out/arch/arm64/boot/Image.gz Image.gz 
	echo " "
	echo "***Sucessfully built Ravel version kernel...***"
	echo " "
	exit 0
else
	echo " "
	echo "***Failed!***"
	exit 0
fi