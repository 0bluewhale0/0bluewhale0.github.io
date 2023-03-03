---
title: 计组笔记_chapter3
date: 2022-04-27 09:58:41
categories:
	- 笔记
tags:
	- course
	- 计组

cover: /img/v2-e91f0df92f38f74774dbb5e3894b9ce9_720w.jpg
---

## 3.1 存储器概述

- **易失性**半导体存储器统称为RAM
  - 静态RAM（SRAM）
  - 动态RAM（DRAM）
- **非易失性**的半导体存储器统称为ROM
  - 掩膜ROM（MASK ROM）:出厂的时候就写好了，不能改了捏
  - 可编程ROM（PROM）
    - 一次性可编程ROM（OTP ROM）
    - 可擦除PROM（EPROM）
      - 紫外线擦除EPROM（UV EPROM）
      - 电擦除EPROM（EEPROM，E2PROM）
      - 闪速存储器（FLASH ROM)
- 存储器的目标
  - 大容量
  - 高速度
  - 低价格
- 现代计算机的层次存储器系统
  - Register
  - On-Chip Cache
  - Second Level Cache(SRAM)
  - Main Memory(DRAM)
  - Secondary Storage(Disk)
  - Tertiary Stroage(Disk)

>其中，内存=Cache+主存

内存的主要技术指标

- 访问时间TA：
  从存储器接收到读写命令道信息被读出或写入完成所需的时间，取决于存储介质的物理特性和寻址部件的结构
- 存取周期TM：
  在存储器连续读写过程中一次完整的存取操作所需的时间（CPU连续两次访问存储器的最小时间间隔）
- 功耗
- 可靠性

主存储器的读写过程

- 读过程:
  - 给出地址
  - 给出片选与读命令
  - 保存读出内容
- 写过程:
  - 给出地址
  - 给出片选与数据
  - 给出写命令

## 3.2 随机读写存储器

存储器芯片的基本结构

- 地址线
- 数据线（双向）
- 片选信号
- 读写控制线

n位存储器芯片的结构
![n位存储器芯片的结构](https://api2.mubu.com/v3/document_image/32de5b46-4a1e-44a0-9f79-07893d6352e0-16175743.jpg)

### SRAM基本电路

>关于MOS管：
 ![MOS管](https://api2.mubu.com/v3/document_image/9af0e8b2-247c-40d4-8668-44e85d9cc555-16175743.jpg)
 当G极电压大于导通电压时，DS导通，G极仅有电压而无电流。

#### SRAM读操作

![读操作](https://api2.mubu.com/v3/document_image/ca7d354f-54ce-4fbc-a7ff-68b180d76484-16175743.jpg)

#### SRAM写操作

![写操作](https://api2.mubu.com/v3/document_image/4f97314f-340d-414a-ad41-88b706d3ec3a-16175743.jpg)

#### SRAM存储器的结构

![SRAM存储器的结构](https://api2.mubu.com/v3/document_image/704b1a9d-4bdd-40b6-94e2-2bba8b20768a-16175743.jpg)

#### SRAM实例

![实例](https://api2.mubu.com/v3/document_image/b63aa862-bd86-4a2d-bfb0-030536d5ccbd-16175743.jpg)

#### 字扩展&位扩展

[这位老哥](https://blog.csdn.net/qq1350975694/article/details/107290348)讲的不错，能看懂，就是容易记不住。

### 动态存储器DRAM

可以减少晶体管的数目，但是存储的电荷会泄露，所以需要动态刷新电路。

#### 四管动态存储单元

DRAM刷新是对一行进行刷新的。

#### 单管动态存储单元

![单管动态存储单元](https://api2.mubu.com/v3/document_image/392de6a0-3436-4afc-a57f-fcb955c5e5e7-16175743.jpg)
word line是字线，bit line是数据线

#### DRAM写操作

- 字线高电平，T导通
  - 写1: 数据线为高电平，通过T对C充电
  - 写0: 数据线为低电平，C通过T放电
![写操作](https://api2.mubu.com/v3/document_image/3658afcf-ccf6-49fe-87a9-7dcf1007bd7c-16175743.jpg)

#### DRAM读操作&刷新操作

- 数据线预充电至VDD/2
- 当字线为高电平，T导通，若原来C充有电荷，则C放电使数据线电位小幅上升，经放大后读出为1；若原来C上无电荷，则C充电使数据线电位小幅下降，经放大器后读出为0。
- 单管DRAM单元的读出是破坏性的，在读出信息后要立即对单元进行“回写”，以恢复原信息。
![读操作&刷新操作](https://api2.mubu.com/v3/document_image/2c510ee9-446e-4aaf-adc4-a55cedbd7002-16175743.jpg)

### DRAM和SRAM的比较

- DRAM
  - 主存
  - 电容+1晶体管
  - 需要刷新（2~8ms）
  - 读操作是破坏性的
  - 密度高
  - <font color=red>地址线分时复用</font>:管脚是稀缺资源，通常是行地址和列地址进行分时复用
- SRAM
  - Cache
  - 速度比DRAM快

### DRAM读时序

![DRAM读时序](https://api2.mubu.com/v3/document_image/4de50a3c-bb58-4609-ab18-1d9e66e6fdcc-16175743.jpg)
OE_L是输出使能信号，WE_L是写使能信号，RAS_L是row 行地址有效，CAS_L是column 列地址有效。_L代表低电平有效。
OE_L可以在CAS之前或者之后有效，区别是是否读出一些垃圾数据。
了解即可
![了解即可](https://api2.mubu.com/v3/document_image/9eeef8a0-7f7c-4e4e-8d6c-0b23c3b37721-16175743.jpg)

### DRAM的刷新

刷新周期一般是几毫秒

#### 集中式刷新

在整个刷新间隔里，前大半部分可以读写，后小半部分刷新。
在后小半部分里，CPU无法访问存储器，也就是不能执行指令，响应系统紧急事件。

#### 分散式刷新

例如：某DRAM有1024行，若刷新周期为8ms，则必须在8ms内把所有1024行刷新一遍。
8000µs÷1024≈7.8µs，即每隔7.8µs刷新**一行**。
有点像时分复用。
需要一些相应的辅助电路，比如记录刷新到第几行了，以及一个额外的计时器etc.

两种常用的传递刷新信号的方式

1. 只用RAS刷新操作
2. CAS在RAS之前的刷新操作

### DRAM控制器

<!-- 长[这样]()，感觉不重要。 -->

### 例子

![例子](https://api2.mubu.com/v3/document_image/7ac2c0db-93d3-4115-9163-c1426997f1b6-16175743.jpg)
4Mx8位指的是：
一片里面有4M，有8片。
所以8位是数据位。
1M是2的20次方。
4M是2的22次方。
也就是行列线一共有22条。
因为DRAM是行列地址分时复用，所以地址线仅11条。
这里的行地址线和列地址线不一定是一样多的，但是没说的情况下默认平分。

### 其他的一些补充

- 增强型的DRAM：EDRAM（Enhanced）
  由于CPU的数据经常需要访问某个地址相邻地址的数据，加一个SRAM临时存储读出的这一行，可以加快读取速度。
  在行地址不变的情况下，连续的变换列地址，称为Brust Mode，这种情况下的增强型DRAM读取速度尤其快。

- SDRAM：同步DRAM
  S：synchronous a.同步的
  添加了一个时钟信号，让CPU和读写存储变成了一个同步的操作。
  只在时钟的上升沿进行数据的读取
  为了提升速率：
  DDR：在上升下降沿都进行读取。
  DDR2：外部时钟的频率提高一倍，也是在上升下降沿都进行读取。

- CAS Latency 参数
  列地址有效时候还要多久才能读取到数据，越小越好。

- DRAM主存读/写的正确性校验
  为了提高DRAM存储器读写操作的正确性与可靠性，在写入m位数据的同时还需写入k位附加位，即写入的数据是经过纠错码编码的数据。

## 3.4 只读存储器和闪速存储器

### 只读存储器ROM

Read Only Memory
没有易失性

#### 分类

- 掩膜ROM（MASK ROM）:出厂的时候就写好了，不能改了捏
  可靠性高，便宜
- 可编程ROM（PROM）
  - 一次性可编程ROM（OTP ROM）
	（双极型PROM，熔断型，PN结击穿型）
  - 可擦除PROM（EPROM）
    - 紫外线擦除EPROM（UV EPROM）
    - 电擦除EPROM（EEPROM，E2PROM）
    - 闪速存储器（FLASH ROM）

#### EPROM

原理略
举例：
![1](https://api2.mubu.com/v3/document_image/7730146f-b3b1-401b-8db7-880d9e220254-16175743.jpg)
![2](https://api2.mubu.com/v3/document_image/f545b500-4648-4e43-a869-349c29d89aca-16175743.jpg)
![3](https://api2.mubu.com/v3/document_image/34f620ab-acab-433c-bc7e-ff7ef604db18-16175743.jpg)

#### EEPROM

与EPROM相比，集成度低（两个晶体管存一个单位），寿命长。

### 闪速存储器

闪速存储器FLASH是目前唯一的具有大容量、非易失性、低价格、可在线改写和较高速度几个特性共存的存储器。
之所以称为FLASH，是因为**擦除速度快**，擦除整个存储矩阵所花时间，与EEPROM擦除一个存储单元的时间相同。
FLASH具有**非易失性**，比SRAM成本低
但是擦写次数和速度都比DRAM差不少，故不能取代DRAM

闪存分为两类：

1. NOR闪存
2. NAND闪存

#### NOR闪存

- 擦除写入时间比较长
- 有完整的地址/数据接口，能**随机存取**
- 存储容量比NAND小很多

#### NAND闪存

- 擦除写入时间比较快
- 与NOR闪存比较具有较高的密度和较低的位成本，10倍的擦除次数。
- 没有完整的地址/数据接口，I/O接口只允许**顺序存取**数据

闪存特点：
可在线写入数据，具有ROM的非易失性
可以取代全部的UV EPROM和大部分的E$^2$PRO

闪存的主要用途：
存储监控程序、引导程序等基本不变或不经常改变的程序：可使用NOR闪存
保存掉电时需要保持的系统配置等不常改变的数据：可使用NOR闪存
固态盘：采用NAND闪存

## 3.5 并行存储器

### 双端口存储器

DRRAM:dual port RAM
同一个存储器具有两组独立的控制线，地址线和数据线。
比其他的线多了一个忙线（busy line），作用是解决读写冲突。
实例：
IDT7133
容量为2K×16位SRAM
[功能方框图](https://api2.mubu.com/v3/document_image/df269406-2bbc-4477-af34-1a6e7c0a846a-16175743.jpg)
当两个端口同时存取存储器同一存储单元时，便发生读写
冲突,为了解决读写冲突，设置了<span style="text-decoration:overline">BUSY</span>标志线

- 由判断逻辑部件来决定对哪个端口优先进行读写操作，另
一个端口的BUSY标志有效，读写操作延迟执行。
- 判断逻辑部件的判断方式：
  1. CE判断：如果地址匹配且在CE之前有效，片上的控制逻辑在CEL和CER之间进行判断来选择端口
  2. 地址有效判断：如果CE在地址匹配之前变低，片上的控制逻辑在左、右地址间进行判断来选择端口

### 多模块交叉存储器

各模块地址安排有2种方式

- 顺序方式
  ![顺序方式](https://api2.mubu.com/v3/document_image/ff771aed-21ae-4267-8573-0ed40c1edfc5-16175743.jpg)
- 交叉方式(Interleaving)也称为多通道方式
  ![交叉模式](https://api2.mubu.com/v3/document_image/62967547-6e6e-4d9a-afac-bc1503b863e8-16175743.jpg)

主存被分成4个独立、容量相同的模块M0/M1/ M2/M3
![基本结构](https://api2.mubu.com/v3/document_image/b4df61d4-a217-4b4b-9adf-1f7509019ffe-16175743.jpg)

1. 每个模块均有自己的读写控制电路、地址寄存器和数据寄存器，
以相同的方式与CPU传送信息
2. CPU同时访问四个模块，由存储器控制部件控制它们分时使用
数据总线进行信息的传递（读取T相对于数据传递$\tau$要慢很多

![读取模式](https://api2.mubu.com/v3/document_image/6e562469-71e6-40fc-8571-0328990c5864-16175743.jpg)
假设模块字长等于数据总线宽度，且模块存取一个字的存储周期为T，总线传送周期为τ，存储器的交叉模块数为m
那么，m＝T/τ被为交叉存取度，连续读取m个字所需的时间为t1=T+(m-1)τ
对于顺序方式存储器，连续读取m个字所需的时间为t2=mT

例子：
![例子：](https://api2.mubu.com/v3/document_image/e252126f-ed53-41c0-a0c2-bca3f9cf6bf1-16175743.jpg)
解答：
![解答：](https://api2.mubu.com/v3/document_image/16519072863582123.jpg)

零等待存取
![零等待存取](https://api2.mubu.com/v3/document_image/8bef93b1-f2ba-4efc-b643-78b5bc768899-16175743.jpg)

## 3.6 Cache存储器

### 局部性原理

principle of locality，讨论的就是双重for循环取二维数组那个，执行速度的问题。

- 时间局部性 temporal locality
  在一个具有良好时间局部性的程序中，被引用过一次的内存位置很可能在不远的将来再被多次引用
- 空间局部性 spatial locality
  在一个具有良好空间局部性的程序中，如果一个内存位置被引用了一次，那么程序很可能在近期引用附近的一个内存位置

### 存储系统的层次结构

![结构](https://api2.mubu.com/v3/document_image/ef2fd587-0459-41e2-be5c-8a2ba15b4eeb-16175743.jpg)

### 高速缓存Cache/kæʃ/

Cache是一个小而快速的存储设备，它作为存储在更大、也更慢的设备中的数据对象的缓存区域

1. Cache通常采用高速SRAM来实现
2. 利用局部性原理，在Cache中完成大多数访问，从而缩短平均访问时间
3. CPU和主存之间的速度差很大通常采用两级或多级Cache系统
4. 全由硬件调度，对用户透明

不同层次之间Cache
![基本原理1](https://api2.mubu.com/v3/document_image/f1187756-8075-42a9-b96a-ff42adf70110-16175743.jpg)

Cache 命中与缺失
![命中与缺失](https://api2.mubu.com/v3/document_image/abf3fed0-9cde-40f8-8dec-04015df1ae48-16175743.jpg)
>LRU :Least Recently Used最近最少使用

Cache缺失类型

1. 冷启缺失/义务缺失（Cold miss or Compulsory miss）
   - 当cache为空时就产生冷启缺失，比如刚开机
2. 冲突缺失（Conflict miss）
   - 层k+1的数据块通常只能映射到层k的有限位置上。尽管层k中cache足够大，但层k+1有多个数据块全都映射到层k的同一位置上，则产生冲突缺失
3. 容量缺失（Capacity miss）
   - 当活动的cache块的数量超过cache的容量就产生容量缺失

### 内容可寻址CAM

（Content Addressable Memory）是一种用内容进行寻址的存储器。将一个输入数据项与存储的所有数据项同时进行比较，若存在匹配，输出该数据项对应的匹配信息（或地
址）。同时也能按地址进行读和写。

### 主存和Cache的分块

主存和cache间以数据块为单位进行复制，为便于管理，将主存和cache都划分为大小相等的数据块（也称行）

![主存&cache容量](https://api2.mubu.com/v3/document_image/27912974-d4e5-482f-a56a-3210c8c23b3e-16175743.jpg)
![映射方法](https://api2.mubu.com/v3/document_image/2c0711cb-fc8a-4b2a-92f4-3311f88ef522-16175743.jpg)
总的映射过程
![过程](https://api2.mubu.com/v3/document_image/0c35d8b0-967a-47b2-82aa-776ab2d01ab9-16175743.jpg)

### <mark>主存与Cache的地址映射</mark>

1. 全相联映射（ Fully Associative Mapping）
2. 直接映射（Direct Mapping）
3. 组相联映射（Set Associative Mapping）

### 全相联映射

![1](https://api2.mubu.com/v3/document_image/2e922423-4875-4c5f-ab9f-08e313b59c6c-16175743.jpg)
![2](https://api2.mubu.com/v3/document_image/93b3ef69-428b-4a6f-8942-587a10e2ec58-16175743.jpg)

就是弄个表，其实就是前面那个[内容可寻址CAM](#内容可寻址cam)
![示例](https://api2.mubu.com/v3/document_image/a56ec8fa-f145-4baa-9eda-82156e49e5b8-16175743.jpg)
例子：
![例子：](https://api2.mubu.com/v3/document_image/5d635f1b-e733-45ff-b34b-98a3fb66bda5-16175743.jpg)

### 直接映射

![直接映射](https://api2.mubu.com/v3/document_image/4737d462-58d4-4288-a61f-fd0484e904ef-16175743.jpg)
这也是能产生冲突缺失的情况

直接映射的Cache标签和行号
![直接映射的Cache标签和行号](https://api2.mubu.com/v3/document_image/e4592538-4dd4-48a3-8fef-294e7d40c57f-16175743.jpg)
直接映射Cache的检索过程
![检索过程](https://api2.mubu.com/v3/document_image/2c75c351-38df-41c4-a5b1-c032864a55e1-16175743.jpg)
示例
![示例](https://api2.mubu.com/v3/document_image/cab14266-1809-4e39-aa54-937d06549bad-16175743.jpg)

### v路（v-way）组相联映射

![v路（v-way）组相联映射](https://api2.mubu.com/v3/document_image/f0e63664-1cde-42b8-b783-f5a3a0f306e6-16175743.jpg)
**主存块存放到哪个组是固定的，放在组内的哪一行是任意的**
检索过程
![jsgc](https://api2.mubu.com/v3/document_image/6bd4d8f2-75ee-4e35-a527-c126b8b555cf-16175743.jpg)
2路组相联映射示例1
![shili](https://api2.mubu.com/v3/document_image/7af08504-1981-4f84-88d6-2feee4d4cbaa-16175743.jpg)
2路组相联映射示例2
![shili](https://api2.mubu.com/v3/document_image/c7af876a-6747-4241-b5f6-c398545c9385-16175743.jpg)

## wordtable

>Interleaving 交叉模式
 Compulsory a.必修做的强制的
 CAM 内容可寻址存储器
