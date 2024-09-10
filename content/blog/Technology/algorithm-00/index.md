---
title: "第00期 | 环境搭建 & 递归 (一) | 基本数列递归"
authors: ["qlAD"]
categories: ["技术"]
tags: ["C/C++", "编程", "算法"]
slug: "algorithm_00"
summary: ""
series: ["Algorithm"]
series_weight: 1
seriesNavigation: true
draft: false
date: "2024-01-10"
---

需求：使用递归方式求解等差数列 1 4 7 10 13 … 第 n 项的值，要求输入 n 输出第 n 项的值

首先定义函数 f ，输入的参数为整数 n ，对于这个等差数列返回结果依然为整数，所以返回结果为整数 res

然后我们调用这个函数本身求出 res 的值，若输入的参数为 6 则函数计算流程如下

{{< figure src="https://s2.loli.net/2024/01/10/NiPxZW4KYCjRTLc.png" >}}

可以看到整个过程是依次往前计算，但是我们知道数列没有第 0 项，因此递归函数不能没有限制

{{< figure src="https://s2.loli.net/2024/01/10/frJspkON4FL3YtE.png" >}}

递归需要有起始项，避免无限制递归，因此需要手动设置 n = 1 时的 res 值

```C
if (n == 1){
                res = 1;
}
else{
                res = f(n-1)+3;
}
```

记得提前定义 res

完整代码如下

```C
#include <stdio.h>

int f(int n)
{
    int res;
    if (n == 1)
    {
        res = 1;
    }
    else
    {
        res = f(n - 1) + 3;
    }
    return res;
}

int main()
{
    int n;
    printf("Please enter a value for 'n': ");
    scanf("%d", &n);
    printf("The value of the %d item is: %d", n, f(n));
    return 0;
}
```

作业

{{< figure src="https://s2.loli.net/2024/01/10/xtQNJPzs7ywIChF.png" >}}

题 1

```C
#include <stdio.h>

int f(int n)
{
    int res;
    if (n == 1)
    {
        res = 2;
    }
    else
    {
        res = f(n - 1) * 2;
    }
    return res;
}

int main()
{
    int n;
    printf("Please enter a value for 'n': ");
    scanf("%d", &n);
    printf("The value of the %d item is: %d", n, f(n));
    return 0;
}
```

题 2

```nil
#include <stdio.h>

int f(int n)
{
    int res;
    if (n == 0 || n == 1)
    {
        res = 1;
    }
    else
    {
        res = f(n - 1) * n;
        }
    return res;
}

int main()
{
    int n;
    printf("Please enter a value for 'n': ");
    scanf("%d", &n);
    printf("The factorial of %d is: %d", n, f(n));
    return 0;
}
```
