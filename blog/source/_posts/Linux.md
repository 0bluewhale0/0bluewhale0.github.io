---
title: Linux笔记
date: 2023-02-23 15:50:56
categories:
	- 笔记
		- Linux
tags:
	- course
	- Linux
toc: true
cover: /img/The Sacred City by the Fall　滝の聖地-85675456.png
---

大致是跟着老师上课的顺序写的，用于上课摸鱼时安慰一下自己QwQ

## Chapter 1

### 1.1 Linux发展过程

略，课件里的八卦部分可以抽空看

### 1.2系统登录与退出

#### 终端

称为tty是因为电传打字机 teletypewriter

历史：

1. typewriter
2. teletypewriter 简称tty
3. 字符终端，就带屏幕的那种

组成：

1. 键盘
2. 显示屏
3. 接口RS232串行通信接口（用于主机与终端的连接）

#### 行律

（是之前不知道的东西耶）

line discipline，缓存、回显、编辑（比如backspace）、转换换行符\n为\r\n、
行律的调整：
stty

- stty erase ^H 另^H可以擦除一个字符，起到backspace的功能
- stty -a 显示行律的所有控制信息

#### 终端转义序列

转义字符：ESC ASCII码是1B，十进制的16+11=27

==主机给重点方向发数据==转义序列的功能：

1. 控制光标位置、字符颜色、大小
2. 选择终端的字符集
3. 控制终端上的打印机、刷卡机、磁条器、密码键盘

![0](https://api2.mubu.com/v3/document_image/fd57507b-f87f-448d-ae64-1ff72ea4a572-16175743.jpg)

#### 主机和终端之间的流量控制问题

两种流控方式

1. 硬件
   RS232接口的CTS信号线 Clear to send
2. 软件
   流控字符 Xon 和 Xoff
   ![1](https://api2.mubu.com/v3/document_image/6cc2142c-45c0-4e69-a5a1-7034b7735bc6-16175743.jpg)

#### 仿真终端和虚拟终端

仿真：仿真软件来模拟中端

虚拟：是远程连接的那种，比如xshell

#### Shell提示符

![2](https://api2.mubu.com/v3/document_image/d40d4ed9-ba5f-47c6-a474-8e4533f55f20-16175743.jpg)

#### 关机

在关机前必须执行关机命令shutdown,仅特权用户有此权限。

死机：

- Unix系统稳定，应用程序不该导致死机
- 死机现象是由于系统内核态程序有问题，常常是一些外设的驱动程序有BUG

### 1.3 使用系统命令

- man
  - 查阅手册
  - manual
  - man name
  - man section name
    - 1：命令
    - 2：系统调用
    - 3：库函数
    - 5：配置文件
  - man -k regexp 列出关键字keyword与正则表达式regexp匹配的手册项
- date
  - date "+%Y-%m-%d %H:%M:%S Day %j"
  - date "+%s" 秒坐标，常用于计算时间间隔
  - 通过NTP协议校对系统：ntpdate -q 0.pool.ntp.org(查询)
  - ntpdate 0.pool.ntp.org(设置)
  - 效果：![1](https://api2.mubu.com/v3/document_image/933a84a9-b863-4d0a-b84c-ec4c889ca9a8-16175743.jpg)
- cal 打印日历
  - cal 2023
  - cal 10 2023
- bc 计算器
  - 基本的计算器的功能，支持变量函数条件循环等编程功能
  - **可以进行任意精度的计算**
  - 缺省为小数点后0位
  - -l参数是20位
- passwd 修改口令（密码）
  - root可以直接改
  - 其他用户需要先输入当前口令
  - 修改超级用户的口令需要很谨慎捏
  - 关于口令的存储：![2](https://api2.mubu.com/v3/document_image/4cde873f-ff30-45ee-95c8-dca743ffa29d-16175743.jpg) 

- who 列出当前已经等登录入系统的用户
  - ![3](https://api2.mubu.com/v3/document_image/f2ed2e24-cda4-41a7-b163-55f3f89ee2e5-16175743.jpg)  
- tty 打印出当前终端的设备文件名
- who am i 当前终端上的登录用户
- whoami 仅列出当前用户名，脚本程序会用到
- uptime 已经开机的时间
  - 关于loda average：![4](https://api2.mubu.com/v3/document_image/e1eec1e6-839d-4dff-b620-665695f4a07a-16175743.jpg)  
- top 列出资源占用排名靠前的进程
- w命令 列出终端的空闲时间IDLE、JCPU、PCPU、WHAT（）
- ps 进程信息的一次性快照 process status
- ps -ef 可以打出来很多信息![ppid](https://api2.mubu.com/v3/document_image/12c78658-82c8-45d1-a05f-b2e6c0e72da2-16175743.jpg)
  PPID是父进程的id
- free 检查系统内存使用情况
- vmstat 检查系统负载![vmstat](https://api2.mubu.com/v3/document_image/1ab28fa9-6906-4444-82de-a4fbc93584c6-16175743.jpg)
- UTF8和GBK
  
  ```rust
  echo $LANG
  ```
  ![echo](https://api2.mubu.com/v3/document_image/4bec4219-173e-47c0-bd9c-f1b55d4aca5d-16175743.jpg)
- iconv 转换文件的编码方式
  - -f from
  - -t to
  - ex:
    >iconv -f gbk -t utf8 inputFile.txt -o outputFile.txt.utf8

- bc 计算器
  - 默认精度是小数点后0位
  - -l 缺省精度位小数点后20位
  - 功能非常复杂和强大
    - 支持数学函数库、变量、循环等编程功能
    - 可以进行任意精度的计算，可以通过设置scale自行决定小数点位数

- wall write to all 给所有人都发消息

## Chapter2 文本文件及处理工具

实现ls -l的输出作为sort程序的输入来执行：

- 重定向机制
  - ls -l > file.txt
  - sort < file.txt
- 管道机制
  - ls -l | sort

### 2.2读取文件内容

- more/less 逐屏显示文件
- cat concatenate 串结，文本格式打印 （选项-n：行号）
- od octal dump 逐字节打印，默认是octal八进制（-c, -t c, -t x1，-t d1, -t u1选项）
- head/tail 显示文件的头部或者尾部
- tee 三通，将从标准输入stdin得到的数据抄送到标准输出stdout显示，同时存入磁盘文件中
- wc 字计数（word count）
  - 列出文件中一共有多少行，有多少个单词，多少字符
  - 当指定的文件数大于1时，最后还列出一个合计
  - 常用选项-l：只列出行计数
  - ![2](https://api2.mubu.com/v3/document_image/88190d8c-581e-42fe-a25a-d31d6b148b8e-16175743.jpg)
- sort 对文件内容排序
- tr 翻译字符,其实严格来说是替换![2](https://api2.mubu.com/v3/document_image/43c301ef-3614-47a7-bfa9-e0e67d8626d7-16175743.jpg)
  ![2](https://api2.mubu.com/v3/document_image/77f75fa6-ae88-4d39-8f91-bd0675c027d8-16175743.jpg)
- uniq

### 补充1：远程登录服务器

#### 1.ssh

```rust
ssh [username]@[ipv4地址]
```

ex:

```rust
ssh jiang@82.156.118.183
```

也可以写一个 dos 批处理程序

就是.bat文件
建立一个bupt.bat文件
里面的内容是

```rust
ssh jiang@82.156.118.183
<psw>
```

然后运行命令

```text
bupt.bat
```

就可以不用每次都输入密码了

#### 2.git bash

就拿来当cmd用，也是用ssh连的，不再赘述

#### 3.putty

略，没用过

#### 4.secureCRT

略，看起来跟笔者常用的xshell差不多。

#### 传输文件的软件

1. winSCP，图形化的界面，比较舒服
2. 远程连接的窗口有传输文件的专用命令rz sz

#### 非对称性加密

```text
sudo vim ~/.ssh/authorized_keys
```

查看和更改配置文件：

```text
vim /etc/ssh/sshd_config
```

不好使的话记得加sudo

## 补充2：word

- SDK softerware Develop Kit 软件开发包
- DDK Drive Development Kit 驱动开发包
- 小于32的ASCII码都是控制字符


## 附录1：关于安装yum

在ubuntu上安装了yum，执行yum命令就报错：
There are no enabled repos. Run “yum repolist all” to see the repos you have. You can enable repos

按照提示输入yum repolist all，啥也没有，百度查了一堆，乱七八糟，都不行。弄了我好久。后来知道为啥了。

就不该安装yum，因为linux系统是Ubuntu。

一般来说Linux系统基本上分两大类:

RedHat系列：Redhat、Centos、F edora等

Debian系列：Debian、Ubuntu等

RedHat系列：

1.常见的安装包格式rpm包、安装rpm包的命令：rpm-参数

2.包管理工具yum

3.支持tar包

Debian系列：

1.常见的安装包格式deb包、安装rpm包的命令：deb-参数

2.包管理工具apt-get

3.支持tar包

所以，也就是说，直接用apt-get就行了，别用yum。
