---
title: "第02期 | 递推算法 | 经典题型解析 | 过河卒问题（递推算法求解）"
authors: ["qlAD"]
categories: ["技术"]
tags: ["C/C++", "编程", "算法"]
slug: "algorithm_02"
summary: "本篇文章将介绍递推算法的基本概念，经典题型解析，以及过河卒问题的递推算法求解。"
series: ["Algorithm"]
series_weight: 3
seriesNavigation: true
draft: false
date: "2024-01-12"
---

原系列视频作者链接：[【从0开始的C++算法课】第02期 | 递推算法 | 经典题型解析 | 过河卒问题（递推算法求解）](https://www.bilibili.com/video/BV1FC4y1E7BD/)

{{< figure src="https://s2.loli.net/2024/01/12/KbSN5BrwUxaj7qs.png" >}}

要求：

输入：B 点坐标 (n,m)一级对方马 C 的坐标 (x,y) （马的坐标一定在棋盘范围之内，但可以落在边界上）

输出：小卒从 A 点到 B 点的路径条数

输入样例：6 6 3 2

输出样例：17

卒的行走规则只有向右和向下，当不考虑马的情况简单分析如下

1.  B 点和 A 点在同一行时路径只有 1 条

2.  B 点和 A 点在同一列时路径只有 1 条

3.  当 B 点在棋盘中间时，例如在 (1,1) 时，共有 先向下再向右 或者 先向右再向下 两条路径

4.  当 B 点在 (1,2) 时，共有 3 条路径

分析可得，当 B 在中央时，路径条数总数是到达 B 所在位置上方和所在位置左方路径条数相加所得。想要知道到达上边或者左边的路径数就需要知道更上边或者更左边的路径数，可用递推表示。

{{< figure src="https://s2.loli.net/2024/01/12/WfvSLD6r3mqyjoB.png" >}}

由于设计到坐标一般选择二维数组进行储值：数组名 [行数 n] [列数 m]

并且提前规定 n = 0 或 m = 0 时 数组的值为 1，便可实现递推

```C
int a[30][30] = {0};
int n, m;
printf("Please enter two value for 'n' and 'm': ");
scanf("%d %d", &n, &m);

for (int i = 0; i <= n; i++)
{
        for (int j = 0; j <= m; j++)
        {
                if (i == 0 && j == 0)
                {
                        continue;
                }
                if (i == 0 || j == 0)
                {
                        a[i][j] = 1;
                }
                else
                {
                        a[i][j] = a[i - 1][j] + a[i][j - 1];
                }
        }
}
```

以上只完成了没有马的情况下到达 B 点的路径条数，还需将马所在的 C 点及马的控制点 P 筛选出来

{{< figure src="https://s2.loli.net/2024/01/12/Q9wAX8uWL4PtdD6.png" >}}

我们可提前将整个 B 点所在的表格中数组标记为 1 再将 C 点及 P 点数组的值标记为 0，需要注意

1.  标记点是否存在于 B 点所在表格之内即阴影部分

2.  标记点是否超出棋盘范围

可用简单的 if 语句判断

{{< figure src="https://s2.loli.net/2024/01/12/MU87jFmdqNwKZYe.png" >}}

以及马的本身也为 0

但是如果当有任意一个马的控制点 P 占据了第 0 行和第 0 列的位置，就不能之间将第 0 行和第 0 列标记为 1 了，因为会被 P 点阻挡

分析表格后发现，第 0 行的每个位置的值都等于它左边的值，第 0 列的每个位置的值都等于它上方的值

完整修改代码如下：

```C
#include <stdio.h>

int main()
{
    int a[30][30] = {0};
    int n, m, x, y;
    printf("Please enter two value for 'n' and 'm': ");
    scanf("%d %d", &n, &m);
    printf("Please enter two value for 'x' and 'y': ");
    scanf("%d %d", &x, &y);

    for (int i = 0; i <= n; i++)
    {
        for (int j = 0; j <= m; j++)
        {
            a[i][j] = 1;
        }
    }

    a[x][y] = 0;
    if (x + 2 <= n && y - 1 >= 0)
    {
        a[x + 2][y - 1] = 0;
    } // P1
    if (x + 2 <= n && y + 1 <= m)
    {
        a[x + 2][y + 1] = 0;
    } // P2
    if (x + 1 <= n && y + 2 <= m)
    {
        a[x + 1][y + 2] = 0;
    } // P3
    if (x - 1 >= 0 && y + 2 <= m)
    {
        a[x - 1][y + 2] = 0;
    } // P4
    if (x - 2 >= 0 && y + 1 >= 0)
    {
        a[x - 2][y + 1] = 0;
    } // P5
    if (x - 2 >= 0 && y - 1 >= 0)
    {
        a[x - 2][y - 1] = 0;
    } // P6
    if (x - 1 >= 0 && y - 2 >= 0)
    {
        a[x - 1][y - 2] = 0;
    } // P7
    if (x + 1 <= n && y - 2 >= 0)
    {
        a[x + 1][y - 2] = 0;
    } // P8

    for (int i = 0; i <= n; i++)
    {
        for (int j = 0; j <= m; j++)
        {
            if (i == 0 && j == 0)
            {
                continue;
            }

            if (a[i][j] == 0)
            {
                continue;
            }
            if (i == 0)
            {
                a[i][j] = a[i][j - 1];
            }
            else if (j == 0)
            {
                a[i][j] = a[i - 1][j];
            }
            else
            {
                a[i][j] = a[i - 1][j] + a[i][j - 1];
            }
        }
    }

    printf("%d", a[n][m]);
    return 0;
}
```

测试样例

输入 6 6 3 2

输出 17

题目：使用递推求解

{{< figure src="https://s2.loli.net/2024/01/12/LwhaoQ1543HuTtR.png" >}}
