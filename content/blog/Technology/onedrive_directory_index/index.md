---
title: "搭建 OneDrive 目录索引"
authors: ["qlAD"]
categories: ["技术"]
tags: ["博客", "软件", "工具"]
slug: "onedrive_directory_index"
summary: ""
# series: ["CS"]
# series_weight: 1
# seriesNavigation: true
draft: false
date: 2021-08-24T09:15:26+08:00
---

我的 OneDrive 目录索引目前依赖两个项目

onedrive-cf-index 部署在 CloudFlare Workers 上

{{< github repo="spencerwooo/onedrive-cf-index" >}}

onedrive-vercel-index 部署在 Vercel 上

{{< github repo="spencerwooo/onedrive-vercel-index" >}}

vercel 的速度没有 cf 的快，但是 vercel 部署简单，预览文件功能轻量快速。

## 部署指南

参考 [README.md](https://github.com/spencerwooo/onedrive-cf-index/blob/main/README-CN.md)

## cf-index 部署

### 准备工作（CloudFlare Workers 设置）

1、导入并 clone 仓库

[onedrive-cf-index/README-CN.md at main · spencerwooo/onedrive-cf-index](https://github.com/spencerwooo/onedrive-cf-index/blob/main/README-CN.md)

复制仓库的 url 地址，并导入成你的 GitHub 私人仓库（不要直接 fork 仓库），在你的电脑上使用 `git clone https://github.com/你的仓库地址` 命令来下载到本地

2、npm 安装依赖

进入到刚刚拉取的文件夹，使用 npm 安装依赖

```bash
# 安装 CloudFlare Workers 官方编译部署工具
npm i @cloudflare/wrangler -g
# 使用 npm 安装依赖
npm install
# 使用 wrangler 登录 CloudFlare 账户
wrangler login
# 使用这一命令检查自己的登录状态
wrangler whoami
```

打开 [https://dash.cloudflare.com/login](https://dash.cloudflare.com/login) 登录 CloudFlare，选择自己的域名，**再向下滚动一点，我们就能看到右侧栏处我们的 `account_id` 以及 `zone_id` 了。** 同时，在 `Workers` -> `Manage Workers` -> `Create a Worker` 处创建一个 **DRAFT** worker。

修改我们的 [wrangler.toml](https://github.com/spencerwooo/onedrive-cf-index/blob/main/wrangler.toml)：

- `name`：就是我们刚刚创建的 draft worker 名称
- `account_id`：我们的 Cloudflare Account ID；
- `zone_id`：我们的 Cloudflare Zone ID

3、创建叫做 BUCKET 的 Cloudflare Workers KV bucket

```bash
# 创建 KV 
bucketwrangler kv:namespace create "BUCKET"
# ... 或者，创建包括预览功能的 KV 
bucketwrangler kv:namespace create "BUCKET" --preview
```

修改 [wrangler.toml](https://github.com/spencerwooo/onedrive-cf-index/blob/main/wrangler.toml) 里面的 `kv_namespaces`：

- `kv_namespaces`：我们的 Cloudflare KV namespace，仅需替换 `id` 和（或者）`preview_id` 即可。*如果不需要预览功能，那么移除 `preview_id` 即可。*

### 生成 OneDrive API 令牌

1、访问此 URL 创建新的 Blade app：[Microsoft Azure App registrations](https://login.partner.microsoftonline.cn/organizations/oauth2/v2.0/authorize?redirect_uri=https%3A%2F%2Fportal.azure.cn%2Fsignin%2Findex%2F&response_type=code%20id_token&scope=https%3A%2F%2Fmanagement.core.chinacloudapi.cn%2F%2Fuser_impersonation%20openid%20email%20profile&state=OpenIdConnect.AuthenticationProperties%3Des1Lx3y7IQ5HTYG2CaVp5WybYjkmiaW0BcN6iNzIaypRwlJzP_Z3WwoHYJ_HkapAc1T62h6ffh6YOrlaFb2-TeKWcEhIjK-Zzs3VosPzwgp0-f7gbsHv5bAZKhOu3yKJ-x0o3ZBcYtzzmtkQFYjPCCKwXuMFFx0vXFTdrT5R7OpFoQAX7eoGkc4NIAIjehXcplsWCh5wyALBYQG71BnB1Z8X40BHgEWeiXS1gH31zaKSFLMeQlOG4sc7NVthNAE4oV5KDlfnCvA6-xGaN2__FA&response_mode=form_post&nonce=637652917133127518.NTc2M2MwMTQtMjgzYy00MDRlLThmZGYtMWQwMTUwNTJhMTMzY2EyZWIzMzUtNjk3NC00YmMxLTk3YjQtN2MzNDE2YWZkYzY2&client_id=c44b4083-3bb0-49c1-b47d-974e53cbdf3c&site_id=501430&msafed=0&client-request-id=311162fb-84a4-4269-a8aa-ea422e924fc1&x-client-SKU=ID_NET472&x-client-ver=6.11.0.0)（普通版 OneDrive） 或 [Microsoft Azure.cn App registrations](https://login.partner.microsoftonline.cn/organizations/oauth2/v2.0/authorize?redirect_uri=https%3A%2F%2Fportal.azure.cn%2Fsignin%2Findex%2F&response_type=code%20id_token&scope=https%3A%2F%2Fmanagement.core.chinacloudapi.cn%2F%2Fuser_impersonation%20openid%20email%20profile&state=OpenIdConnect.AuthenticationProperties%3DTgh2XOl1_HQipWuj1tO_4AdN9AKaI7mcVRYOJ1IbmFrak4ruNmPEA-QK4_SPU38RAVVHBUsPr2t-IaoYQd8RVrJEB3oZZ0wnRdanuY0CDugioGzokOFIfGJpBpB7gKwe5K786weY533RLvrdZGDNJhXLB4HgQR3Sgwr_DSLVL4zAZhDtXb-ML9KeNok5kTW2wV9qw29ZoW1lSXzyeaKLryKWVxTZDEe8UK6JuhxaUqg0Jw8XbdYxmUplie-O_Cm3jCch5KOguG7bYIdJz1IHxQ&response_mode=form_post&nonce=637652918149333414.NWI4ZGY4YzgtNmMwOS00YzlhLWI0YzYtZDg0MWI3NzVlNjkyMDVhZDM5ZDMtNjU2OC00NGMzLWEwNDktZTIxNjJjYjBiZDdj&client_id=c44b4083-3bb0-49c1-b47d-974e53cbdf3c&site_id=501430&msafed=0&client-request-id=311162fb-84a4-4269-a8aa-ea422e924fc1&x-client-SKU=ID_NET472&x-client-ver=6.11.0.0)（OneDrive 世纪互联版本）

![https://i.loli.net/2021/08/23/MDop8V6vTn3tmfr.png](https://i.loli.net/2021/08/23/MDop8V6vTn3tmfr.png)

- 名称可以自定义
- 受支持的帐户类型选择 “任何组织目录(任何 Azure AD 目录 - 多租户)中的帐户和个人 Microsoft 帐户(例如，Skype、Xbox)”
- 重定向 URI 填写 http://localhost

确认无误后点击 “注册”

2、配置 API 权限

![https://i.loli.net/2021/08/23/O56FoChEyjT3QGl.png](https://i.loli.net/2021/08/23/O56FoChEyjT3QGl.png)

打开 “API 权限” 面板，选择 “Microsoft Graph”，选择 “委托的权限”，并搜索 `offline_access`, `Files.Read`, `Files.Read.All` 这三个权限，选择这三个权限，并点击 “添加权限”

3、查看 “**应用程序客户端ID**”

![https://i.loli.net/2021/08/23/WIx9kXBVzOtF2jN.jpg](https://i.loli.net/2021/08/23/WIx9kXBVzOtF2jN.jpg)

4、生成 “**客户端密码**”

![https://i.loli.net/2021/08/23/UsLX2Rib7QhYJeW.png](https://i.loli.net/2021/08/23/UsLX2Rib7QhYJeW.png)

打开 “证书和密码” 面板，点击 新客户端密码，点击 “添加” 并复制 “值” 并保存下来 （仅有此一次机会）

5、生成 **refresh_token**

确保你已经知道以下凭证：

- `client_id` 即 **应用程序客户端ID**
- `client_secret` 即 **客户端密码**

在本机（需要 Node.js 和 npm 环境）上面执行如下命令：

```bash
npx @beetcb/ms-graph-cli@next -s -l CN
```

根据你自己的情况选择合适的选项，并输入我们上面查看复制的一系列令牌配置等，其中 `redirect_url` 可以直接回车。

6、最后，在我们的 OneDrive 中创建一个公共分享文件夹，比如 /Public 即可。

## 将应用部署到 CloudFlare Workers 上

进入到准备工作时拉取的文件夹

1、修改 [src/config/default.js](https://github.com/spencerwooo/onedrive-cf-index/blob/main/src/config/default.js)：

- `client_id`：刚刚获取的 OneDrive 应用客户端ID；
- `base`：之前创建的公共分享文件夹 即 /Public；

2、使用 `wrangler` 添加 Cloudflare Workers 环境变量（有关认证密码的介绍请见 [🔒 私有文件夹](https://github.com/spencerwooo/onedrive-cf-index/blob/main/README-CN.md#-%E7%A7%81%E6%9C%89%E6%96%87%E4%BB%B6%E5%A4%B9)）：

在文件夹所在终端中输入：

```bash
# 添加我们的 refresh_token 和 client_secret
wrangler secret put REFRESH_TOKEN # ... 并在这里粘贴我们的 refresh_token
wrangler secret put CLIENT_SECRET # ... 并在这里粘贴我们的 应用客户端ID
wrangler secret put AUTH_PASSWORD（可选） # ... 在这里输入我们自己设置的认证密码
```

3、编译与部署

我们可以使用 `wrangler` 预览部署：

```bash
wrangler preview
```

如果一切顺利，我们即可使用如下命令发布 Cloudflare Worker：

```bash
wrangler publish
```

我们也可以创建一个 GitHub Actions 来在每次 `push` 到 GitHub 仓库时自动发布新的 Worker，详情参考：[main.yml](https://github.com/spencerwooo/onedrive-cf-index/blob/main/.github/workflows/main.yml)。

如果想在自己的域名下部署 Cloudflare Worker，请参考：[How to Setup Cloudflare Workers on a Custom Domain](https://www.andressevilla.com/how-to-setup-cloudflare-workers-on-a-custom-domain/)。

4、样式、内容的自定义

- 我们可以更改默认「着落页面」，直接修改 [src/folderView.js](https://github.com/spencerwooo/onedrive-cf-index/blob/main/src/folderView.js#L51-L55) 中 `intro` 的 HTML 即可；
- 我们也可以更改页面的 header，直接修改 [src/render/htmlWrapper.js](https://github.com/spencerwooo/onedrive-cf-index/blob/main/src/render/htmlWrapper.js#L24) 即可；
- 样式 CSS 文件位于 [themes/spencer.css](https://github.com/spencerwooo/onedrive-cf-index/blob/main/themes/spencer.css)，可以根据自己需要自定义此文件，同时也需要更新 [src/render/htmlWrapper.js](https://github.com/spencerwooo/onedrive-cf-index/blob/main/src/render/htmlWrapper.js#L3) 文件中的 commit HASH；
- 我们还可以自定义 Markdown 渲染 CSS 样式、PrismJS 代码高亮样式，等等等。
