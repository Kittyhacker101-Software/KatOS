#!/bin/sh
rm kernelImage

cp ../../Source/linux-*.tar.xz linux.tar.xz
tar -xvf linux.tar.xz
cd $(ls -d linux-*)
make mrproper -j 32
make defconfig -j 32
echo "CONFIG_OVERLAY_FS=n" >> .config
echo "CONFIG_APPLE_PROPERTIES=n" >> .config
echo "CONFIG_PRINTK=n" >> .config
echo "CONFIG_BUG=n" >> .config
sed -i "s/.*\\(CONFIG_KERNEL_.*\\)=y/\\#\\ \\CONFIG_KERNEL is not set/" .config  
sed -i "s/.*CONFIG_KERNEL_XZ.*/CONFIG_KERNEL_XZ=y/" .config
sed -i "s/.*CONFIG_FB_VESA.*/CONFIG_FB_VESA=y/" .config
sed -i "s/.*CONFIG_LOGO_LINUX_CLUT224.*/\\# CONFIG_LOGO_LINUX_CLUT224 is not set/" .config
sed -i "s/.*CONFIG_EFI_STUB.*/CONFIG_EFI_STUB=y/" .config
# Kernel Size Optimizations
sed -i "s/^CONFIG_DEBUG_KERNEL.*/\\# CONFIG_DEBUG_KERNEL is not set/" .config
sed -i "s/.*CONFIG_PROC_KCORE.*/\\# CONFIG_PROC_KCORE is not set/" .config
sed -i "s/.*CONFIG_ELF_CORE.*/\\# CONFIG_ELF_CORE is not set/" .config
sed -i "s/.*CONFIG_PROC_KCORE.*/\\# CONFIG_PROC_KCORE is not set/" .config
sed -i "s/.*CONFIG_AIO.*/\\# CONFIG_AIO is not set/" .config
sed -i "s/.*CONFIG_FILE_LOCKING.*/\\# CONFIG_FILE_LOCKING is not set/" .config
sed -i "s/.*CONFIG_KALLSYMS.*/\\# CONFIG_KALLSYMS is not set/" .config
sed -i "s/.*CONFIG_SWAP.*/\\# CONFIG_SWAP is not set/" .config
# Kernel Speed Optimizations
sed -i "s/^CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE.*/\\# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set/" .config
sed -i -e "s/# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set/CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y/g" .config
sed -i "/CONFIG_SCHED_CFS=y/d"                                                 .config
sed -i -e "s/# CONFIG_SCHED_BFS is not set/CONFIG_SCHED_BFS=y/g"               \
    -i -e "s/# CONFIG_IOSCHED_BFQ is not set/CONFIG_IOSCHED_BFQ=y/g"           \
    -i -e "s/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set/g"           \
    -i -e "s/CONFIG_DEFAULT_DEADLINE=y/# CONFIG_DEFAULT_DEADLINE is not set/g" \
    -i -e "s/CONFIG_DEFAULT_NOOP=y/# CONFIG_DEFAULT_NOOP is not set/g"         \
    -i -e "s/CONFIG_DEFAULT_IOSCHED="cfq"/CONFIG_DEFAULT_IOSCHED="deadline"/g"      \
    -i -e "s/CONFIG_DEFAULT_IOSCHED="bfq"/CONFIG_DEFAULT_IOSCHED="deadline"/g" \
    -i -e "s/CONFIG_DEFAULT_IOSCHED="noop"/CONFIG_DEFAULT_IOSCHED="deadline"/g"     \
-i -e "s/# CONFIG_DEFAULT_BFQ is not set/CONFIG_DEFAULT_BFQ=y/g" .config
sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/'   \
    -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
-i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' .config
echo "CONFIG_EFI_MIXED=y" >> .config
sed -i -e "s/# CONFIG_MAXSMP is not set/CONFIG_MAXSMP=y/g" .config
make \
  CFLAGS="-O3 -s -fno-stack-protector -fomit-frame-pointer -U_FORTIFY_SOURCE -pipe" \
  bzImage -j 32
cp arch/x86_64/boot/bzImage \
  ../kernelImage
cd ..
rm -r linux-*/
