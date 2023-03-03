---
title: 计组笔记_chapter1
date: 2022-03-02 20:37
categories:
	- 笔记
tags:
	- course
	- 计组

cover: /img/zhonglidrinktea.jpg
---

纯纯进行一个课件的CTRL+C、CTRL+V，根本不知道是什么意思，哭。

## 第1章  计算机概述

### 计算机的分类和应用

通用计算机分类
![通用计算机分类](https://api2.mubu.com/v3/document_image/bb50f260-a398-4bd2-9a97-d6af00a88dff-16175743.jpg)

面向应用的分类

1. 通用计算机
2. 专用计算机/嵌入式计算机(Embedded)

计算机的应用
略

### 计算机发展简史

#### 计算机的演进

1. 第0代 机械时代（BC-1940
2. 第1代 电子管时代（1943-1959）
3. 第2代 晶体管时代（1960-1968）
4. 第4代 超大规模集成电路时代（1978－现在）
5. 第5代 量子计算机、光计算机、生物计算机？

世界上第一台计算机：ENIAC

摩尔定律：集成电路芯片中晶体
管数量大体上每2年翻一番

#### <mark>计算机的性能指标</mark>(易考)

![](https://api2.mubu.com/v3/document_image/7ec2da4e-3831-44cd-b68a-6509f0314ac3-16175743.jpg)

![](https://api2.mubu.com/v3/document_image/099dd094-3f03-436f-afde-e0e84afb42d6-16175743.jpg)

1. 响应时间
2. 利用率
3. 处理机字长
4. 总线宽度
5. 吞吐量：通常用KB、MB、GB(gigabit吉比特)和TB表示。B表示Byte(字节)，b表示bit。 $K\equiv2^{10},M\equiv2^{20},G\equiv2^{30}$
6. 存储器带宽：一般用字节数/秒表示
7. 主频/时钟周期:CPU的工作节拍受主时钟控制，主时钟不断产生固定频率的时钟，主时钟的频率f称为CPU的主频。<mark>度量单位是MHz（$10^6$）、GHz($10^9$)。</mark>可以理解为每秒有几个CPU时钟周期。
   主频的倒数称为CPU时钟周期T，T=1/f，度量单位是微秒，纳秒。
8. CPU执行时间:表示CPU执行一段程序所占用的CPU时间，也可以用指令数目x每条指令的平均执行时间。而每条指令的平均执行时间可以用每条指令所需的平均时钟周期数目x时钟周期时间。
    <mark>$\tiny CPU执行时间=程序的指令数\times CPI\times CPU时钟周期时间$</mark>
9.  **CPI（Clock Cycles Per Instruction）**:表示每条指令执行所需要的时钟周期数，或执行一条指令所需的平均时钟周期数。
<mark>$\tiny CPI=程序执行所需的CPU时钟周期总数÷程序的指令总数$</mark>
11. MIPS：每秒百万指令数。<u>M:百万million ($\tiny\underline{10^6}$) ，I:instruction指令，PS:per second每秒</u>
    <mark>$\tiny MIPS=（指令总数 \div 程序执行时间）\times 10^{-6}$</mark>
12. MFLOPS：每秒百万次浮点操作次数。<u>FLO：浮点操作</u>
   <mark>$\tiny MFLOPS=（程序中的浮点运算次数\div程序执行时间)\times 10^{-6}$</mark>
13. TFLOPS：每秒万亿浮点操作次数。T:trillion兆，也就是万亿，$10^{12}$
    <mark>$\tiny TFLOPS=（程序中的浮点运算次数\div程序执行时间)\times 10^{-12}$</mark>
14. 例题
    ![例题](https://api2.mubu.com/v3/document_image/5e55985c-21a8-465c-bb80-b572227826a7-16175743.jpg)
	题解![tijie](https://api2.mubu.com/v3/document_image/1646144690025ebba.jpg)
    ![](https://api2.mubu.com/v3/document_image/304a5e77-8917-4021-8b27-adb2d0e25941-16175743.jpg)

### 计算机的硬件

#### 计算机的组成(五大部分)

1. 存储器
2. 运算器
3. 控制器
4. 输入输出设备

- 计算机内部，指令和数据均以二进制的形式存储，其中，指令包括操作码和地址码（对谁进行该操作）
- 关于rax,eax,ax,al:AL是低八位，AX是本名，16位，EAX是extended即扩展的意思，32bits，而RAX则是re-extended，再拓展，64位

### 计算机系统的层次结构

![层次结构2](https://api2.mubu.com/v3/document_image/a3c75fab-9dd4-41bb-9fa5-53a7d99b2edf-16175743.jpg)

![层次结构3](https://api2.mubu.com/v3/document_image/714d08ad-abe7-4606-8270-1b2566e12ba7-16175743.jpg)

软件与硬件的逻辑等价性,理论上讲，任何软件算法都可以用硬件实现，反之亦然。
![软件与硬件的逻辑等价性](https://api2.mubu.com/v3/document_image/9bbf4121-a5d0-441c-af82-a56e3781eb3a-16175743.jpg)

## 第2章 运算方法和运算器I

### 数据与文字的表示方法

#### 常用的数据表示格式

1. 定点表示：小数点的位置是固定的，可以表示纯小数或者纯整数
2. 浮点表示：见CSAPP
3. 十进制数格式：

带有符号表示的二进制数：<mark>真值</mark>
机器中把符号“数字化”的数：<mark>机器数</mark>或者<mark>机器码</mark>

常用的机器码包括：(一般针对有符号数)

- 原码：真值的符号位变成0/1，0为+。
- 反码:反码就是二进制数<mark>除符号位以外</mark>的的各位数码</mark>0变为1，1变为0</mark>
- 补码
- 移码

补码整数表示略，记住按位取反再加一就可以
补码的定点小数表示如下：
![定点小数表示](https://api2.mubu.com/v3/document_image/535cd946-0888-4aa0-98f7-2b4c95267e57-16175743.jpg)
这里注意，two's complement是补码的英文，直译为2的补足部分，这里的模的意思和时钟的模为12相同，意为正数负数的补码表示相加就是模值。

反码和补码的关系：定点小数也满足整数的“按位取反再加一”的规则。
![关系](https://api2.mubu.com/v3/document_image/82299582-3a0e-4d14-92cf-7d23426ff4ad-16175743.jpg)
特别的，+0的反码为：00000000(8位)
-0的反码为：11111111(8位)

关于移位运算，这是C语言中的
[C语言中的位移位运算](https://blog.csdn.net/heiniaoyuyouling/article/details/4696586)


## 补充：课程概要

![课程要求嘿嘿嘿](https://api2.mubu.com/v3/document_image/5b9257b0-af72-46f3-9bf1-c75e55e111da-16175743.jpg)

课程内容，左边是期中前学的，右边是期中后学的。

![课程内容哈哈哈](https://api2.mubu.com/v3/document_image/d40960c4-d339-42d5-9d88-6b1c4d2cd975-16175743.jpg)

实验内容
![实验内容](https://api2.mubu.com/v3/document_image/02f22f78-2b45-4c0e-8823-06862639af5d-16175743.jpg)


