---
title: "Gentoo 学习笔记"
authors: ["qlAD"]
categories: ["技术"]
tags: ["Gentoo", "环境配置"]
slug: "gentoo_bak"
summary: "本文为 Gentoo 学习笔记，主要介绍 Gentoo 的安装、Bspwm 窗口管理器的配置、软件工具的安装。"
# series: ["Linux"]
# series_weight: 
# seriesNavigation: true
draft: false
date: 2023-07-09
---

> Gentoo Linux 从入门到入土

## 前言

本文档仅为本人当笔记使用，内容仅供参考。不定期更新。

### 内容

打算分三部分，第一部分是 Gentoo 的安装，第二部分是 Bspwm 窗口管理器的配置，第三部分是软件工具的安装。

### 声明

本人菜鸟一个，用 Linux 只是因为有受不了 Windows ，用 Gentoo 只是为了浪费生命（Doge），以下内容仅为本人在学习过程中的记录，主要目的为了以后我自己安装 Gentoo 时的参考，各位参考需谨慎。

## Gentoo 的基本安装

### 安装介质的准备

在开始之前，我们首先列出在 amd64 机器上成功安装 Gentoo 所需的硬件要求。

下载最新官方镜像（可选清华大学镜像源）

将 install-amd64-minimal-*.iso 刻录到 U 盘中（推荐全平台制作工具 BalenaEtcher）

重启电脑并设置 U 盘为第一引导，进入 U 盘安装系统。

### 重启电脑后进 U 盘安装模式

键盘设置默认回车，中国电脑使用US键盘（默认）

之后正式进入安装界面，输入以下命令测试是否是 UEFI 引导启动，有输出结果即为 UEFI 启动。

```bash
ls /sys/firmware/efi/efivars
```

### 网络方面的设置

```bash
# 检查网卡ifconfig# 检查网络连接ping -c 3 www.baidu.com
```

### 磁盘空间准备阶段

在本阶段中，首先要完成分区，利用 fdisk 工具或 cfdisk 工具完成磁盘空间分配。在本次安装中，采用的电脑为 4 核 8 线程，运行内存为 16 G，固态硬盘容量 256G。采用的分配方案如下

| Filesystem | Size | Mounted on | Type |
| --- | --- | --- | --- |
| /dev/nvme0n1p1 | 512M | /boot | vfat |
| /dev/nvme0n1p2 | 8G | [SWAP] | swap |
| /dev/nvme0n1p3 | 64G | / | btrfs |
| /dev/nvme0n1p4 | 160.4G | /home | xfs |

做好分区划分后，对应地进行格式化与挂载

```bash
# 启动交换分区mkswap /dev/nvme0n1p2swapon /dev/nvme0n1p2# 根分区mkdir --parents /mnt/gentoomkfs.btrfs /dev/nvme0n1p3mount /dev/nvme0n1p3 /mnt/gentoo# 引导分区mkdir /mnt/gentoo/bootmkfs.vfat -F 32 /dev/nvme0n1p1mount /dev/nvme0n1p1 /mnt/gentoo/boot# home 分区mkdir /mnt/gentoo/homemkfs.xfs /dev/nvme0n1p4mount /dev/nvme0n1p4 /mnt/gentoo/home
```

### 下载安装文件

手动配置当前时间

```bash
date 100313162023
```

进入挂载点，下载 stage3 并解压，其中的 stage3 包可以从 Gentoo 官网或者 [清华源](https://link.zhihu.com/?target=https%3A//mirrors.tuna.tsinghua.edu.cn/) 下载，这里选择了stage3-amd64-desktop-openrc 。

```bash
# 进入挂载目录cd /mnt/gentoo# 下载 stage3wget https://mirrors.tuna.tsinghua.edu.cn/gentoo/releases/amd64/autobuilds/current-stage3-amd64-desktop-openrc/stage3-amd64-desktop-openrc-**.tar.xz# 解压 stage3tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
```

之后开始配置编译选项

```bash
# 编辑 make.conf 文件nano -w /mnt/gentoo/etc/portage/make.conf
```

```bash
# Build-time functionality# ========================#USE="X elogind alsa pulseaudio vulkan pgo lto zstd vaapi vdpau opengl dbus cjk udev"# Host Setting# ============#CHOST="x86_64-pc-linux-gnu"# Host and optimization settings# ==============================#COMMON_FLAGS="-march=native -O2 -pipe"CFLAGS="${COMMON_FLAGS}"CXXFLAGS="${COMMON_FLAGS}"FCFLAGS="${COMMON_FLAGS}"FFLAGS="${COMMON_FLAGS}"# Advanced Masking# ================#ACCEPT_KEYWORDS="amd64"ACCEPT_LICENSE="*"# Portage Directories# ===================#PORTAGE_TMPDIR=/var/tmpPORTDIR=/var/db/repos/gentooDISTDIR=/var/cache/distfilesPKGDIR=/var/cache/binpkgs# Fetching files# ==============#GENTOO_MIRRORS="https://mirrors.tuna.tsinghua.edu.cn/gentoo"# Advanced Features# =================#EMERGE_DEFAULT_OPTS="--keep-going --with-bdeps=y --complete-graph --jobs=2 -l"MAKEOPTS="-j2"AUTOCLEAN="yes"# 安装了 ccache 后再启用以下两行FEATURES="ccache"CCACHE_DIR="/var/cache/ccache"# Language# ========#LC_MESSAGES=C.utf8L10N="en-US zh-CN en zh"LINGUAS="en_US zh_CN en zh"# Bootloader# ==========#GRUB_PLATFORMS="efi-64"# Xorg Devices# ============#INPUT_DEVICES="libinput"VIDEO_CARDS="amdgpu radeonsi"# 虚拟机方面设置，按需配置# QEMU Targets# ============#QEMU_SOFTMMU_TARGETS="arm x86_64 sparc"QEMU_USER_TARGETS="x86_64"
```

### 安装 Gentoo 基本系统

配置 ebuild 软件仓库

```bash
# 创建repos.conf 目录mkdir --parents /mnt/gentoo/etc/portage/repos.conf# 将 Portage 提供的 Gentoo 存储库配置文件复制到（新创建的）repos.conf 目录cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
```

修改源

```bash
# 编辑配置文件，替换以下内容nano /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
```

```bash
sync-uri = rsync://rsync.mirrors.tuna.tsinghua.edu.cn/gentoo-portage/
```

复制DNS信息

```bash
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
```

安装必要的文件系统，需要提供的文件系统是：

/proc/ 这是一个伪文件系统（它看起来像普通文件，但实际上是动态生成的），Linux 内核从中向环境公开信息 /sys/ 是一个伪文件系统，就像 /proc/ 一样，它曾经打算取代它，并且比 /proc/ 更有结构 /dev/ 是一个常规文件系统，部分由 Linux 设备管理器（通常是 udev）管理，其中包含所有设备文件 /run/ 是一个临时文件系统，用于运行时生成的文件，例如PID文件或锁

```bash
mount --types proc /proc /mnt/gentoo/procmount --rbind /sys /mnt/gentoo/sysmount --rbind /dev /mnt/gentoo/devmount --bind /run /mnt/gentoo/run
```

进入新环境

```bash
chroot /mnt/gentoo /bin/bashsource /etc/profileexport PS1="(chroot) ${PS1}"
```

安装ebuild数据库快照

```bash
emerge-webrsyncemergr --sync
```

选择系统配置文件

```bash
eselect profile listeselect profile set x
```

安装 cpuid2cpuflags，检测 cpu 指令集（如果安装不了，请先更新 world）

```bash
emerge --ask app-portage/cpuid2cpuflagsecho "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags
```

安装 ccache 加快编译速度

```bash
emerge -av ccachemkdir -p /var/cache/ccachechown root:portage /var/cache/ccache -Rchmod 2775 /var/cache/ccache -R# 编写配置文件nano /var/cache/ccache/ccache.conf
```

```bash
# /var/cache/ccache/ccache.confmax_size = 100.0Gumask = 002hash_dir = falsecompiler_check = %compiler% -vcache_dir_levels = 3compression = truecompression_level = 1
```

安装aria2加快emerge的下载速度(可选)

```bash
emerge -av aria2
```

在 make.conf 中添加如下内容

```bash
FETCHCOMMAND="/usr/bin/aria2c -d \${DISTDIR} -o \${FILE} --allow-overwrite=true --max-tries=5 --max-file-not-found=2 --max-concurrent-downloads=5 --connect-timeout=5 --timeout=5 --split=5 --min-split-size=2M --lowest-speed-limit=20K --max-connection-per-server=9 --uri-selector=feedback \${URI}"RESUMECOMMAND="${FETCHCOMMAND}"
```

现在可以更新 world 了

```bash
emerge --ask --verbose --update --deep --newuse @worldetc-update --automode -3
```

完了以后设置时区与语言

```bash
echo "Asia/Shanghai" > /etc/timezoneemerge --config sys-libs/timezone-dataecho "en_US.UTF-8 UTF-8zh_CN.UTF-8 UTF-8" >> /etc/locale.genlocale-geneselect locale list# 设置成英文eselect locale set X# 现在重新加载环境env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
```

### 配置与编译内核

先采取二进制内核，进入系统之后再进行自定义编译

```bash
# 开启 initramfs USE 以便获取 amd-uc.imgecho "sys-kernel/linux-firmware initramfs" >> /etc/portage/package.use/linux-firmwareemerge -av sys-kernel/linux-firmware# 安装二进制内核emerge -av sys-kernel/gentoo-kernel-bin# 安装 genkernel 以便生成 initramfs 文件emerge -av genkernelgenkernel initramfs --compress-initramfs --makeopts=-j`nproc`# 检查是否生效，应出现 amd-uc.img initramfs*.img vmlinuz*.img config* System.map* 这些文件ls /boot/
```

### 配置系统

生成fstab

```bash
# 安装 genfstab 以便自动配置 fstabemerge -av sys-fs/genfstabgenfstab -U / >> /mnt/gentoo/etc/fstab# 检查是否全部正确cat /etc/fstab
```

设置主机名（OpenRC 或 systemd）

```bash
echo Gentoo-WorkSpace > /etc/hostname
```

编辑 hosts 文件

```bash
nano /etc/hosts
```

```bash
# /etc/hosts: Local Host Database127.0.0.1   Gentoo-WorkSpace.homenetwork    Gentoo-WorkSpace    localhost::1     localhost
```

设置 Root 密码

```bash
passwd
```

设置时钟选项

```bash
# 编辑 hwclock 文件，更改 clock="local"nano /etc/conf.d/hwclock
```

### 安装系统工具

```bash
# 系统记录器emerge --ask app-admin/sysklogdrc-update add sysklogd default# 定时守护进程emerge --ask sys-process/cronierc-update add cronie default# 文件索引emerge --ask sys-apps/mlocate# 时间同步emerge --ask net-misc/chronyrc-update add chronyd default# 文件系统工具emerge -av sys-fs/xfsprogsemerge -av sys-fs/btrfs-progsemerge --ask sys-block/io-scheduler-udev-rules# 网络工具emerge --ask net-misc/dhcpcdrc-update add dhcpcd defaultrc-service dhcpcd startemerge --ask net-wireless/iw net-wireless/wpa_supplicant
```

### 配置引导加载程序

安装 GRUB 之前检查 make.conf 中是否设置了 GRUB_PLATFORMS=“efi-64”

```bash
emerge --ask sys-boot/grubgrub-install --target=x86_64-efi --efi-directory=/bootgrub-mkconfig -o /boot/grub/grub.cfg# 以下为正确的反馈，即 GRUB 可以找到识别内核文件和 initramfs 文件Generating grub.cfg ...Found linux image: /boot/vmlinuz-5.15.52-gentooFound initrd image: /boot/initramfs-genkernel-amd64-5.15.52-gentoodone
```

重新启动系统

```bash
exitcdumount -l /mnt/gentoo/dev{/shm,/pts,}umount -R /mnt/gentooreboot
```

### 简单设置新系统

添加日常使用的用户

```bash
useradd -m -G users,wheel,audio -s /bin/bash qlad# 为 qlad 用户设置密码，这里密码规则较复杂passwd qlad
```

磁盘清理

```bash
rm /stage3-*.tar.*
```

## Bspwm 窗口管理器

### 安装相关软件

```bash
# 安装 xorg-serveremerge --ask x11-base/xorg-server# 在启动运行级别启动 elogindrc-update add elogind boot# 编辑 .xinitrc 文件 添加 exec bspwmnano ~/.xinitrc# 安装 Bspwmemerge --ask x11-wm/bspwm
```

### 使用我的 Dot 文件

```bash
git clone [https://github.com/qlad/dotfiles.git](https://github.com/qlad/dotfiles.git)cp -r .config/ ~/.config/
```

### 重启系统，在 tty 里输入 startx 检验是否成功

## 软件工具的安装

待更。。。。。。。