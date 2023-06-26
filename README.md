# android_kernel_huawei_ravel_KernelSU  
***
[![Build Huawei-Kirin970-EMUI9.1.0-KSU-Kernel-GSI](https://github.com/Coconutat/android_kernel_huawei_kirin970_EMUI9.1.0_KernelSU/actions/workflows/build_kernel_GSI.yml/badge.svg?branch=Github-Action)](https://github.com/Coconutat/android_kernel_huawei_kirin970_EMUI9.1.0_KernelSU/actions/workflows/build_kernel_GSI.yml)

[![Build Huawei-Kirin970-EMUI9.1.0-KSU-Kernel-EPM](https://github.com/Coconutat/android_kernel_huawei_kirin970_EMUI9.1.0_KernelSU/actions/workflows/build_kernel_EPM.yml/badge.svg?branch=Github-Action)](https://github.com/Coconutat/android_kernel_huawei_kirin970_EMUI9.1.0_KernelSU/actions/workflows/build_kernel_EPM.yml)
  
![Downloads](https://img.shields.io/github/downloads/Coconutat/android_kernel_huawei_kirin970_EMUI9.1.0_KernelSU/total)    
***
荣耀 Note10 内核集成KernelSU版本。  
测试版本。  
因KernelSU的代码问题导致华为的SELinux工作不正常，所以EMUI 9.1.0 KernelSU会失效。  
但是刷大于或等于安卓 10 GSI就没问题。  
交叉编译器下载：[aarch64-linux-android-4.9_refs_heads_pie-release](https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/refs/heads/pie-release.tar.gz)  

# 如何为华为EMUI9/9.1.0集成KernelSU
[教程](https://github.com/Coconutat/HuaweiP10-GSI-And-Modify-Tutorial/wiki/7.KernelSU%E9%80%82%E9%85%8DEMUI9%E6%88%969.1.0%E7%B3%BB%E7%BB%9F%E7%9A%84%E5%86%85%E6%A0%B8)  
同时此项目也可以作为参考。

# 编译
现已Github Action自动化编译内核。  
全自动，解放你的双手，无需Linux设备！！
**下载：[Github Action](https://github.com/Coconutat/android_kernel_huawei_kirin970_EMUI9.1.0_KernelSU/actions/)**    
**什么。无法下载？请确保您登陆了Github账户。**  

# 编译的版本:  
1. Build Huawei-Kirin970-EMUI9.1.0-KSU-Kernel-GSI:GSI系统专用。内有两个内核，带PM的代表开机时SELinux为宽容模式。
2. Build Huawei-Kirin970-EMUI9.1.0-KSU-Kernel-EPM:Huawei EMUI 9.1.0专用。内核强制SELinux为宽容模式。  
