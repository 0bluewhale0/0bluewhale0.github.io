---
title: 计网笔记_MAC1
date: 2022-04-13 18:26:00
categories:
	- 笔记
tags:
	- course
	- 计网
toc: true
cover: /img/v2-65e265085ffd40c14eebc2f141b9f7ad_720w.jpg
---

咕咕咕咕咕咕
鸽了很久的笔记
主要是每天躺着根本不想听课
就想着玩儿了

MAC:The Medium Access Control Sublayer 介质访问控制子层

## 4.1 信道分配问题

The Channel Allocation Problem
<!---网桥是重点--->
<!---路由是网络层的--->
<!---VLAN虚拟的局域网，是为了安全--->
### M/M/1 system

信道到达信息的概率服从泊松分布
![泊松分布](https://api2.mubu.com/v3/document_image/db416156-5a59-4ad2-9cd8-e066d232d4a6-16175743.jpg)
其中，λ 是 arrival rate (frames/sec)
标准排队理论的结果是
$T=\cfrac{1}{\mu C-\lambda}$
![标准排队理论](https://api2.mubu.com/v3/document_image/16501209178869b8a.jpg)
就是说，信道越小，<u>该信道上</u>发送一个帧的平均时延越小。（或许可以考虑一大群黄鳝源源不断的从一段管道中通过？（如果这样想能想明白的话）总之这个T是针对某个信道而言的）

$$信道分配问题\left\{
\begin{matrix}
	静态信道分配Static\\
	动态信道分配Dynamic
\end{matrix}
\right.$$

### 动态信道分配

1. 受控的多路通道
   1. 中心化的：polling，投票，挨个询问
   2. 无中心的：token，令牌，谁拿到谁发
2. 随机的多路access
   1. ALOHA
   2. CSMA, CSMA/CD, CSMA/CA

## 4.2 多路访问协议

### ALOHA协议（读作~~allow~~）

#### pure ALOHA

1. 数据帧被传输在完全的随机时间，如果有冲突，就等一个随机的时间再发
![pure ALOHA](https://api2.mubu.com/v3/document_image/cbafc61d-5bd0-4657-b7dd-0c21070ad96c-16175743.jpg)
2. 这里的冲突是指的只要有一个bit的重叠，就被毁掉了，因为是电信号一旦重叠就肯定被毁了。
3. Collision Demo：![Collision Demo：](https://api2.mubu.com/v3/document_image/329188b8-47f6-41a0-be49-5333580eb2eb-16175743.jpg)
4. Vulnerable period for the shaded frame.就是说在灰色帧发送的t0时刻前后的t时间里，不能有别的帧发送。![11](https://api2.mubu.com/v3/document_image/b519b5f4-7125-47ec-b943-62f6267d564c-16175743.jpg)
5. 假设：帧长固定，帧发送时间也固定

#### Sloted ALOHA

一个重点是S/G

### CMA/CD

没写，回头补，咕咕咕

## 4.4 无线局域网

Wireless LAN Protocols

需要解决的问题：
Hidden station problem
Exposed station problem
解决方法：

- PCF (Point Coordination Function)
- DCF (Distributed Coordination Function)：
  - CSMA/CA:CSMA with Collision Avoidance
  - MACA(Multiple Access with Collision Avoidance)  protocol
MACA: Collision Avoidance
- A发给B一个RTS（request to send）（30 bytes长，包含将要发送的数据的长度）
- B回复一个CTS（clear to send）（contains data length from RTS）
- 当收到CTS的时候，A开始发送数据
- 听到RTS的其他站点保持足够长的沉默时间（C,E）
- 听到CTS的其他站点在即将到来的（upcoming）数据传输中保持沉默。
![传输范围](https://api2.mubu.com/v3/document_image/7719c78a-d525-4c61-9d83-1e1033423609-16175743.jpg)

## 4.3 以太网Ethernet

1. 以太网cable
   ![以太网cable](https://api2.mubu.com/v3/document_image/d4080a82-a43c-40a7-bae6-86dee8e91d33-16175743.jpg)
2. 以太网Topologies(拓扑)

### Ethernet MAC Sublayer Protocol

帧的格式（needrem）
![frame fromat](https://api2.mubu.com/v3/document_image/69a402c2-a4d7-4fad-8f60-83f849e2c4c4-16175743.jpg)

（a）DIX 以太网标准
（b）IEEE 802.3标准
Preamble:前导/序言，同步时钟信号。
Type：发送的数据是什么类型的，网上递交交到哪里去
Pad：填充字段，保证Data+Pad>=46，防止帧长过小
[click](https://api2.mubu.com/v3/document_image/16518386874381ff3.jpg)

1. 以太网地址，6字节
   在往上就是IP，然后就是DNS了
   ![IEEE802](https://api2.mubu.com/v3/document_image/783326c4-4a41-43e5-819b-3eed68ae5aa0-16175743.jpg)
   前面3个字节是厂家的标识，后面是厂家给用户分配的地址（网口）
   这个属于Unicast，其他的还有Multicast，Broadcast（全1）。
2. 帧长
   最大的帧长是<mark>1514</mark>bytes（<mark>数据是1500bytes</mark>）
   1514:1500+6+6+2(type)
   1518:1500+6+6+2+4(CRC)
   最小帧长是<mark>64bytes</mark>=46(pad)+18(跟上面那个一样)
   也就是 64x8=512 bits
   为什么需要有帧长的下限：
   Collision Detect Can take as long as 2$\tau$
   ![为什么需要有帧长的下限](https://api2.mubu.com/v3/document_image/6dca1935-e996-411d-a4aa-3cc560bd73a1-16175743.jpg)

### 二进制指数退避算法

Binary Exponential Backoff Algorithm
在CMA/CD协议中，会等一个随机数，生成这个随机数的时候会需要一个上限
随着冲突次数的增加，随机数的上限以2的指数次增加，一直到1024个时间片，就不再增加比如：
![以2的指数次增加](https://api2.mubu.com/v3/document_image/670fceab-f222-4966-8634-00c372fe590a-16175743.jpg)
这个算法是分布式的，即仅考虑自己是第几次冲突

### IEEE 802.3 Performance（Ethernet）

Frame length: F
Bandwith: B
Cable length: L
Speed of signal propagation: c
e:就是2.71828那个e
channel efficency = $\cfrac{1}{1+\cfrac{2BLe}{cF}}$

Efficiency of Ethernet at 10 Mbps with 512-bit slot times
![Efficiency](https://api2.mubu.com/v3/document_image/3ac99641-5886-4176-93ff-cda58e5c3dcd-16175743.jpg)

### Fast Ethernet 快速以太网

所有之前的帧的格式，接口，程序都没有改变
减少bit time（100ns->10ns）
减少最大电缆长度为原来的十分之一
Cabling:
![Fast Ethernet cabling](https://api2.mubu.com/v3/document_image/b4c1f47d-ee1a-409f-bdda-379dd76a256d-16175743.jpg)

100Basw-T4:<mark>不用曼彻斯特编码</mark>了
![100Basw-T4](https://api2.mubu.com/v3/document_image/7e3c5430-0d8b-4a75-a174-a5cc6bbd862c-16175743.jpg)

### Gabit Ethernet

千兆的标准仍然向后兼容
网络半径变为25米，（速率提高10倍，距离一定缩小）
解决方法

1. 添加padding，用于填充
2. 让几个短帧拼接在一起
3. 总之就是让帧的尺寸>=512bytes
最终让网络工作的半径保持在200米
Cabling:
![Cabling](https://api2.mubu.com/v3/document_image/1c9bce00-30ac-4e23-9335-2565ad825b8b-16175743.jpg)
Flow Control:(新增功能，因为千兆太快了)

### 10Gabit Ethernet

一般在数据中心内部

## 4.5 宽带无线

### IEEE802.11/wifi

All use CSMA/CA for multiple access(多路访问采用冲突避免)
All have base-station and ad-hoc network versions

尽量避免冲突
CSMA：在发送之前sense
是一个无线环境，咩办法像在有线的里面一样弄CD（冲突检测），而且也没办法监听到所有的冲突（站隐藏）
CSMA/CA：用协议来避免冲突叫做CSMA/CA,C(ollision)A(voidance)

当一个站点有frame要发送时

- 监听信道直到空闲为止，等一个时间片（DIFS:分布式的帧间隔,一个比较小的时间）
- Random backoff：可能要等一个随机的时间（0~15 time slots），这东西是个倒计时，假如是13，就13--。
- 如果帧发过去了，终点发一个简短的ACK，几乎不等待，认为是立刻发回来
- 缺少ACK会被推测为显示了一个冲突或者别的错误，把backoff的时间片翻倍，再次尝试。(类似二进制退避算法)
![CSMA/CA](https://api2.mubu.com/v3/document_image/46566387-ba5a-4f85-8821-80e5a215ec27-16175743.jpg)

Chanel sensing:

- 物理监听：check媒介，看有没有信号
- 虚拟监听：每个站点维护一个逻辑的记录，记录什么时候信道被占用，通过追踪**NAV（network allocation vector）**；每个帧都carries一个NAV，一个数据帧的NAV包含发送一个ack所需的时间

RTS:request to send
CTS:clear to send
![NAV](https://api2.mubu.com/v3/document_image/23ddd9f5-7de1-4626-8822-b8b2fb2f359c-16175743.jpg)

802.11 reliability

- 降低传输速度（rate）
- fragment burst：碎片突发，将一个大的帧切成小的碎片，帧的尺寸没变。这就好比有一定的误码率，一个很大的帧怎么发都发不出去。

802.11 省电
就是不定期的让客户端睡觉。然后AP在client睡着的时候，缓存发送的信息

- Beason frames信标帧
  - 客户端可以进入省电模式
  - AP会buffer发送的帧
  - 睡醒之后发送一个poll的信息给AP（就时不时睡醒一下）
- APSD（automatic power save delivery）
  当客户端发数据给AP的时候，AP把buffer的数据发给客户端。

802.11 QOS：interframe Spacing(IFS,帧间隔)
>QOS:quality of sevice

- DIFS:regular data frames
- SIFS:
  - ACK
  - 其他的控制帧，比如RTS,CTS
  - a burst of fragment（碎片突发）
- AIFS1:适用于PDF方式，就是语音或者其他优先级较高的传输
- AIFS4：后台通信，不太重要
- EIFS：异常时间
![interframe Spacing](https://api2.mubu.com/v3/document_image/064c30a1-ab7c-4ad0-b669-841bb55fdae1-16175743.jpg)

QOS：TXOP 传输机会
TX:transmit OP:opportunity
![QOS：TXOP](https://api2.mubu.com/v3/document_image/162edab3-5d51-4133-ab69-abfc80ca1eb9-16175743.jpg)
无线局域网中，一个站点发送完了之后其他的站点会抢信道，然后抢到的就接着发。
在这个例子中，发送同样长的一个帧，6Mbps的站点花费的时间是54Mbps的站点发送时间的9倍，也就是说，在单位1的时间里，有0.9的时间是6Mbps的站点在发送，0.1的时间是54Mbps的站点在发送，这段时间针对每个站点的平均速率都为5.4Mbps。对于6Mbps的站点：发0.9的时间，等0.1的时间，相当于只发了6x0.9=5.4,对于54Mbps的站点，发0.1的时间，等0.9的时间，也相当于只发了54x0.1=5.4。
用了TXOP之后，两个站点占用的时间一样，都是一半，这样带宽也就降为原来的一半。
这样比较公平。

>关于计算多个站点的平均速率：
 有公式
 $\cfrac{1}{\cfrac{n_1}{B_1}+\cfrac{n_2}{B_2}+\cfrac{n_3}{B_3}+...}$
 其中，Bi是速率，ni是具有Bi速率的站点的个数。这样算出来的所有站点的速率是一样的。
 如果能整除就不要添了，不能整除保留两位。

802.11的帧格式

![format](https://api2.mubu.com/v3/document_image/b0a79323-b67a-4b67-8176-3e81822aacd4-16175743.jpg)

地址1：目的，host或者AP的地址，也就是接受的站点的地址
地址2：源，发送站点的地址
地址3：router的地址，这个router是AP链接的那个路由器
![为啥还得有地址3捏](https://api2.mubu.com/v3/document_image/f2d22197-dd21-4b51-9abd-be84897e4c93-16175743.jpg)
就是说，AP在发送的时候，不知道router的地址，所以把地址3读出来，作为这个小过程的目的地址，而原本的AP的地址是源地址。在这个小过程中，就相当于是802.3协议了。

802.2：LLC，逻辑电路控制子层
是在802.3或者其他802协议上面跑的，就是在MAC上面，使得向网络层提供的服务是单一的，统一的服务。但是大部分设备都是没这一层玩意的。DIX是不需要的，但是802.3一般是要加上这个的。
提供3个服务选择
（懒得自己写了，抄一个：）

- Unreliable datagram service 不可考的数据报
     (best-efforts datagram service)
- Acknowledged datagram service 可靠的数据报
     (Error-controlled)
- Reliable connection-oriented service 面向链接的
     (Error-controlled &  flow-controlled)

>LLC头里面有个header，来控制交给上面一层的哪一个模块儿

## 4.8 数据链路层交换

DLLS：Data Link Layer Switching

### 不同802协议之间的桥接


### 本地互联Local Internetworking

![](https://api2.mubu.com/v3/document_image/610f9006-61fb-4320-8614-5283f9f2dbaa-16175743.jpg)
左边那个是通过一个桥接设备连接起两个网络
右边那个相当于二层交换机
![Protocol processing](https://api2.mubu.com/v3/document_image/48fe4bcd-5734-496e-8e9b-cf667fe5019d-16175743.jpg)
如果左右两侧的协议不同，那么需要生成一个新的帧头，网桥是工作在数据链路层的。

Bridges from 802.x to 802.y

可能遇到的一些问题

帧格式不一样
![帧格式不一样](https://api2.mubu.com/v3/document_image/b21a25c8-afe1-4895-918b-364bd0fd1ac4-16175743.jpg)
数据速率不同（缓存）
最大帧长度不一样
安全问题：无限局域网支持加密，以太网不支持
QOS问题：802.11支持，以太网不支持

### Learning Bridge 自学习网桥

又名Transparent，咩有CPU，便宜。
>bridge和Switch的差别：switch的端口只有以太网，但是bridge上面可能有不同的端口（不同的局域网之间桥接）,其他的工作原理一毛一样。

- 工作在混杂的mode下
  不同于仅接受特定地址或者广播的帧，接收所有的帧
- 站点（转发点）表格
  自学列出来每个可能的目的地址和应该转发的线路
- 针对一个正在发过来的帧的路由过程
  检索站表
  如果目的LAN和源LAN一样，discard
  如果目的LAN和源LAN不一样，forward
  如果目的LAN不知道或者multicast/broadcast
  采用flooding algorithm
  >所以如果站表是空的，那就把除了输入端口以外的所有端口复制一份。
  如何判断LAN一样与否？看有咩有网桥在中间做桥接

#### Station Table：Backward Learning

初始情况是空的
因为可以看到所有的帧，然后偷偷看一下某个端口收到的帧是从哪里来的，然后记住想到这里去要从哪个端口走。

#### Dynamic topologies 动态拓扑

无论最初的hash表有没有建立，都会记录arrival time
如果长时间（一般是20min）左右，没有更新，那么就把这东西给删了。
>交换机的站表满了之后，整个网上的数据就处于一个扩散的状态，这也是黑客攻击的一种手段。
俩个构造station table 的例子
![例子](https://api2.mubu.com/v3/document_image/50525ea3-4613-4e02-8d29-4f06d1e3d5fd-16175743.jpg)
![例子](https://api2.mubu.com/v3/document_image/5cf3f19a-060a-490a-99a3-d56cabbb0888-16175743.jpg)

### spanning tree 生成树的网桥

贵。
上面的结构没有环路，生成树网桥是为了解决环路问题的。
关于环路的问题：
有时候，为了增加可靠性，会多家几条路径
这个就导致了拓扑结构中出现环路
协议：802.1d: Constructing the Spanning Tree
过程：（了解即可）

- Bridge periodically multicast a message out all of its ports, this message is not forwarded, it includes:
  - an ID based on its MAC address
  - ID of the root it  believe to be
  - the distance to root
- Chose the bridge with the lowest ID to be the root, after enough messages exchanged, all bridges will agree on the root
- Remembers the shortest path to root, if there are multiple equivalent paths, the path via bridge with lowest ID is chosen
- Turn off ports that are not part of the shortest path
- Algorithm continues to run during normal operation to automatically detect topology changes and update the tree

Dynamic Topologies
- BPDU (Bridge Protocol Data Unit)
Bridge periodically multicast a message (MAC 01:80:c2:00:00:00) out all of its ports, this message is not forwarded, it includes:
an ID based on its MAC address
ID of the root it  believe to be
the distance to root
- Root Bridge of Whole Net
Chose the bridge with lowest ID to be the root, after enough messages exchanged, all bridges will agree on the root
- Root Port of Every Bridge
Remembers the shortest path to root, if there are multiple equivalent paths, the path via bridge with lowest ID is chosen
- Algorithm continues to run during normal operation to automatically detect topology changes and update the tree

### 几个设备

1. 物理层：
   1. repeaters
   2. Hub（纯物理层，长得像switch，将一个设备的输入接口和其他设备的输出接口接起来）
2. 数据链路层
   1. bridges
   2. Switches（提及一个3层交换机，但不懂）
3. 网络层
   1. Routers
   2. Gateways（网关）

![几个设备](https://api2.mubu.com/v3/document_image/54276143-0987-40c4-857c-ba52f417f484-16175743.jpg)
(a)不同层对应的设备
(b)frames，packet and headers
![hub，bridge，switch](https://api2.mubu.com/v3/document_image/d62cc695-8518-4578-bc8f-85c70fd596db-16175743.jpg)
从左到右：hub，bridge，switch
bridge和switch：
几个微秒就可以构造出来站表
因为速率可能不同，还得有buffer
cut-through switch：直通式的交换机（拿到目的地址之后直接就开始转发）

### 虚拟局域网

人事部，财务部，研发部的设备通过VLan划分开，不允许互相通信
![长这样](https://api2.mubu.com/v3/document_image/69387a3e-a977-4a97-8926-da5df6b88d87-16175743.jpg)
为啥整VLAN捏？

1. 广播风暴
   1. 当LAN规模比较大的时候，广播帧太多的时候，所有的设备都需要处理
   2. 机器们就残废了
2. 安全问题
   1. 一些部门有不想让别的部门知道的信息
![VLAN](https://api2.mubu.com/v3/document_image/0082b05a-9203-4354-a146-19dd170df9f1-16175743.jpg)
(a)是总线链接的，所以A收发的时候BCD也能听到
(b)是交换机型，可以做到仅同组听到

VLAN ID

1. 用端口号（most方便most常见）
2. 用MAC地址
3. 根据第三层的协议

![802.1Q](https://api2.mubu.com/v3/document_image/6190f69b-1689-45bd-b4e7-51b3d3e31e87-16175743.jpg)
VLAN protocol ID (16 bits): 0x8100
Pri (3 bits)
CFI (1 bit)
VLAN Identifier (12 Bits)
802.1Q Max frame length: 1522 bytes

## WordTable

>capicity
 overlap 重叠，重复
 garble 混淆，模糊
 idle 空的
 carrier sense 载波监听
 arbitrary 随意的，任意的
 Vulnerable  adj.易受伤的, 脆弱的, 敏感的
 Throughout 吞吐量=利用率*带宽
 Beason （啥呀这是草）
 fragment 碎片
 promiscuous 混杂的
 crippled 残废的
 legacy 遗产，遗留之物。legacy end domain 传统域，翻译为传统的
 exclude vt. 排除；排斥；拒绝接纳；逐出
 reserved adj. 保留的，预订的；缄默的，冷淡的；包租的

<!-- 课听到MAC(6)的一小时多了，不想听了，下次补上（ -->
