---
title: "KVM 安装 OpenWRT 作为旁路由"
authors: ["qlAD"]
categories: ["技术"]
tags: ["软路由", "环境配置"]
slug: "kvm_openwrt"
summary: ""
# series: ["Linux"]
# series_weight: 
# seriesNavigation: true
draft: false
date: 2022-08-09
---

没钱买软路由，尝试虚拟机安装 OpenWRT 系统

## 说明

### 本人家庭网络环境

一条电信宽带，两个路由器，都是硬路由

由于一些特殊需求，需要直接给路由器安装插件，实现某一功能（Open Clash），但是家里路由器都是硬路由（家庭常见路由器都是硬路由：TPLink，华为路由器）所以没法刷第三方 OpenWRT 固件，于是乎想到了 KVM 虚拟机安装 OpenWRT 系统来实现软路由

### 优点

无需任何经济成本，硬件自定义配置

### 缺点

电脑关机则不能使用 KVM 虚拟机，所以 OpenWRT 不能 7*24 小时工作

## 前提介绍（环境配置）

### 什么是软路由？

软路由是指利用台式机或服务器配合软件形成路由解决方案，主要靠软件的设置，达成 [路由器](https://baike.baidu.com/item/%E8%B7%AF%E7%94%B1%E5%99%A8/108294) 的功能；而 [硬路由](https://baike.baidu.com/item/%E7%A1%AC%E8%B7%AF%E7%94%B1/6801739) 则是以特有的硬设备，包括处理器、电源供应、[嵌入式软件](https://baike.baidu.com/item/%E5%B5%8C%E5%85%A5%E5%BC%8F%E8%BD%AF%E4%BB%B6/5345503)，提供设定的路由器功能。—— 《百度百科》

简单理解就是在任何一台电脑上安装一个可当作路由器的系统，市面上卖的软路由其实上就是一台微型电脑。

### 我的电脑环境？

宿主机：Arch Linux + KVM (QEMU)

网络设置：Arch 通过有线网络连到副路由器上，副路由器和主路由器进行桥接模式（如果不是桥接模式的话，副路由器给 Arch 分配的 IP 地址就和主路由器一样，但是我需要把 OpenWRT 作为副路由器的旁路由来使用）

下图为我的 TpLink 路由器设置桥接模式的页面

![https://s2.loli.net/2022/08/04/ViCQu5ZsjoOJTUb.png](https://s2.loli.net/2022/08/04/ViCQu5ZsjoOJTUb.png)

https://s2.loli.net/2022/08/04/ViCQu5ZsjoOJTUb.png

### Arch 宿主机的网络配置

创建一块虚拟桥接模式的网卡，以供 OpenWRT 虚拟机使用

[(参考：Arch Linux Wiki : Network bridge)](https://wiki.archlinux.org/title/network_bridge)

1、先新建一块桥接模式的虚拟网卡 br0

```bash
nmcli connection add type bridge ifname br0 stp no
```

2、使有限网接口（enp30s0 改成你自己的有限网接口）成为网桥的从属：

```bash
nmcli connection add type bridge-slave ifname enp30s0 master br0
```

3、将新建的桥接线路设置为开启

```bash
nmcli connection up bridge-br0
```

```bash
nmcli connection up bridge-slave-enp30s0
```

## 正式开始安装

### 1、下载固件

我用的是一个可以在线编译的网站，上也有编译好的版本

[OpenWrt固件下载与在线定制编译](https://supes.top/)

![https://s2.loli.net/2022/08/04/ph51ZF6qPYTVkAS.png](https://s2.loli.net/2022/08/04/ph51ZF6qPYTVkAS.png)

https://s2.loli.net/2022/08/04/ph51ZF6qPYTVkAS.png

### 2、采用图形化 virt-manager 安装

2.1、选择导入磁盘镜像

![https://s2.loli.net/2022/08/04/ZgG8BJAXcS9DVL4.png](https://s2.loli.net/2022/08/04/ZgG8BJAXcS9DVL4.png)

https://s2.loli.net/2022/08/04/ZgG8BJAXcS9DVL4.png

2.2、选择版本为其他 OS

![https://s2.loli.net/2022/08/04/2q1WS4ljAtdbwGM.png](https://s2.loli.net/2022/08/04/2q1WS4ljAtdbwGM.png)

https://s2.loli.net/2022/08/04/2q1WS4ljAtdbwGM.png

2.3、自定义 OpenWRT 虚拟机硬件配置

![https://s2.loli.net/2022/08/04/dwLauIZCl4BeMrA.png](https://s2.loli.net/2022/08/04/dwLauIZCl4BeMrA.png)

https://s2.loli.net/2022/08/04/dwLauIZCl4BeMrA.png

2.3、设置网络为 br0

![https://s2.loli.net/2022/08/04/3TbYgxIm4XM2liD.png](https://s2.loli.net/2022/08/04/3TbYgxIm4XM2liD.png)

https://s2.loli.net/2022/08/04/3TbYgxIm4XM2liD.png

2.4、完成安装

![https://s2.loli.net/2022/08/04/pwcPAK9OjDyGInd.png](https://s2.loli.net/2022/08/04/pwcPAK9OjDyGInd.png)

https://s2.loli.net/2022/08/04/pwcPAK9OjDyGInd.png

## OpenWRT 配置

设置 OpenWRT 的 IP 地址，这里随便设置成你网段中的任意一个不被占用的地址

```bash
vim /etc/config/network
```

```jsx
config interface 'lan'
option type 'bridge'
option ifname 'eth0'
option proto 'static'
option ipaddr '192.168.0.132' #副路由 192.168.101.2,旁路由我设置 192.168.101.132
option netmask '255.255.255.0'
option ip6assign '60'
option gateway '192.168.101.2' # 填写为主路由地址
option dns '114.114.114.114 223.5.5.5' # 正常可用的DNS地址
```

按 `ESC` 输入 `:wq` 保存并退出。运行下面命令，重启网络使配置生效

```bash
/etc/init.d/network restart
```

然后尝试 ping 主路由，ping 通则可使用

### 1、关闭 / 不关闭副路由的 DHCP

1.1、如果关闭，则使用 OpenWRT 的 DHCP

好处：不需要修改链接设备的 DNS ，连上即可使用 OpenWRT 的功能

坏处：对家里其他人连接到这台副路由器的设备也有影响

1.2、如果不关闭，则不使用 OpenWRT 的 DHCP 好坏处自己衡量吧

### 2、如果关闭路由器的 DHCP 功能

[Proxmox VE 虚拟机安装 OpenWrt 配置旁路由教程 - 喵斯基部落](https://www.moewah.com/archives/3643.html)

### 3、如果关闭 OpenWRT 的 DHCP 模式

[三分钟搞定OpenWrt网关(旁路由)模式设置 小白必备教程 适用于N1及所有旁路由设备](https://blog.802039.xyz/32.html)