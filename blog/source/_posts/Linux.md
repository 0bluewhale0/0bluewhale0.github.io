---
title: Linux笔记
date: 2023-02-23 15:50:56
categories:
	- 笔记
		- Linux
tags:
	- course
	- Linux

cover: /img/Photo frame three-105065589.png
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

### 2.3 正则表达式及应用

Regular Expressions

>/:slice 斜杠
 \:back slice 反斜杠
 “人”

#### 单字符正则表达式

- 非特殊字符，匹配自身
- 转义字符 ' \ '
  <mark>\\.</mark>  <mark>\\*</mark> <mark>\\$</mark> <mark>\\^</mark> <mark>\\[</mark> <mark>\\\</mark>
- 圆点 ' . ' 匹配任意单字符
- 星号 ' * '：单字符正则表达式后跟\*，匹配此单字符正则表达式的0次或任意多
次出现
- 定义集合
  - 在**一对方括号之间**的字符为集合的内容:单字符正则表达式[abcd]与a或b,c,d匹配
  - **圆点,星号,反斜线**在方括号内时，代表它们自己::[\\*.]可匹配3个单字符
  - 用减号-定义一个区间（要在中间）:如[a-d] [A-Z] [a-zA-Z0-9]
  - 用 \^ 表示补集(要在开头):**[\^a-z]** 匹配任一非小写字母，**[\^ \]\[ ]** 匹配任一非中括号字符
- 锚点： \$ 和 \^
  - \$ 在尾部时有特殊意义，否则与其自身匹配
    - 123\$ 匹配文件中行尾的123，不在行尾的123
  - \^ 在首部时有特殊意义，否则与其自身匹配
    - \^printf匹配行首的printf字符串，不在行首的printf串不匹配

#### 正则表达式扩展

![2](https://api2.mubu.com/v3/document_image/2512c854-800d-4855-84a3-2f73836db3db-16175743.jpg)

### 文本行筛选

#### grep:在文件中查找字符串

grep（Global regular expression print）

grep 模式 文件名列表

例子：
![2](https://api2.mubu.com/v3/document_image/0cd5299c-e6e1-40ee-ac5f-9e3bf1ea46f1-16175743.jpg)

选项

- -n 显示时每行前面显示行号
- -v 显示所有不包含模式的行
- -i 字母比较时忽略字母的大小写

#### 流编辑及正则表达式替换

sed：流编辑

- sed '命令' 文件名列表
- sed –e '命令1' –e '命令2' –e '命令3' 文件名列表
- sed -f 命令文件 文件名列表

一对斜线 / / 之内的部分为正则表达式
![2](https://api2.mubu.com/v3/document_image/7d4abf3b-0a17-4574-bf98-af2c5ee52c4c-16175743.jpg)

![3](https://api2.mubu.com/v3/document_image/7c4e99bd-af91-4fdf-a592-8152a4124fb2-16175743.jpg)

#### 复杂筛选及加工awk

awk：逐行扫描进行文本处理,是逐行扫描进行文本处理的一门语言，a.w.k分别为该程序的三位设计者姓氏的第一个字母

- awk '程序' 文件名列表
- awk -f 程序文件名 文件名列表

![3](https://api2.mubu.com/v3/document_image/c1ea06fe-a4e5-4c0b-98bf-a47062351fd9-16175743.jpg)

\$数字 指的是第几列。

#### sed和awk的区别

- sed：每次读入一行来处理的，sed 适合简单的文本替换和搜索，sed读取一行，以行作为单位，进行处理。
- awk：每次读入一行来处理的（同sed），但awk读取一行，切割成字段，以字段（列）为单位，进行细节处理。
- 如果文件是格式化的，即由分隔符分为多个域的，优先使用awk。
- awk适合对文件的抽取整理，sed适合对文件的编辑。
- awk适合按列（域）操作，sed适合按行操作。

### 文件对比

- CMP
  - cmp命令逐个字节比较两个文件是否完全相同，两个文件完全相同时，不给出任何提示。当两个文件不同时，打印出第一个不同之处。这个命令常用来判断两个文件的内容是否完全一致，无论是ASCII码文件还是二进制格式的程序或数据文件。在Windows中有类似的命令COMP。
- diff
  - 许多读者使用过Windows下类似功能的FC命令(File Comparison)。UNIX用于完成这项功能的命令是diff。无论是Windows的FC命令，还是UNIX的diff命令，都可以逐行比较包括源程序文件在内的任意内容的文本格式文件。Windows的FC命令使用时经常需要/N选项，在列出文本文件行时打印行号。
  - 命令diff file1 file2每发现两个文件中的一处不同，就列出一个如何将f1.c转化为f2.c的指令，这些指令有a(Add)，c(Change)和d(Delete)
  - ![diff](https://api2.mubu.com/v3/document_image/d2b4adaf-3838-430a-8c83-99acdff1b875-16175743.jpg)

>diff -u 的输出格式和git相同，而不是normal格式
normal 列出将file1转化为file2的指令

### vi编辑器

```txt
:set number:每行左边显示行号
:set tabstop=4 制表符位置为4格对齐
```

**命令前加一整数，表示这个命令连续执行多少遍**，这句话针对很多命令都有效，比如5j（光标下移五行）、6ctrl-b（向前翻六页）

编辑命令 i a 等，可以从命令状态转到文本状态
>i是insert a是append

光标移动：

- 上下左右
  - h 光标左移一列
  - j 光标下移一行
  - k 光标上移一行
  - l 光标右移一列
  - 一般可以直接使用键盘上的方向键代替这四个字母
- 行尾行首
  - 将光标移至当前行首 ^
  - 将光标移至当前行尾 $
- 移动一个单词
  - 移到右一个单词 w
  - 移到左一个单词 b
- 移到指定的行
  - ```:45```移动到45行
  - ```:$```将光标置于文件尾
  - ```:.+10``` 当前行号+10
  - ```:$-5``` 倒数第五行
- 括号配对
  - 把光标移到一个花括号(或圆括号，或方括号)上，按%键，则光标自动定位到与它配对的那一个括号
- ```x```删除当前字符，or```5x``` 删除当前五个字符，这个好像相当于剪切命令，在x之后可以使用p来粘贴刚刚剪切的行。
- 删除行
  - 删除当前行的命令 dd
- 替换光标处字符 r
  - 将当前光标处开始的三个字符依次替换为abc，则需要按命令rarbrc
- 取消上一次的编辑操作(undo)<mark> u </mark>。
- 重复上一次的编辑操作<mark> . </mark>。

翻页：

- Ctrl-b 向后翻页(Backward)
- Ctrl-f 向前翻页(Forward)

文件操作命令

- 存盘退出:```ZZ(大写)```==```wq```
- 读入文件xyz.c插入到当前行之下 ```:r xyz.c<CR>```
- 写文件,把第50行至文件尾的内容写到文件file1中 ```:50,$w file1<CR>```

剪切板

- 删除，并拷贝到剪贴板
  - ```:10,50d<CR>``` 删除第10-50行
  - ```:1,.d<CR>``` 删除文件首至当前行的部分
  - ```:.,$d<CR>``` 删除当前行到文件尾
- 不删除，拷贝到剪贴板(yank)
- 粘贴剪贴板信息（paste）

块儿操作

- 复制：```:5,10co56<CR>```复制第5-10行到第56行之下
- 移动:```:8,34m78<CR>```移动第8-34行到第78行之下

两行合并(Join) J：当前行下面的行合并到当前行

刷新屏幕显示(load)：Ctrl-l

状态显示 Ctrl-g：在屏幕最下面一行列出正在编辑的文件的名字，总行数，当前行号，文件是否被修改过等信息

模式查找

- 格式 /pattern
- n 向下查找下一个next
- N 向上查找下一个

模式替换

- 替换命令：:n1,n2s/pattern/string/g
有点像sed的格式

### 文件和目录的管理

- ls -F
  - 若列出的是目录，就在名字后面缀以斜线 /
  - 若列出的是可执行文件，就在名字后面缀以星号 *
  - 若列出的是符号连接文件，就在名字后面缀以符号@
  - 若列出的是普通文件，则名字面后无任何标记
- ls -l
  - 第1列：文件属性
    - 普通文件
    - b 块设备文件(Block)
    - d 目录文件(Dir)
    - c 字符设备文件(Char)
    - l 符号连接文件(Link)
    - p 命名管道文件(Pipe)
  - 第2列：文件link数，涉及到此文件的目录项数
  - 第3列，第4列：文件主的名字和组名
  - 第五列，一个代表大小的数字，不同类型的文件这个数字的含义不同
  - 第6列：文件最后一次被修改的日期和时间
  - 第7列：文件名
    - 对于符号连接文件，附带列出符号连接文件的内容
- ls -h （human-readable）
- ls -d (directory)
  对比-d参数的作用：
  ![-d](https://api2.mubu.com/v3/document_image/3ca46d32-014d-49b1-a67d-68ea5e211601-16175743.jpg)
  ls与ls *的区别
  ![2](https://api2.mubu.com/v3/document_image/a8191984-b613-41bf-a42e-32f80f66be7e-16175743.jpg)
- ls -a 列出文件名首字符为圆点的文件
- ls -A (功能与-a相同，除了不列出. 和..)
- ls -s (size)列出文件占用的磁盘空间
- ls -i (i-node)列出文件的i节点号

### 文件的复制与删除

#### cp

命令的两种格式和功能

- cp file1 file2
- cp file1 file2 . dir
其中file1，……，filen为文件名，dir为已有目录名
第二种格式中： dir必须已经存在并且是一个目录
第一种格式中： file2不存在，则创建；file2存在且是文件，则覆盖；
file2存在且是目录，则按格式二处理

一个有趣的例子，本质还是linux的shell对通配符的处理策略
![2](https://api2.mubu.com/v3/document_image/abcd20eb-be74-45ef-8d38-c17d574659a9-16175743.jpg)

#### mv

mv file1 file2
mv file1 file2 ... filen dir
mv dir1 dir2
如果mv的最后一个参数是一个已存在的目录,不会对文件进行删改，只会改指针
使用mv命令可以将文件和目录改名
可以将文件和子目录从一个目录移动到另一个目录
mv dir1 dir2 两种执行情况（同文件系统，不同文件系统）
同文件系统其实就只是改个名字
不同文件系统就没办法了，得读出写入。

#### rm

需要注意 rm * .bak （*后空格的错误），这种就把里面的东西都删了,j就算会报错找不到.bat文件，但是除了目录之外的能删的都已经删完了。

-r 递归地(Recursive)删除实参表中的目录，也就是删除一
整棵目录树。
-i 每删除一个文件前需要操作员确认(Inform)
-f 强迫删除(Force)。只读文件也被删除并且无提示，**无操作权限**的文件强制删除也不能删掉

这里又有一个有趣的小例子

已知-i是rm的一个参数，如果目录下存在一个名字叫做-i的文件，想要删除它的时候怎么办呢
这个时候就可以用--显式地表示命令行参数列表中选项的结束，分隔选项和处理对象，也适用于其他命令
![rm-i](https://api2.mubu.com/v3/document_image/9ca0ed1d-396a-4972-a386-b62a780b5891-16175743.jpg)
![rm---i](https://api2.mubu.com/v3/document_image/d961ff7d-ecc0-485f-b948-549c090abb3e-16175743.jpg)

### 目录管理

文件.与..
在目录表中确实有两个文件
这两个目录项由系统自动创建和删除
可以简单的把.理解为当前文件,..理解为上一级文件

env 可以查看环境变量
pwd:print working directory
cd:change directory
cd :无参数的时候，widnows会打印当前工作目录
unix会回到用户的主目录

**cd是shell的一个内部命令**，硬盘上没有cd这个命令；shell自行完成改变当前进程工
作目录的操作。

mkdir
选项-p，自动创建路径中不存在的目录。
例如：mkdir database/2019/09/04/log -p
删除目录rmdir
例：rmdir sun/work.d
要求被删除的目录除.与..外无其它文件或目录
换句话说，这玩意儿只能删除空目录，里面有东西的目录它一点办法都没有

cp 复制目录
cp -r dir1 dir2  递归的复制一个目录
选项–v，冗长(verbose)方式
复制目录时实时列出正在复制的文件的名字
cp命令选项–r，递归地复制一个目录

根据dir2是否存在，执行结果有差异：

- 若dir2不存在，则新建子目录dir2，把dir1下内容拷入dir2下
- 若dir2已存在，则dir2下新建子目录dir1，把dir1下内容拷入dir2/dir1下

选项–u，增量拷贝(update)，便于备份目录

- 根据文件的时戳，不拷贝相同的或者过时的版本的文件，以提高速度
- dir1和dir2不慎颠倒位置，不会出现灾难性后果
- Windows中类似功能的命令XCOPY，选项/D可以用来实现增量拷贝(Date)

rsync命令，完成远程同步，可以镜像整个目录树
rsync用一精巧的算法，将文件分块，在两主机间传播数据块的hash值，据此推出两版本文件之间区别，使得网络只传输文件的增、删、改部分

### 目录遍历的命令

find命令从指定的查找范围开始，**递归地**查找子目录，凡满足条件的文件或目录，执行规定的动作
find命令有三个参数
![find](https://api2.mubu.com/v3/document_image/548d9fd9-ef14-4c16-b77f-b0d124a648ba-16175743.jpg)

有关条件的选项

- -name 需要引号，对通配符的解释由find完成
- -type
  - f:普通文件
  - d:目录
  - l:符号连接文件
  - c:字符设备文件
  - b:块设备文件
  - p:管道文件
- -size ±n单位：指定文件大小（大于+，等于，小于-）
- 以用() –o !等表示多条件的“与”，“或”，“非”

有关动作的选项

- -print 打印查找的文件的路径名
- -exec 对查找到的目标执行某一命令 在-exec及随后的分号之间的内容作为一条命令，在这命令的命令参数中，{}代表遍历到的目标文件的路径名
- -ok 与-exec类似，只是对查找到符合条件的目标执行一个命令前需要经过操作员确认

### 目录遍历的应用

```shell
find src -name \*.c -exec grep -n -- --help {} /dev/null \;
```

在目录src中所有.c文件中查找--help字符串
grep的-n选项：打印行号
--：grep的命令行选项结束，其后命令行参数为查找对象
/dev/null文件的作用：特殊设备文件，读不出写不入；陪伴{}中的每个文件，构成两个grep的待搜索文件，以打印文件名。

### 批量处理文件

上面那个应用的例子，效率低，因为每个命中的对象都需要执行grep命令：创建一个进程，完成任务后进程消亡，然后再创建，再消亡。

xargs

命令xargs可以用来完成这个工作：

```shell
find src -name \*.c –print | xargs grep -n ----help
```

**xargs命令把标准输入追加到命令参数表后面**，也就是上述grep…的后面，再作为一个命令来执行。
>这个跟管道重定向是不同的，如果是管道重定向的话，它仅仅是把find得到的结果（文件列表）作为一个文件进行输入，grep做的是在这个文件列表中寻找--help，而不会打开文件寻找，作为参数列表就不同了，grep会打开文件列表中的文件去寻找。

### 打包与压缩

打包的例子：tar czvf mytar.zip.gz
解压的例子：tar xvf mytar.zip.gz
查看压缩包内容：tar tvf mytar.zip.gz

参数详解：

- f: File。指定设备文件名
- z: 采用压缩格式(gzip算法)
- j: 采用压缩格式(bzip2算法)

>关于两种压缩算法
tar cvzf work.tar.gz work
(gzip压缩算法，对C程序体积为原来的20%)
tar cvjf work.tar.bz2 work
(bzip2压缩算法，对C程序17%，执行时间三倍)
通常采用gzip的算法，文件名后缀.tar,.tar.gz,.tar.bz2仅仅是惯例，不是系统级强制要求。

## Chapter 3 文件系统管理

df: 文件系统空闲空间
（-h参数：human readable）

### 文件系统的存储管理

![zhengti](https://api2.mubu.com/v3/document_image/32ad32ee-4d22-4b07-b463-d4b170cfd3b5-16175743.jpg)

- 引导块(0号块)：启动系统，只有根文件系统引导块有效
- 专用块(1号块)：也叫管理块，或者超级块
  - 存放文件系统的**管理信息**。如：文件系统的大小，i节点区的大小，空闲空间大小，空闲块链表的头等等
  - mkfs命令时初始化，df命令读出部分信息，df -i和df

i节点：(index node，简记为i-node)

- 由若干块构成，在mkfs命令创建文件系统时确定
- 每块可容若干个i节点，i节点大小固定（比如64字节）
- i节点从1开始编号，根据编号可以索引到磁盘块
- 每个文件都对应一个i节点

i节点包括

- 指向文件存储区数据块的一些索引（index）指针（组成文件的逻辑块与硬盘的物理块之间的映射）
- 文件类型，属主，组，权限，link数，大小，时戳（**i节点内不含文件名**）

文件存储区
用于存放文件数据的区域，包括**目录表**

linux文件系统最有意思的是**目录表也作为一个文件来管理**，存于“文件
存储区”中，有其自己的i节点和数据存储块。

目录和i节点的存储结构如下

![i](https://api2.mubu.com/v3/document_image/eb0e05c8-271f-4c08-b82c-9ec4ab7e9df1-16175743.jpg)

## 软连接和硬链接

每个目录项指定的“文件名-i节点号”映射关系，叫做1个**硬连接**
不允许对目录用ln命令建立硬连接
一般来说， $目录的link数=直属子目录数+2$
![yinglianjie](https://api2.mubu.com/v3/document_image/d7d2b329-28f6-4170-bdc5-faaa25db4fc9-16175743.jpg)

符号连接也叫软连接 （不同文件系统间连接文件）
用特殊文件“符号连接文件”来实现
文件中仅包括了一个路径名

![软链接](https://api2.mubu.com/v3/document_image/848ab5d5-cebe-4ea6-8376-8118fee83e0e-16175743.jpg)
命令stat：读取i节点信息
命令ln -s

```shell
ln -s users_on sym.link
```

一旦建立了符号连接，删除操作删除的是符号连接文件，其它所有操作都将访问符号连接所引用的文件.

符号链接中的相对路径:若符号连接含相对路径名，是相对于符号链接文件
的位置(不是相对于调用进程的当前工作目录)

![location](https://api2.mubu.com/v3/document_image/5e9dbd9b-c325-45a0-a309-fd945536cf16-16175743.jpg)

软硬连接的区别：是否有独立的i节点

>硬连接与符号连接的比较
硬连接

- 在数据结构层次上实现
- 只适用于文件，不适用于目录
- 不同文件系统之间也不行
- 硬连接能够完成的功能软连接可以做到

符号连接

- 在算法软件上实现
- 硬连接能够完成的功能软连接都可以做到
- 适用于目录，也适用于不同的文件系统
- 同硬连接相比要占用操作系统内核的一部分开销
- 循环式符号连接，以及处理方法（解析路径时设置符号
链接解析计数器）

### 系统调用

<mark>系统调用与库函数在执行方式上的区别</mark>
例如：获取进程ID的<font color=blue>getpid()</font>与字符串拷贝函数<font color=green>strcpy()</font>
CPU的INT指令（**软中断、内核态**）; CALL指令（**子程序调用、用户态**）

#### 整型变量errno

这个很有意思
C标准库定义了errno，系统调用失败后自动填写错误代码，记录失败原因
#include <errno.h>之后，就可以直接使用errno
```char *strerror(int errno);```:库函数strerror将数字形式的错误代码转换成一个可阅读的字符串
```printf的%m```:printf类函数格式字符串中的%m会被替换成上次系统调用失败的错误代码对应的消息（message）

这里有一个例子：

```c
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
int main(char argc, char *argv[])
{
int fd;
fd = open(argv[1], O_WRONLY);
if (fd == -1) {
  //这里展示了两种输出错误代码对应的信息的方法
printf("ERROR %d: %m\n", errno);
printf("ERROR [%s]\n", strerror(errno));
}
. . . . . .
}
```

### 访问i节点和目录

**stat**得到指定路径名的文件的i节点 （路径名）
**fstat**得到已打开文件的i节点 （内存中节点）

```c
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
int stat(const char *pathname, struct stat *buf);
int fstat(int fd, struct stat *buf);
```

↓结构体stat,写coding作业2的时候会用到

```c
struct stat {
  dev_t st_dev; /* 存储该文件的块设备的设备号ID，包括主设备号与次设备号*/
  ino_t st_ino; /* inode号 */
  mode_t st_mode; /* 访问权限及文件类型 */
  nlink_t st_nlink; /* link数 */
  uid_t st_uid; /* 文件主ID */
  gid_t st_gid; /* 组ID */
  dev_t st_rdev; /* device ID (if special file) */
  off_t st_size; /* 文件大小（字节数）*/
  blksize_t st_blksize; /* blocksize for filesystem I/O */
  blkcnt_t st_blocks; /* 分配的512字节尺寸块个数 */
  struct timespec st_atim; /* access时间 */
  struct timespec st_mtim; /* modification时间 */
  struct timespec st_ctim; /* change时间 */
};
```

#### 目录访问的一组库函数

```c
#include <dirent.h>
DIR *opendir(char *dirname);
struct dirent *readdir(DIR *dir);
int closedir(DIR *dir);
```
opendir打开目录得到句柄,readdir获取一个目录项.
用closedir关闭不再使用的目录句柄。

目录访问程序

```c
int main(int argc, char *argv[])
{
  DIR *dir;
  struct dirent *entry;
  if (argc != 2) {
  fprintf(stderr, "Usage : %s <dirname>\n", argv[0]);
  exit(1);
  }
  if ((dir = opendir(argv[1])) == NULL) {
  printf("Open directory \"%s\": %s (ERROR %d)\n",
  argv[1], strerror(errno), errno);
  exit(1);
  }
  while ((entry = readdir(dir)) != NULL)
  printf("%d %s\n", entry->d_ino, entry->d_name);
  closedir(dir);
  return 0;
}
```

这个的运行结果就是把当前目录下一层级的子目录输出出来。


## 补充1：远程登录服务器

### 1.ssh

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

### 2.git bash

就拿来当cmd用，也是用ssh连的，不再赘述

### 3.putty

略，没用过

### 4.secureCRT

略，看起来跟笔者常用的xshell差不多。

### 传输文件的软件

1. winSCP，图形化的界面，比较舒服
2. 远程连接的窗口有传输文件的专用命令rz sz

### 非对称性加密

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
