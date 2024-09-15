---
title: "Day 1 初始环境的配置"
authors: ["qlAD"]
categories: ["技术"]
tags: ["计算机专业", "环境配置"]
slug: "cs_01"
summary: "本文介绍了配置一个顺手的浏览器、代码编辑器、虚拟机、远程连接软件、终端工具的步骤。"
series: ["CS"]
series_weight: 1
seriesNavigation: true
draft: false
date: 2024-08-31
---

## 常用软件的安装 {#常用软件的安装}

### 浏览器 {#浏览器}

| 浏览器                                                | 简介                      | 优点                  | 缺点                  |
|----------------------------------------------------|-------------------------|---------------------|---------------------|
| [Firefox](https://www.mozilla.org/en-US/firefox/new/) | 一款开源的网页浏览器，注重隐私和用户定制化。 | 隐私保护、可定制化、开源社区支持，更新频繁 | 相比其他浏览器稍慢、某些网站兼容性问题 |
| [edge](https://www.microsoft.com/en-us/edge)          | 微软开发的浏览器，集成 Windows 系统功能。 | 性能表现优秀、兼容性好 | 引导用户使用微软服务、扩展库较小 |
| [Chrome](https://www.google.com/chrome/)              | Google 开发，以其速度和简洁的用户界面闻名。 | 加载速度快、扩展程序具有安全性和稳定性 | 高内存占用、隐私方面的担忧（由于数据收集） |


### 代码编辑器 {#代码编辑器}

-   **VSCode**

    VSCode 是微软开发的开源代码编辑器，支持多种编程语言和强大的扩展功能。

    -   优点：广泛的扩展支持、轻量级且高效、集成开发工具、跨平台支持

    -   缺点：配置复杂、安装过多扩展可能影响性能、默认功能较少

    下载地址：<https://code.visualstudio.com/Download>


### 虚拟机 {#虚拟机}

-   **VMware**

    VMware 是一家领先的虚拟化技术公司，提供多种虚拟化解决方案，包括虚拟机管理和云计算平台。

    优点：

    -   强大的虚拟化功能：支持多种操作系统和硬件环境，提供高效的资源管理。
    -   广泛的企业支持：被许多大型企业和数据中心广泛使用，功能成熟。
    -   高级功能：提供快照、克隆、迁移等高级虚拟化功能。
    -   稳定性和性能：高稳定性和出色的性能，适合生产环境使用。

    缺点：

    -   成本高：企业级产品和高级功能通常需要高昂的许可证费用。
    -   学习曲线：高级功能和配置可能需要较长的学习时间和专业知识。
    -   资源消耗：虚拟化会占用一定的系统资源，可能需要更高的硬件配置。


### 远程连接软件 {#远程连接软件}

-   Xshell XFTP

    Xshell 是一款功能强大的终端模拟器，支持多种协议（如 SSH、SFTP、TELNET）和多标签操作，主要用于远程管理和访问服务器。

    -   优点：多协议支持、多标签界面、强大的脚本功能、可自定义功能

    -   缺点：完整版需商业授权，一些功能学习曲线高

    Xftp 是一款文件传输工具，与 Xshell 配合使用效果最佳，支持多种协议如 SFTP 和 FTP，用于在本地和远程服务器之间传输文件。

    -   优点：协议支持、拖放操作、多标签功能、集成 Xshell

    -   缺点：完整版是商业软件、传输时资源占用高


### 终端工具 {#终端工具}

-   Windows Terminal

    Windows Terminal 是微软开发的现代化终端应用程序，为 Windows 10 和 Windows 11 用户提供一个统一的命令行界面，支持多个终端和 shell，如 PowerShell、Command Prompt 和 Windows Subsystem for Linux (WSL)。

    -   优点：多标签支持、自定义功能、性能优化、开源

    -   缺点：功能复杂、依赖于 Windows 10/11


## 配置一个顺手的浏览器 {#配置一个顺手的浏览器}


### 外观 {#外观}

可通过浏览器设置亮色暗色主题

{{< figure src="https://s2.loli.net/2024/09/01/2mGILMzjhilDVkW.png" >}}

或者在插件市场安装主题

{{< figure src="https://s2.loli.net/2024/09/01/ofcjeUuvVZ4t7DH.png" >}}


### 插件 {#插件}

我目前在用的浏览器插件有：

{{< figure src="https://s2.loli.net/2024/09/01/wfry1CPiSm7LIA5.png" >}}

从上至下依次是：广告屏蔽插件、全局暗色主题、视频速度控制、kde 桌面支持、油猴脚本、站点分析


### 书签栏 {#书签栏}

一个精心管理维护的书签栏会让你使用浏览器时得心应手

{{< figure src="https://s2.loli.net/2024/09/01/uaGWoN8xBfPCYtK.png" >}}

如果你不想手动配置，那么还有优秀的导航网站供你选择

| 网站                                     | 特点                                 |
|----------------------------------------|------------------------------------|
| [程序员盒子](https://www.coderutil.com/) | 提供编程工具、资源和技术文章，聚焦于开发者工具和编程资源。 |
| [小众技术网](https://www.xiaozhongjishu.com/) | 分享最新的技术工具和应用，关注小众技术和实用软件的推荐。 |
| [创意狮导航](https://chuangzaoshi.com/)  | 提供丰富的工具和资源链接，聚焦于创意设计、开发工具和前端技术。 |
| [极光导航网](https://www.jigdh.com/)     | 集中于网站资源和工具的导航，涵盖开发、设计、学习等多个领域。 |
| [柒夜导航网](https://nav.qinight.com/)   | 提供简洁的资源导航，涵盖编程、设计、网络工具等，注重实用性和简洁性。 |
| [菜鸟教程网](https://www.runoob.com/)    | 提供大量编程教程和学习资源，涵盖多种编程语言和技术，适合初学者和进阶者。 |


## 配置一个顺手的编辑器（VSCode） {#配置一个顺手的编辑器-vscode}


### 主题 {#主题}

通过插件市场来安装

{{< figure src="https://s2.loli.net/2024/09/01/hM3Qyxj1IAioGze.png" >}}

我比较喜欢 GitHub Theme


### 插件 {#插件}

建议安装的插件有

{{< figure src="https://s2.loli.net/2024/09/01/VCSZb4k1l2owLrJ.png" >}}

从上到下功能依次是：括号彩色匹配、C 语言代码支持、主题、LaTeX 环境、markdown 环境、代码格式、SSH 连接


## Linux 新手生存指南 {#linux-新手生存指南}


### Linux 虚拟机的安装 {#linux-虚拟机的安装}

1.  Debian 镜像下载

2.  VMware 安装 Debian

3.  更改软件源

4.  快照的创建

详情请参照我的这篇博客：[Debian 虚拟机的安装]()


### 基础的命令 {#基础的命令}

| 命令  | 作用                          |
|-----|-----------------------------|
| pwd   | 显示当前工作目录的绝对路径。  |
| cd    | 改变当前工作目录。            |
| ls    | 列出指定目录下的文件和子目录。 |
| cat   | 显示文件内容，或将多个文件的内容合并并显示。 |
| find  | 在目录结构中查找文件或目录。  |
| mkdir | 创建一个新的目录。            |
| touch | 创建一个新的空文件，或更新现有文件的时间戳。 |
| mv    | 移动或重命名文件和目录。      |
| rm    | 删除文件或目录                |
| tar   | 创建、查看或解压归档文件（如 .tar、.tar.gz）。 |
| clear | 清除终端屏幕上的内容。        |


### 好用的工具 {#好用的工具}

| 命令      | 作用                                               |
|---------|--------------------------------------------------|
| sudo      | 以超级用户权限执行命令。                           |
| apt       | Debian 和 Ubuntu 系统上的包管理工具，用于安装、更新和删除软件包。 |
| fish      | 一个现代化的、用户友好的命令行 shell。             |
| neofetch  | 显示系统信息和一些有趣的 ASCII 艺术。              |
| htop/btop | 实时监控系统资源使用情况的交互式工具（\`htop\` 是传统工具，\`btop\` 是其改进版）。 |
| vim       | 强大的文本编辑器，基于命令行，适用于代码和配置文件的编辑。 |
| emacs     | 另一种功能强大的文本编辑器，具有扩展性和丰富的功能。 |
| git       | 分布式版本控制系统，用于跟踪代码变更和协作开发。   |
| wget      | 从网络上下载文件的工具，支持 HTTP、HTTPS 和 FTP 协议。 |


### 图形界面又不是不能用 {#图形界面又不是不能用}

初学者理解即可，后续勤加练习方可摆脱鼠标


### 用 Xshell 连接 Linux {#用-xshell-连接-linux}

1.  Linux 启动 SSH 服务

    安装 ssh 软件
    ```bash
    sudo apt install ssh
    ```
    开机自启动 ssh 服务
    ```bash
    sudo systemctl enable --now ssh
    ```

2.  Xshell 傻瓜式操作不想写


### 用 VSCode 连接 Linux {#用-vscode-连接-linux}

打开 VSCode 中的 SSH 界面

{{< figure src="https://s2.loli.net/2024/09/03/iJdGcS5aqo2I1Nr.png" >}}

然后添加一个新连接，输入 ssh 连接的命令即可

{{< figure src="https://s2.loli.net/2024/09/03/DcQY5AoV87X9HUh.png" >}}

或者可以手动编写配置文件

{{< figure src="https://s2.loli.net/2024/09/03/YZaOmKIJWQLFr2D.png" >}}

添加并保存好连接后，每次只需点击然后输入密码即可进入


## 学习 markdown {#学习-markdown}


### 常用语法 {#常用语法}

网上有教程，不详细赘述


### 本地记录笔记 {#本地记录笔记}

{{< figure src="https://s2.loli.net/2024/09/01/lbQtOcT9ejCErsu.jpg" >}}

1.  VSCode 中打开笔记存放文件夹
2.  新建 `.md` 文件
3.  打开预览
4.  记录笔记


## 本地搭建一个自己的博客 {#本地搭建一个自己的博客}


### hexo 下载 {#hexo-下载}

首先安装 `nodejs` 和 `npm`

```bash
sudo apt install nodejs
```

由于 npm 安装软件过慢，这里我们使用 `pnpm` （具有国内镜像）

使用 `npm` 安装 `pnpm`

```bash
sudo npm install -g pnpm
```

那么现在我们的包管理工具 pnpm 就下好了，然后通过 pnpm 安装 hexo

```bash
sudo pnpm install -g hexo-cli
```

终端输入 `hexo` 验证是否成功安装

{{< figure src="https://s2.loli.net/2024/09/03/9WMCxR4ncu3NoOB.png" >}}


### 主题的安装 {#主题的安装}

选用主题为 butterfly ，可见作者的说明文档：<https://butterfly.js.org/posts/21cfbf15/>


## Day 2 预告 {#day-2-预告}


### Github 基础使用教程 {#github-基础使用教程}


### 网站上线 {#网站上线}
