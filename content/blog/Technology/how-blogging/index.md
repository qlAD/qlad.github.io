---
title: "如何写一篇优秀的博客"
authors: ["qlAD", "ChatGPT"]
categories: ["技术"]
tags: ["markdown", "安利", "博客"]
slug: "how-blogging"
summary: "本文介绍了如何写好技术博客，包括博客的构架、内容、格式等。"
# series: ["Linux"]
# series_weight: 
# seriesNavigation: true
draft: false
date: 2024-09-17T12:00:00+08:00
---

在撰写博客的过程中，不仅仅是内容的重要性，排版、图片、交互体验等视觉设计也同样至关重要。一个设计精美、易于阅读的博客会吸引更多读者，提升用户体验。本文将为你提供一套完整的 markdown 博客创作指南，帮助你写出既有深度又美观的博客文章。

### 一、合适的写作工具

博客创作的第一步是选择一个方便的工具，特别是如果你使用的是 Markdown 格式，那么一款好的编辑器能够极大提高效率。

- **VSCode + Markdown** 插件：VS Code 是一个强大的文本编辑器，搭配 Markdown 插件（如 Markdown All in One），可以方便地实时预览和编写 Markdown 内容。
- **Typora**：Typora 是一款简单易用的 Markdown 编辑器，支持即时预览，所见即所得，适合撰写和调整排版。
- **MarkText**：另一款优秀的 Markdown 编辑器，界面简洁，支持多种样式和实时预览。

以下是对比 VSCode、Typora 和 MarkText 这三款工具用于撰写 Markdown 的功能对比：

| 功能/工具      | VSCode                | Typora                | MarkText              |
| -------------- | --------------------- | --------------------- | --------------------- |
| **界面风格**   | 可高度自定义          | 默认即支持多种主题    | 界面简洁              |
| **实时预览**   | 需要插件支持          | 所见即所得            | 所见即所得            |
| **扩展功能**   | 丰富的插件支持        | 专注 Markdown         | 支持部分扩展功能      |
| **性能表现**   | 插件过多时会影响速度  | 启动和运行流畅        | 启动和运行流畅        |
| **导出格式**   | 通过插件导出各种格式  | HTML、PDF 等多种格式  | HTML、PDF 等多种格式  |
| **跨平台支持** | Windows, macOS, Linux | Windows, macOS, Linux | Windows, macOS, Linux |
| **费用**       | 免费                  | 商业化计划            | 开源免费              |

三者对比来看，VSCode 的自定义性和扩展性最强，适合开发者和需要强大 Markdown 扩展功能的用户。Typora 和 MarkText 则更适合注重简洁、轻便、所见即所得编辑体验的用户，且它们无需额外配置插件，直接支持常见的 Markdown 功能。

---

### 二、适合的博客引擎

博客引擎是博客的核心，它负责博客的展示、评论、搜索、统计等功能。以下是一些常用的博客引擎：

- **Hugo + Blowfish**：Hugo 是一款快速、简洁的静态网站生成器，Blowfish 是一款基于 Hugo 的博客主题。
- **Hexo + NexT**：Hexo 是一款快速、简洁的静态网站生成器，NexT 是一款基于 Hexo 的博客主题。
- **Gatsby + Gatsby-theme-blog**：Gatsby 是一款快速、简洁的静态网站生成器，Gatsby-theme-blog 是一款基于 Gatsby 的博客主题。
- **Jekyll + Minimal Mistakes**：Jekyll 是一款快速、简洁的静态网站生成器，Minimal Mistakes 是一款基于 Jekyll 的博客主题。

以上博客引擎都可以快速搭建博客，并提供丰富的主题和插件支持。选择合适的博客引擎，可以让你的博客拥有更好的性能、可扩展性和可定制性。

### 三、写作风格、优化排版，提升可读性

一篇好的博客不仅要有清晰的逻辑和内容，还要有优质的排版。以下是我使用的文章正文排版：

1. **导言**：文章的开头，通常会有一段无格式导言，用来帮助读者快速了解文章的目的或主题。
2. **章节**：用 `###` 划分主要章节，格式为：一、xxx。用 `####` 来细分内容，格式为：1、xxx。
3. **段落**：每段保持在 150 字以内，避免过长的段落。
4. **字体效果**：
   - 粗体：用于强调全文中重要的词汇。
   - 斜粗体：用于强调或次要强调段落中的一个短语或一句话。
5. **列表**：
   - 无序列表：用于列举短文本或无序信息。
   - 有序列表：用于列举长文本或有序信息。
6. **表格**：用于展示结构化数据，便于对比和分类。
7. **图片**：用于分解大量文字信息，更具吸引力。
8. **链接**：帮助读者快速跳转到其他相关文章或网站。
9. **引用**：用于需要强调一段文字，或引用外部文献、经典语句，或对某个观点进行强调。
10. **代码**：
    - 行内代码：用于展示短小的代码片段。
    - 代码块：用于展示长代码段，并提供语法高亮。
11. **分隔线**：用于分隔超长文章中的不同段落或内容。
12. **参考**：文章末尾需提供参考链接式的文献列表，帮助读者快速了解相关背景知识。

---

### 四、合理设置文章元数据

文章信息是博客文章的重要组成部分，它包含了文章的标题、摘要、关键词、分类、标签、作者信息、发布时间等。根据不同的平台，信息的呈现方式也不同。下面是我的 hugo + blowfish 博客的文章信息配置：

#### 1、Front Matter 配置：

```yaml
---
title: "怎么写好技术博客"
authors: ["qlAD", "ChatGPT"]
categories: ["技术"]
tags: ["markdown", "安利", "博客"]
slug: "how-blogging"
summary: "本文介绍了如何写好技术博客，包括博客的构架、内容、格式等。"
series: ["Markdown"]
series_weight: 1
seriesNavigation: true
draft: false
date: 2024-09-17T12:00:00+08:00
---
```

可以搭配 VScode 的 fittencode AI 插件，自动生成一些条目，如作者、分类、标签、摘要等。

![Peek 2024-09-17 18-36.gif](https://s2.loli.net/2024/09/17/D8XfGai41CTOEY9.gif)

1. **标题**：标题应简短、明确，突出文章的中心主题。
2. **作者信息**：帮助读者了解作者的经历、工作、兴趣爱好等。
3. **分类**：使文章分门别类，便于归类和检索。在我所有的博文一共三个分类，分别是技术、日常、笔记。
4. **标签**：帮助读者快速找到相关类型的文章。
5. **slug**：文章的 URL 路径，建议使用英文，便于 SEO。
6. **摘要**：一段简短的文章概括，应突出文章的核心观点，用于搜索引擎和 giscus 评论显示。
7. **系列**：将一系列相关文章组织成系列，便于用户快速了解系列内容。
8. **系列权重**：系列权重决定了文章在系列中的位置，数值越小，文章越靠前。
9.  **系列导航**：开启系列导航后，用户可以快速跳转到系列中的其他文章。
10. **草稿**：草稿文章不会被发布，可以用来保存草稿、撰写中、待发布等。
11. **发布时间**：发布时间是文章的重要信息，可以帮助读者了解文章的最新动态。

#### 2、blowfish 文章元数据配置：

所有文章放在 `content/blog` 目录，以分类为名新建文件夹，然后在分类文件夹中新建一个文章 `slug` 同名的文件夹，再在该文件夹中存放 `index.md` `featured.jpg` `backgroud.jpg` 等文件。

```sh
.
├── Daily
│   └── my-home
│       ├── background.jpg
│       ├── featured.png
│       └── index.md
├── Notes
│   └── math-01-01
│       ├── background.jpg
│       ├── featured.png
│       └── index.md
└── Technology
    └── algorithm-00
        ├── background.jpg
        ├── featured.png
        └── index.md
```

其中 index.md 文件中包含了文章的正文内容，featured.jpg 和 background.jpg 是文章的封面图和背景图。

**封面图制作工具**：[Coverview](https://coverview.vercel.app)
**背景图来源**：[Unsplash](https://unsplash.com/)

---

### 五、适当的超文本内容

一些超文本内容可以让你的博客不再单调，提升了用户体验的同时，还能更好的传达信息。比如插图、动画、视频、音频、表情符号、图标等。

#### 1、图表

图表是数据可视化的重要工具，它们能帮助你更直观地呈现数据。可以增强文章的视觉效果，帮助读者快速理解内容。

1. [Excalidraw](https://excalidraw.com/)：手绘风格的开源工具，适合绘制思维导图、流程图等。

   ![image.png](https://s2.loli.net/2024/09/17/szKb8tEZ5aXLIJg.png)

2. [Mermaid](https://mermaid-js.github.io/mermaid/)：基于 Markdown 的流程图工具，可以生成流程图、时序图等。Blowfish 也可以使用 `mermaid`

   ![image.png](https://s2.loli.net/2024/09/17/a5F9ExUXoqeg7bQ.png)

3. [blowfish 主题](https://blowfish.page/zh-cn/samples/charts/)：可以使用 `chart` 来插入图表，原理用了 `Chart.js` 来生成图表。
  
   {{< chart >}}
   type: 'line',
   data: {
      labels: ['一月', '二月', '三月', '四月', '五月', '六月', '七月'],
      datasets: [{
      label: '我的第一组数据',
      data: [65, 59, 80, 81, 56, 55, 40],
      tension: 0.2
      }]
   }
   {{< /chart >}}

#### 2、视频动画

和图表相比，视频动画更能传达信息，更能突出重点。能够增强文章的视觉效果，帮助读者更直观地理解内容。

1. **Peek**：GIF 录用工具，可以录制 GIF 动画。
2. **YouTube 引用** ：blowfish 主题提供了此功能，可以直接嵌入 YouTube 视频。
  
   ```md
   {{</* youtubeLite id="SgXhGb-7QbU" label="Blowfish-tools demo" */>}}

   ```

   {{< youtubeLite id="SgXhGb-7QbU" label="Blowfish-tools demo" >}}

3. **哔哩哔哩视频引用**：点击对应视频的分享按钮，选择“嵌入”，复制代码到你的文章中。
  
   ```html
   <iframe src="//player.bilibili.com/player.html?isOutside=true&aid=113056592037960&bvid=BV1VeHFeTEjo&cid=25675958438&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
   ```

   <iframe src="//player.bilibili.com/player.html?isOutside=true&aid=113056592037960&bvid=BV1VeHFeTEjo&cid=25675958438&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>

#### 3、代码及公式

代码和公式是技术博客不可或缺的组成部分。代码可以方便地展示代码片段，公式可以更直观地呈现数学公式。如果你的博客主题支持代码高亮和公式渲染，那么就可以直接在文章中使用。如果没有则手动添加以下工具。

- [Highlight.js](https://highlightjs.org/)：开源的代码高亮工具，支持多种语言和样式。
  ```python
  def hello_world():
      print("Hello, World!")
  ```
- [KaTeX](https://katex.org/)：高效的数学公式渲染工具，支持 LaTeX 语法，可嵌入博客。
  
  {{< katex >}}

  $$\frac{d}{dx} \left( \int_{a}^{x} f(t)\,dt \right) = f(x)$$


#### 4、表情符号和图标 🎉 

除了图表、视频动画、代码、公式，添加一点表情符号和图标也可以增强文章的趣味性。


- [Emojipedia](https://emojipedia.org/)：提供丰富的 Emoji 表情，可以让你的文章更具趣味性。
- [emojiall.com](https://www.emojiall.com/zh-hans)：表情符号大全，可以搜索到各种各样的表情符号。
- [Font Awesome](https://fontawesome.com/)：提供丰富的开源图标，可以让你的博客视觉效果更加丰富。

#### 5、一些交互式组件

这里的组件指得是一些文章卡片、引用卡片、小牌子、小按钮。他们可以增强文章的互动性，提升用户的参与度。以下是一些示例，没有说明就默认是 blowfish 主题的组件，更详细的说明请看 [blowfish 主题的文档](https://blowfish.page/zh-cn/docs/shortcodes/#button)。

**另一篇文章卡片：**

{{< article link="/cs-08/" >}}

**交互按钮：**

{{< button href="#button" target="_self" >}}
Call to action
{{< /button >}}

**仓库卡片：**

{{< github repo="nunocoracao/blowfish" >}}

**额外图片信息：**

![Peek 2024-09-16 22-13.gif](https://s2.loli.net/2024/09/16/qNeVpTkJWR2vjt3.gif "图片来源 [Hello 算法](https://www.hello-algo.com/chapter_introduction/algorithms_are_everywhere/)")

**小牌子：** [https://shields.io/](https://shields.io/)

<div class="badge status">
<a href="https://github.com/qlad/Blog/blob/main/LICENSE" target="_blank" rel="noopener noreferrer" aria-label="badge">
   <img class="nozoom" alt="License: MIT" src="https://img.shields.io/badge/License-MIT-green">
</a>          
<a href="https://github.com/qlad/Blog" target="_blank" rel="noopener noreferrer" aria-label="badge">
   <img class="nozoom" alt src="https://img.shields.io/github/repo-size/qlad/Blog">
</a>
<a href="https://github.com/qlad/Blog/tags" target="_blank" rel="noopener noreferrer" aria-label="badge">
   <img class="nozoom" alt src="https://img.shields.io/github/v/tag/qlad/Blog">
</a>
<a href="https://github.com/qlad/Blog/commits/main" target="_blank" rel="noopener noreferrer" aria-label="badge">
   <img class="nozoom" alt="Commits since last release" src="https://img.shields.io/github/commits-since/qlad/Blog/latest/main">
</a>                  
<a href="https://github.com/qlad/Blog/commits/main" target="_blank" rel="noopener noreferrer"
   aria-label="badge">
   <img class="nozoom" alt src="https://img.shields.io/github/last-commit/qlad/Blog">
</a>
</div>

---

### 六、SEO 优化与可发现性

这部分是关于博客提升在搜索引擎中的排名县官的设置，因为其内容与本篇主题相关性不大，所以仅仅提出几点建议。想了解更多，请参考 SEO 优化相关的资料。

- **标题**：标题应明确，突出文章的中心主题。
- **摘要**：一段简短的文章主题概括，太长不想读，太短不够吸引人。
- **slug**：文章的 URL 路径，建议使用英文，确保有逻辑并且保持简洁。

---

### 七、提升用户体验

除了丰富文章内容，提升用户体验还需考虑以下几个方面入手：

- **页面加载速度**：确保图片、视频和其他多媒体资源经过压缩，优化页面加载速度。
- **响应式设计**：确保博客在不同设备（如手机、平板电脑）上都有良好的显示效果。
- **分享和评论功能**：
  
  大部分主题都自带分享功能，如 Blowfish 主题的分享按钮。但是选择一个好的评论系统可以让作者更容易管理评论，提升互动性，增加用户参与度，提升文章质量。以下是一些评论系统的选择：

  1. [giscus](https://giscus.app/)：一个基于 GitHub Discussions 的评论系统，可以让用户在文章中直接进行评论。
  2. [utterances](https://utteranc.es/)：一个基于 GitHub Issues 的评论系统，可以让用户在文章中直接进行评论。
  3. [disqus](https://disqus.com/)：一个第三方评论系统，可以让用户在文章中直接进行评论。
   
- **搜索功能**：增加搜索功能，让读者可以快速找到相关文章。

---

### 八、定期维护与更新

- 检查过时的内容：定期检查文章是否有需要更新的信息，保持内容的新鲜度和准确性。
- 添加最新的参考资料：更新参考文献或外部链接，确保读者可以获取最新的信息。