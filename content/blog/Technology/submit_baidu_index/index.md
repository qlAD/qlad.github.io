---
title: "配置 GitHub Actions 实现自动化提交百度收录"
authors: ["qlAD"]
categories: ["技术"]
tags: ["博客", "软件", "工具"]
slug: "submit_baidu_index"
summary: "本文将介绍如何通过 GitHub Actions 自动提交百度收录，提高网站内容更新的效率和准确性。"
draft: false
date: 2024-09-12T09:15:26+08:00
---

> 在现代网站开发中，确保搜索引擎能够迅速收录新发布的内容是至关重要的。百度作为主要的搜索引擎之一，为了优化网站的搜索引擎排名，我们需要定期提交网站的更新。本文将介绍如何使用 GitHub Actions 自动提交百度收录，实现自动化的内容更新通知。

## 目标

通过配置 GitHub Actions 实现以下目标：
1. **提取 `sitemap.xml` 文件中的所有 URL**：从 `sitemap.xml` 文件中提取出所有需要提交的 URL。
2. **提交 URL 到百度**：将提取的 URL 通过 API 提交到百度，以确保搜索引擎能及时更新网站内容。

## 步骤概览

1. **创建 Bash 脚本**：编写一个脚本来提取 URL 并提交到百度。
2. **配置 GitHub Actions**：设置 GitHub Actions 工作流以在每次推送到主分支时自动运行该脚本。

## 创建 Bash 脚本

首先，我们需要创建一个 Bash 脚本，用于从 `sitemap.xml` 中提取 URL 并将其提交到百度。

### 1. 编写 `submit_urls.sh` 脚本

在项目的 `scripts` 目录下创建 `submit_urls.sh` 文件，内容如下：

```bash
#!/bin/bash

# Use the provided sitemap path or default path
SITEMAP_PATH=${1:-"../public/zh-cn/sitemap.xml"}

# Ensure BAIDU_API_URL is set
if [ -z "$BAIDU_API_URL" ]; then
  echo "Error: The BAIDU_API_URL environment variable is not set."
  exit 1
fi

# Check if the sitemap file exists
if [ ! -f "$SITEMAP_PATH" ]; then
  echo "Error: Sitemap file not found at $SITEMAP_PATH."
  exit 1
fi

# Extract all URLs from sitemap.xml and save them to urls.txt
echo "Extracting URLs from sitemap.xml..."
grep -oP '(?<=<loc>).*?(?=</loc>)' "$SITEMAP_PATH" > urls.txt

URL_COUNT=$(wc -l < urls.txt)
echo "Extracted $URL_COUNT URLs and saved them to urls.txt."

# Use curl to submit all URLs in urls.txt to Baidu
echo "Submitting URLs to Baidu..."
response=$(curl -s -H 'Content-Type:text/plain' --data-binary @urls.txt "$BAIDU_API_URL")

# Print the response from the curl command
echo "Response from Baidu: $response"

echo "Submission completed!"
```

### 2. 确保脚本可执行

通过以下命令为脚本赋予可执行权限：

```bash
chmod +x scripts/submit_urls.sh
```

## 配置 GitHub Actions

接下来，我们需要设置 GitHub Actions 工作流，以便在每次推送到主分支时自动运行 `submit_urls.sh` 脚本。

### 1. 创建 GitHub Actions 工作流配置文件

在 `.github/workflows` 目录下创建一个新的 YAML 文件，比如 `submit_urls.yml`，内容如下：

```yaml
name: Submit URLs to Baidu

on:
  push:
    branches:
      - main

jobs:
  submit-urls:
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repository
        uses: actions/checkout@v2

      - name: List files for debugging
        run: ls -R

      - name: Submit URLs to Baidu
        env:
          BAIDU_API_URL: ${{ secrets.BAIDU_API_URL }} # Securely reference the secret
        run: ./scripts/submit_urls.sh "./public/zh-cn/sitemap.xml"
```

### 2. 配置 GitHub Secrets

为了保护百度 API URL，您需要在 GitHub 仓库中配置一个密钥。进入仓库的 **Settings** -> **Secrets and variables** -> **Actions**，添加一个新的密钥，名称为 `BAIDU_API_URL`，并填入您的百度 API URL。

## 总结

通过上述步骤，我们配置了 GitHub Actions 自动化提交百度收录。每次将代码推送到主分支时，GitHub Actions 会自动运行 `submit_urls.sh` 脚本，提取 `sitemap.xml` 中的 URL 并将其提交到百度。这不仅简化了网站内容更新的工作流程，还确保搜索引擎能够迅速捕捉到网站的最新变化。

希望这篇文章对你有所帮助，提升你的站点在搜索引擎中的可见性。如果有任何问题或建议，请随时留言讨论！