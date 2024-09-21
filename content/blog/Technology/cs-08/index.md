---
title: "DAY 8 C 语言入门语法"
authors: ["qlAD"]
categories: ["技术"]
tags: ["C/C++", "编程", "计算机专业"]
slug: "cs-08"
summary: "本篇文章主要是补充基础语法中未提到的部分，包括控制流程、函数、运算符、数组等内容。"
series: ["计算机基础"]
series_weight: 8
seriesNavigation: true
draft: false
date: 2024-09-17T12:15:26+08:00
---

掌握了十大编程概念在 C 语言中的应用后，我们便能看懂基础的代码，但有些知识点还需要进一步深入学习。

## 一、注释

C 语言中有两种注释方式，分别是单行注释和多行注释。

### 1、单行注释

以 // 开头，直到行尾。

```c
//这是单行注释
```

### 2、多行注释

以 /* 开头，以 */ 结尾，中间为注释内容。

```c
/*
这是多行注释
*/
```

### 3、C99 标准

C99 即在 1999 年发布的 C 语言的标准。现在最新的标准是 C17 也被称为 C18。但是在 2024 年 10 月，`C23` 预计正式发布。

在 C99 版本（1999 年发布）**之前**，您只能在 C 中使用多行注释。

## 二、输入输出

在 C 语言中，输入输出一般分为两种，分别是 **标准输入输出** 和 **文件输入输出**。

### 1、标准输入输出

标准输入输出（又称为标准 I/O）是指程序从键盘或显示器接收输入，并将输出显示在屏幕上。

在 C 语言中，标准输入输出的函数有 `scanf()` 和 `printf()`。

```c
#include <stdio.h>

int main() {
    int a, b;
    printf("输入两个整数：");
    scanf("%d %d", &a, &b);
    printf("他们的和是：%d", a + b);
    return 0;
}
```

- `printf()` 函数：用于输出到屏幕，接受格式字符串和参数。
- `scanf()` 函数：用于从键盘输入，接受格式字符串和地址指针。 

### 2、文件输入输出

文件输入输出（又称为文件 I/O）是指程序从文件中读取数据，或者将数据写入文件。

在 C 语言中，文件输入输出的函数有 `fopen()`、`fclose()`、`fread()`、`fwrite()`。

#### I、创建文件

```c
FILE *fp;
fp = fopen("test.txt", "w");
fclose(fp);
```

`FILE` 是一个结构体，包含文件指针、文件状态、文件位置等信息。`fp` 是一个指针，指向 `FILE` 结构体。（这句话现在不理解并不重要，可以跳过）

`fopen()` 函数用于打开文件，接受文件名和打开模式作为参数。

![image.png](https://s2.loli.net/2024/09/21/akWJr6qd5PXEGlT.png)

`fclose()` 函数用于关闭文件。防止资源占用，清理空间。

#### II、写入文件（输出）

```c
FILE *fp;
fp = fopen("test.txt", "w");

fprintf(fp, "Hello, world!\n");

fclose(fp);
```

`fprintf()` 函数用于向文件写入数据，接受文件指针、格式字符串和参数。

如果 ***写入已存在的文件，则会删除旧内容，并插入新内容*** 。了解这一点很重要，因为您可能会意外擦除现有内容

如果要在不删除旧内容的情况下向文件添加内容，可以使用 `a` 模式。

```c
FILE *fp;
fp = fopen("test.txt", "a");

fprintf(fp, "Hello, world!\n");

fclose(fp);
```

***`w` 和 `a` 一样，如何文件不存在，则创建文件***

#### III、读取文件（输入）

```c
char name[100];
int age;
FILE *fp;
fp = fopen("test.txt", "r");

fscanf(fp, "%s %d", &name, &age);
printf("%s %d", name, age);

fclose(fp);
```

如果您尝试打开一个不存在的文件进行读取，`fopen()` 函数将返回 `NULL`。`fscanf` 会在单次调用中尝试读取一行数据，直到遇到换行符或文件结束。

### 3、`\n` 换行符

在 C 语言中，`\n` 是一个转义字符，它表示换行符。

常见的还有
| 转义字符 | 描述           |
| -------- | -------------- |
| `\t`     | 插入一个制表符 |
| `\\`     | 插入反斜杠字符 |
| `\"`     | 插入双引号字符 |

## 三、变量

### 1、创建变量

- C 语言中，声明（创建）变量的语法如下：

  `数据类型 变量名`

- 输出变量值的语法：

  `printf("变量值：%d", 变量名);`

  `printf(变量名);` 是不会发生值的输出

  要在 C 语言中输出变量，你必须熟悉称为 **格式说明符（格式化符号）** 的东西

### 2、格式化符号

格式说明符与 `printf()` 函数一起使用，以告诉编译器变量存储的数据类型。它基本上是变量值的占位符

例如要打印整型、浮点型、字符串型变量，格式说明符如下：

```c
// Create variables
int myNum = 15;            // Integer (whole number)
float myFloatNum = 5.99;   // Floating point number
char myLetter = 'D';       // Character

// Print variables
printf("%d\n", myNum);
printf("%f\n", myFloatNum);
printf("%c\n", myLetter);
```
***要同时组合文本和变量，必须在 `printf()` 函数中用逗号分隔它们***

你也可以只打印一个值而不将其存储在变量中，只要你使用正确的格式说明符：

```c
printf("My favorite number is: %d", 15);
printf("My favorite letter is: %c", 'D');
```

***所有格式化符号：***

| 格式化符号 | 描述               |
| ---------- | ------------------ |
| `%d`       | 整数               |
| `%f`       | 浮点型             |
| `%c`       | 字符               |
| `%s`       | 字符串             |
| `%x`       | 十六进制整数       |
| `%o`       | 八进制整数         |
| `%u`       | 无符号整数         |
| `%e`       | 指数形式的浮点数   |
| `%g`       | 自动选择浮点数格式 |
| `%%`       | 输出 % 字符        |

### 3、常量

如果你不希望其他人（或你自己）更改现有的变量值，你可以使用 `const` 关键字。

```c
const float PI = 3.14;
```

或者使用 `#define` 预处理器：

```c
#define PI 3.14
```

这样的常量只能被赋值一次，不能被修改。***一般要求在声明常量时就要赋值，以免出现意外***

## 四、数据类型

C 中的变量必须是指定的数据类型，并且必须在 `printf()` 函数中使用格式说明符来显示它。

### 1、常见类型

`int` 、 `float`  、 `char`

不要使用 char 类型来存储多个字符，因为它可能会产生错误。如果你尝试存储多个字符，它只会打印最后一个字符：

```c
char myText = 'Hello';
printf("%c", myText);
```

输出：`o`

要存储多个字符（或整个单词），请使用字符串

```c
char myText[] = "Hello";
printf("%s", myText);
```

输出：`Hello`

### 2、`sizeof()` 函数

`sizeof()` 函数用于获取变量或数据类型所占的内存大小。

```c
int myInt;
float myFloat;
char myChar;

printf("%d\n", sizeof(myInt));
printf("%d\n", sizeof(myFloat));
printf("%d\n", sizeof(myChar));
```

***为正确的目的使用正确的数据类型将节省内存并提高程序的性能。***

### 3、类型转换

C 语言支持类型转换，一般分为两种：

- 隐式类型转换：当运算符两边的数据类型不同时，会自动进行类型转换。
- 显式类型转换：通过强制类型转换，可以将一种数据类型转换为另一种数据类型。

```c
int myInt = 10;
float myFloat = 3.14;
	
float result1 = myInt + myFloat;
int result2 = (int) myInt + myFloat;
	
printf("%f\n", result1);
printf("%d\n", result2);
```

***如果是声明的类型和使用的类型不同，就可能会产生错误。***

### 4、派生类型

C 语言支持派生类型，包括数组类型、指针类型和结构体类型。

#### I、数组类型

数组类型是一种数据结构，它可以存储多个相同类型的值。数组用于在单个变量中存储多个值，而不是为每个值声明单独的变量。

1. 定义数组：`数据类型 数组名[数组大小] = {元素1, 元素2, 元素3...};`

   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   ```

   - 可以不指定数组大小，编译器会根据元素个数自动分配空间。

   ```c
   int myNumbers[] = {25, 50, 75, 100};
   ```

   ***但是如果不指定大小时，就必须有初始化的元素，否则编译器会报错。***

2. 访问数组元素：`数组名[下标]`

   数组索引从 0 开始： [0] 是第一个元素。[1] 是第二个元素，依此类推。

   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   printf("%d\n", myNumbers[0]);
   printf("%d\n", myNumbers[1]);
   printf("%d\n", myNumbers[2]);
   printf("%d\n", myNumbers[3]);
   ```

   可以使用 `for` 循环来 **遍历** 数组：
   
   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   for (int i = 0; i < 4; i++) {
       printf("%d\n", myNumbers[i]);
   }
   ```

3. 更新数组元素：`数组名[下标] = 新值;`

   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   myNumbers[0] = 10;
   printf("%d\n", myNumbers[0]);
   ```

   如果只声明了数组，但没有初始化，则数组元素的值随机。需要添加数组元素时，如下：

   ```c
   // Declare an array of four integers:
   int myNumbers[4];

   // Add elements
   myNumbers[0] = 25;
   myNumbers[1] = 50;
   myNumbers[2] = 75;
   myNumbers[3] = 100;
   ```

   但是使用此方法，您应该 ***提前知道数组元素的数量，以便程序存储足够的内存。***

4. 数组大小：`sizeof(数组名)`

   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   printf("%d\n", sizeof(myNumbers) ); // 输出 16
   ```

   `int` 类型通常为 4 字节，因此从上面的示例中，4 x 4（4 字节 x 4 个元素）= 16 字节。

   如果需要计算数组中元素的个数，可用 `sizeof(数组名) / sizeof(数组元素类型)`

   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   int numElements = sizeof(myNumbers) / sizeof(int);
   printf("%d\n", numElements); // 输出 4
   ```

   所以为了更好的遍历数组，为了更具可读性，应该这样用 `for` 循环。

   ```c
   int myNumbers[] = {25, 50, 75, 100};
   int length = sizeof(myNumbers) / sizeof(myNumbers[0]);
   for (int i = 0; i < length; i++) {
       printf("%d\n", myNumbers[i]);
   }
   ```

5. 二维数组：`数据类型 数组名[][];`

   二维数组的声明方式与一维数组类似，只是在数组名后面加上两个方括号，表示数组的维度。其中，第一个方括号表示行数，第二个方括号表示列数。

   ```c
   int myArray[3][4] = {
       {1, 2, 3, 4},
       {5, 6, 7, 8},
       {9, 10, 11, 12}
   };
   ```

   二维数组的访问方式与一维数组类似，只是多了一个维度。

   ```c
   int myArray[3][4] = {
       {1, 2, 3, 4},
       {5, 6, 7, 8},
       {9, 10, 11, 12}
   };

   printf("%d\n", myArray[1][2]); // 输出 7
   ```

   二维数组的遍历方式与一维数组类似，只是多了一个维度。

   ```c
   int myArray[3][4] = {
       {1, 2, 3, 4},
       {5, 6, 7, 8},
       {9, 10, 11, 12}
   };

   for (int i = 0; i < 3; i++) {
       for (int j = 0; j < 4; j++) {
           printf("%d ", myArray[i][j]);
       }
       printf("\n");
   }
   ```

6. 冒泡排序：

   冒泡排序算法的基本思想是：**比较相邻的元素**，如果第一个比第二个大，就交换它们。**重复这个过程**，直到没有任何元素需要交换。

   ![Peek 2024-09-21 20-20.gif](https://s2.loli.net/2024/09/21/uxG9EdhKPei7WmD.gif)

   ```c
   int myArray[5] = {5, 3, 8, 6, 2};

   for (int i = 0; i < 5; i++) {
       for (int j = 0; j < 5 - i - 1; j++) {
           if (myArray[j] > myArray[j + 1]) {
               int temp = myArray[j];
               myArray[j] = myArray[j + 1];
               myArray[j + 1] = temp;
           }
       }
   }

   for (int i = 0; i < 5; i++) {
       printf("%d ", myArray[i]);
   }
   ```

   {{< katex >}}

   该算法的运行时间为 \\(O(n^2)\\)，因此效率不高。

#### II、指针类型

指针类型是一种数据类型，它可以指向另一个变量的内存地址。指针是 C 语言的灵魂。

1. 内存地址：`&变量名`

   该运算符返回变量的内存地址。

   ```c
   int myNum = 10;
   printf("%p\n", &myNum); // 输出 0x7fff5fbff7f4
   ```

2. 定义指针：`数据类型 *指针变量名 = &变量名;`

   ```c
   int myNum = 10;
   int *myPointer = &myNum;

   printf("%d\n", myNum); // 输出 10
   printf("%p\n", &myNum); // 输出 0x7fff5fbff7f4
   printf("%p\n", myPointer); // 输出 0x7fff5fbff7f4
   ```

   指针的类型必须与你正在使用的变量的类型匹配（在我们的示例中为 int）。
   使用&运算符存储 myNum 变量的内存地址，并将其分配给指针。现在，myPointer 保存 myNum 的内存地址的值。

3. 引用指针
   
   可以使用 `*` （解引用运算符）运算符来访问指针所指向的变量。

   ```c
   int myNum = 10;
   int *myPointer = &myNum;

   printf("%d\n", *myPointer); // 输出 10
   ```

   ***指针必须小心处理，因为可能会损坏存储在其他内存地址中的数据。***

4. 指针和数组
   
   内存地址在数组中是连续的。

   ```c
   int myNumbers[4] = {25, 50, 75, 100};

   // 打印数组元素的值
   for (int i = 0; i < 4; i++)
   {
       printf("%d\n", myNumbers[i]);
   }

   // 打印数组元素的地址
   for (int i = 0; i < 4; i++)
   {
       printf("%p\n", &myNumbers[i]);
   }
   ```
   
   ***每个元素的内存地址的最后一个数字都不同，增加了 4。这是因为 int 类型的大小通常为 4 字节***

   那么指针和数组之间的关系是什么呢？嗯，在 C 中，***数组的名称实际上是指向数组第一个元素的指针。*** 即：第一个元素的内存地址与数组的名称相同：

   ```c
   int myNumbers[4] = {25, 50, 75, 100};

   printf("%p\n", myNumbers); // 输出 0x7fff5fbff7f4
   printf("%p\n", &myNumbers[0]); // 输出 0x7fff5fbff7f4
   ```

   由于 myNumbers 是指向 myNumbers 中第一个元素的指针，因此您可以使用 * 运算符来访问它：

   ```c
   int myNumbers[4] = {25, 50, 75, 100};

   printf("%d", *myNumbers); // 输出 25
   ```

   要访问 myNumbers 中的其余元素，您可以递增指针/数组 （+1、+2 等）：

   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   int *p = myNumbers;

   printf("%d\n", *p); // 输出 25
   printf("%d\n", *(p + 1)); // 输出 50
   printf("%d\n", *(p + 2)); // 输出 75
   ```

   或者使用 `for` 循环遍历：

   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   int *p = myNumbers;

   for (int i = 0; i < 4; i++)
   {
       printf("%d\n", *(p + i));
   }
   ```
   
   也可以使用指针更改数组元素的值：

   ```c
   int myNumbers[4] = {25, 50, 75, 100};
   int *p = myNumbers;

   *p = 10;
   printf("%d\n", myNumbers[0]); // 输出 10
   ```

   这种使用数组的方式可能看起来有点过分。尤其是对于像上面例子中那样的简单数组。但是，***对于大型数组，使用指针访问和操作数组可能要高效得多。***

#### III、结构体类型

结构体类型是一种数据类型，是一种将多个相关变量分组到一个位置的方法。结构中的每个变量都称为结构的成员。

与数组不同，结构可以包含许多不同的数据类型（int、float、char 等）。

1. 定义结构体：`struct 结构体名 { 成员变量类型 成员变量名;... };`

   ```c
   struct Person {
       char name[20];
       int age;
       char gender;
   };
   ```

2. 访问结构体成员：`结构体变量名.成员变量名`

   要访问该结构，必须创建 **该结构的变量**。

   ```c
   struct Person {
       char name[20];
       int age;
       char gender;
   };

   struct Person myPerson;
   myPerson.name = "John";
   myPerson.age = 30;
   myPerson.gender = 'M';

   printf("%s\n", myPerson.name);
   printf("%d\n", myPerson.age);
   printf("%c\n", myPerson.gender);
   ```

   现在，只需使用一个结构即可轻松创建具有不同值的多个结构变量

3. 有什么用？

   想象一下，您必须编写一个程序来存储有关 Cars 的不同信息，例如品牌、型号和年份。结构的优点在于，您可以创建一个 “Car template” 并将其用于您制造的每辆汽车。

   ```c
   struct Car {
       char brand[20];
       char model[20];
       int year;
   };

   struct Car myCar;
   myCar.brand = "Toyota";
   myCar.model = "Corolla";
   myCar.year = 2021;

   struct Car yourCar;
   yourCar.brand = "Honda";
   yourCar.model = "Civic";
   yourCar.year = 2022;

   printf("%s %s %d\n", myCar.brand, myCar.model, myCar.year);
   printf("%s %s %d\n", yourCar.brand, yourCar.model, yourCar.year);
   ```
   现在，您可以轻松地创建任意数量的汽车并存储其信息。结构使得代码更易于阅读、维护和扩展。

## 五、操作符（运算符）

C 语言中有丰富的运算符，包括算术运算符、关系运算符、逻辑运算符、赋值运算符、位运算符等。之前的文章中已经介绍过一些，这里再补充一些。

### 1、简单运算符

#### I、算术运算符

- `+` 、 `-` 、 `*` 、 `/` 、 `%` 、 `++` 、 `--`

读作 “加”、“减”、“乘”、“除”、“取余”、“自增”、“自减”

#### II、关系运算符

- `==` 、 `!=` 、 `<` 、 `>` 、 `<=` 、 `>=`

读作 “等于”、“不等于”、“小于”、“大于”、“小于等于”、“大于等于”

#### III、逻辑运算符

- `&&` 、 `||` 、 `!`

读作 “逻辑与”、“逻辑或”、“逻辑非”

### 2、位运算符

- `&` 、 `|` 、 `^` 、 `~` 、 `<<` 、 `>>`

***读作 “按位与”、“按位或”、“按位异或”、“按位取反”、“左移”、“右移”***

```c
int a = 5;
int b = 3;

int c = a & b;  // 1
int d = a | b;  // 7
int e = a ^ b;  // 6
int f = ~a;     // -6
int g = a << 2; // 20
int h = a >> 1; // 2    

printf("%d %d %d %d %d %d", c, d, e, f, g, h);
```

- `&` 按位与：只有两个位都为 1 时，结果才为 1，否则为 0。
- `|` 按位或：只要两个位有一个为 1，结果就为 1，否则为 0。
- `^` 按位异或：只有两个位不同时，结果才为 1，否则为 0。
- `~` 按位取反：对数据的每个二进制位取反，即把 1 变为 0，把 0 变为 1。
- `<<` 左移：将运算数的各二进位全部左移若干位，由低位变为高位，高位丢弃，低位补 0。
- `>>` 右移：将运算数的各二进位全部右移若干位，由高位变为低位，低位丢弃，高位补 0。

### 5、赋值运算符

- `=` 、 `+=` 、 `-=` 、 `*=` 、 `/=` 、 `%=` 、 `&=` 、 `|=` 、 `^=` 、 `<<=` 、 `>>=`

读作 “等于”、“加等于”、“减等于”、“乘等于”、“除等于”、“取余等于”、“按位与等于”、“按位或等于”、“按位异或等于”、“左移等于”、“右移等于”

### 6、其他运算符

#### I、逗号运算符

`a = (b = 5, 10);` 先计算 `b = 5`，然后将 `10` 赋值给 `a`。

```c
int a, b;

```

#### II、条件运算符

`a = b? c : d;` 如果 `b` 为真（非 0），则值为 `c`，否则值为 `d`。

```c
int a,b,c;

a = (b = 5, 10); 
c = (a > b)? a : b; 

printf("%d %d %d", a, b, c); 
```

## 六、控制流程

### 1、选择结构

#### I、if、else

见上一篇文章


#### II、switch

由于 if else if 还是不够简洁，所以 switch 就应运而生了，他跟 if else if 互为补充关系。switch 提供了点的多路选择

```c
int a = 10;
int b = 20;

switch (a) {
    case 10:
        printf("a is 10\n");
        break;
    case 20:
        printf("a is 20\n");
        break;
    default:
        printf("a is not 10 or 20\n");
        break;
}
```

1. switch 条件表达式的类型必须是整型
2. case 的值只能是常量, 并且还必须是整型
3. case 后面常量表达式的值不能相同 
4. case 后面要想定义变量,必须加上大括号
5. switch 中只要任意一个 case 匹配, 其它所有的 case 和 default 都会失效. 所以如果 case 和 default 后面没有 break 就会出现穿透问题
6. switch 中 default 可以省略，且位置可以随意，但只能有一个。

`if else if` 针对于范围的多路选择
`switch` 是针对点的多路选择

```c
if (score < 0 || score > 100)
{
    printf("分数无效，请输入0到100之间的分数。\n");
}
else
{
    grade = 'F'; // 默认等级
    switch (score / 10)
    {
    case 10:
    case 9:
        grade = 'A';
        break;
    case 8:
        grade = 'B';
        break;
    case 7:
        grade = 'C';
        break;
    case 6:
        grade = 'D';
        break;
    default:
        grade = 'F';
    }
    printf("你的等级是：%c\n", grade);
}
```

### 2、循环结构

#### I、for

见上一篇文章

#### II、while

```c
int count = 0;
while (count < 3)
{                                  // 循环控制条件
    printf("发射子弹~哔哔哔哔\n");   // 需要反复执行的语句
    count++;                       // 能够让循环结束的语句
}
```

1. 任何数值都有真假性
2. 当  while 后面只有一条语句时,while 后面的大括号可以省略
3. 如果 while 省略了大括号, 那么后面不能定义变量

#### III、do while
  
```c
int count = 0;
do
{                                  // 循环控制条件
    printf("发射子弹~哔哔哔哔\n");   // 需要反复执行的语句
    count++;                       // 能够让循环结束的语句
} while (count < 3);
```

`while` 和 `do while` 应用场景：

绝大多数情况下 while 和 do while 可以互换, 所以能用 while 就用 while
无论如何都需要先执行一次循环体的情况, 才使用 do while
do while 曾一度提议废除，但是他在输入性检查方面还是有点用的

## 七、函数

函数是 C 语言的核心，它提供了代码的重用性、模块化、可读性和可维护性。

### 1、定义函数

函数的定义语法如下：    

```
返回类型 函数名(参数类型 参数名, ...) {
    函数体;
}
```

### 2、调用函数

函数的调用语法如下：

```
函数名(参数, ...);
```

### 3、返回值

函数的返回值可以是任何数据类型，也可以没有返回值。

```c
int add(int a, int b) {
    return a + b;
}

void print(char *str) {
    printf("%s\n", str);
}
```

### 4、参数

信息可以作为参数传递给函数。参数在函数中充当变量。

参数在函数名称之后的括号内指定。可以根据需要添加任意数量的参数，只需用逗号分隔即可

### 5、递归函数

递归函数是指函数调用自身的函数。

```c
int f(int x) {
    if (x == 0) {
        return 1;
    }
    else {
        return x * f(x - 1);
    }
}
```

### 6、`<math.h>` 头文件

`math.h` 头文件包含了一些数学函数如：

`sin()`、`cos()`、`tan()`、`asin()`、`acos()`、`atan()`、`exp()`、`log()`、`log10()`、`pow()`、`sqrt()`、`ceil()`、`floor()`、`fabs()`、`ldexp()`、`frexp()`、`modf()`。

要查找数字的平方根，请使用 `sqrt()` 函数：

```c
printf("%f", sqrt(16));
```

## 八、模块化

参见上一篇文章

## 九、作用域

参见上一篇文章

## 十、错误处理

不作要求。