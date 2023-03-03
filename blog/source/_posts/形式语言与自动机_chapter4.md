---
title: 形式语言与自动机_4
date: 2022-05-12 21:53:00
categories:
	- 笔记
tags:
	- course
	- 形式语言与自动机

cover: /img/zhongliANDdada.jpg
---

# 第四章  上下文无关文法与下推自动机

上下文无关文法：CFG(contex free grammar)
2型文法，产生式形如A->a，A$\in$N

[几种文法的特点整理](https://api2.mubu.com/v3/document_image/1647178722462b691.jpg)

对应的识别器：下推自动机
PDA（push down Automata）
PDA由输入带，有限控制器和下推栈组成
![1](https://api2.mubu.com/v3/document_image/24b4fce5-8f87-4dca-84a9-9352955a2392-16175743.jpg)

## 归约和推导

推理字符串是否属于文法所定义的语言

- 一种是自下而上的方法，称为递归推理(recursive inference），递归推理的过程习称为归约；
- 一种是自上而下的方法，称为推导（derivation）.
- 归约过程   将产生式的右部（body）替换为产生式的左部（ head ）.
- 推导过程   将产生式的左部（ head ）替换为产生式的右部（ body ）

例子：
![归约](https://api2.mubu.com/v3/document_image/9bd456a1-7f21-40cb-aec1-055eeccc42b8-16175743.jpg)
![推导](https://api2.mubu.com/v3/document_image/57a9fc01-11d8-4b9b-a469-09a31d167672-16175743.jpg)

- 最左推导(leftmost derivations)
若推导过程的每一步总是替换出现在最左边的非终结符。
![l](https://api2.mubu.com/v3/document_image/9fb0447a-54b0-4f72-b822-d55cec7336c9-16175743.jpg)
- 最右推导(rightmost derivations)
若推导过程的每一步总是替换出现在最右边的非终结符。
![r](https://api2.mubu.com/v3/document_image/bf95a2f6-8124-49c1-bd4c-7a68e69df74f-16175743.jpg)

## 推导树和文法的二义性

### 推导树

用图的方法表示一个句型的推导，这种图称为推导树（也称语法树或语法分析树）
文法的起始符为根，树的枝结点标记是非终结符，叶结点标记为终结符或$\sigma$。
若枝结点有直接子孙x1, x2,…, xk，则文法中有生成式A→x1x2…xk
![li](https://api2.mubu.com/v3/document_image/378f4ab9-9951-475b-996c-9cc934efc070-16175743.jpg)
![tu](https://api2.mubu.com/v3/document_image/378f4ab9-9951-475b-996c-9cc934efc070-16175743.jpg)
推导树是对文法G中一个<u>特定句子形式</u>的派生过程所做的一种自然描述。

- 边缘
  叶子从左向右组成的字符串称为推导树的边缘。

### 归约、推导与分析树之间关系

归约
![归约](https://api2.mubu.com/v3/document_image/034d00dd-d424-4ef1-a4ed-bf831eb1516f-16175743.jpg)
推导
![推导](https://api2.mubu.com/v3/document_image/bfa38244-02b0-4e7b-97f5-16c4befc3faf-16175743.jpg)
关系
![关系](https://api2.mubu.com/v3/document_image/e9d33c57-17f4-4416-b8a8-63bad4e38309-16175743.jpg)
证明2->5:
设2型文法G=（N，T，P，S），如果存在S![推导出](https://api2.mubu.com/v3/document_image/03811fd1-79b9-46ae-9187-fee25974c922-16175743.jpg)ω，当且仅当文法G中有一棵边缘为ω的推导树。

- 子树：
  一棵派生树的子树，是树中的某个顶点连同它的全部后裔，以及连接这些后裔的边。
[证明](https://api2.mubu.com/v3/document_image/09c3c42d-5fd5-415e-983d-4ac2fcbf359e-16175743.jpg)
[证明步骤1](https://api2.mubu.com/v3/document_image/87352b24-c498-4dae-b762-b8d55e66ec0a-16175743.jpg)
[证明步骤2](https://api2.mubu.com/v3/document_image/4650faf7-c73d-46df-aa3d-2f6c57288b96-16175743.jpg)

### 二义性

2型文法是二义的,当且仅当对于句子ω∈L(G),存在两棵不同的具有边缘为ω的推导树。  
(即：如果文法是二义的, 那么它所产生的某个句子必然能从不同的最左(右)推导推出)。

- 可有二个文法,一个有二义,一个无二义,但产生相同的语言.
- 可否通过变换消除二义性? —— 无一般的算法!

## 上下文无关文法的变换

1. CFG 的简化
   - 消无用符号
   - 消$\varepsilon$产生式
   - 消单产生式
2. 对生成式形式进行标准化

生成式的标准形式:

1. Chomsky范式 ：
  CNF - Chomsky Normal Form
  ![CNF](https://api2.mubu.com/v3/document_image/0b972e9e-9103-4285-9f11-7f404d2b45d5-16175743.jpg)
2. Greibach范式：(GNF)
  ![GNF](https://api2.mubu.com/v3/document_image/8d0a5097-0bbf-4510-9abb-af14a4c8335e-16175743.jpg)

### 消去无用符号

#### 有用符号X

![X](https://api2.mubu.com/v3/document_image/5c46692f-3ba3-4bd6-9dba-7ee1a79a2591-16175743.jpg)

- 生成符号 generating symbol
  ![生成符号](https://api2.mubu.com/v3/document_image/de1c8e4b-b028-48bf-933f-cd2937e22558-16175743.jpg)
- 可达符号 reachable symbol
  ![可达符号](https://api2.mubu.com/v3/document_image/5c6aef7e-f00b-4260-9193-b75193bee158-16175743.jpg)

#### 无用符号

- 非生成符号
- 不可达符号

#### 消去无用符号的步骤

- 计算生成符号集
- 计算可达符号集
- 消去非生成符号、不可达符号
- 消去相关产生式

#### 计算生成符号

思路
![思路](https://api2.mubu.com/v3/document_image/2872eb33-ddb9-4db1-8834-e79814953a22-16175743.jpg)
算法1:找出有用非终结符
![算法1](https://api2.mubu.com/v3/document_image/85a050c1-fc53-4c32-8bb9-ad81abfcd396-16175743.jpg)
算法1图示:
![图示](https://api2.mubu.com/v3/document_image/e8eeb259-84f4-4948-bced-32389df931f8-16175743.jpg)
一层层向外扩展，直至最外两层相等为止。所得集合即是算法1的有用符号。

#### 计算可达符号集

思路
![计算可达符号集](https://api2.mubu.com/v3/document_image/3af1f690-10fa-4b64-b311-f854d46d985c-16175743.jpg)
算法2：找出有用符号（从S出发可达的符号）
![算法2](https://api2.mubu.com/v3/document_image/e8094e10-e4bf-4ad9-86b2-f034d639b972-16175743.jpg)
图示
![图示](https://api2.mubu.com/v3/document_image/0f604071-1898-407d-8229-5b6f406f9481-16175743.jpg)

#### 一个例子

![lizi](https://api2.mubu.com/v3/document_image/c9e673b9-0573-4f99-80d6-bdc67adbdef8-16175743.jpg)
注意：在删除一个无用符号时，要把与它相关的式子也删掉。
并且，<mark>一定要先执行算法1，保证每个符号是生成符号，再执行算法2，保证每个符号是可达符号。否则可能会导致一些无用符号无法消除。</mark>（这个例子就是不这么干的反例）

一个定理：
任何非空的上下文无关语言,可由不存在无用符号的上下文无关语言产生(证明略)

### 消去$\varepsilon$产生式

目的：方便文法的设计, 利于文法规范化.  
影响：消去$\varepsilon$产生式, 除了文法不能产生字符串$\varepsilon$外，不会影响到原文法相应的语言中其它字符串的产生.

#### 可致空符号

nullable symbol
![可致空符号](https://api2.mubu.com/v3/document_image/daace5c0-2d0f-41d8-a022-f245a90d2803-16175743.jpg)

#### 算法3: 生成无$\varepsilon$文法

定义：若G的生成式中无任何$\varepsilon$产生式，或只有一个生成式S→$\varepsilon$且S不出现在任何生成式的右边，则称G为无$\varepsilon$文法。

思路：

![思路](https://api2.mubu.com/v3/document_image/1d6d41c1-729e-4ac4-bf47-4e296f3ec652-16175743.jpg)

<mark>算法步骤</mark>

![算法步骤](https://api2.mubu.com/v3/document_image/c2829b36-1400-4476-8955-a96feefca3b5-16175743.jpg)

![2](https://api2.mubu.com/v3/document_image/c9ff1e87-ea57-4e2f-967d-1afa35baf359-16175743.jpg)
例子：
![lizi](https://api2.mubu.com/v3/document_image/c9c8141b-bc88-45af-8679-df1b572eaaff-16175743.jpg)

### 消去单产生式

什么是单产生式  
单产生式  形如 A->B 的产生式，其中A、B 为非终结符.  
目的：  
可简化某些证明，减少推导步数, 利于文法规范化.

#### 单元偶对 unit pairs

![unit pairs](https://api2.mubu.com/v3/document_image/7f563d59-edfa-4ab2-8303-90203d06e32d-16175743.jpg)

#### 消去单产生式的算法

##### 思路

![思路](https://api2.mubu.com/v3/document_image/ad2f4c73-516d-47c8-b469-9e1d07a124ce-16175743.jpg)

##### 算法步骤

![算法步骤](https://api2.mubu.com/v3/document_image/a2717996-4489-4e8c-8a3c-cc250d9a5e94-16175743.jpg)
$N_A$可以理解成所有和A是单元偶对的非终结符的集合
![算法步骤2](https://api2.mubu.com/v3/document_image/859f5d77-0587-4525-94b5-da4095c29ca6-16175743.jpg)

##### 例子

![例子](https://api2.mubu.com/v3/document_image/c7867368-350a-44d0-89e7-3ef3810d6721-16175743.jpg)
![例子2](https://api2.mubu.com/v3/document_image/aeeffb80-9874-4111-a53c-905b59a41550-16175743.jpg)
![例子3](https://api2.mubu.com/v3/document_image/ca9cfaa9-3519-4113-a5fa-a990f0f8c1cd-16175743.jpg)

### 小结

![小结](https://api2.mubu.com/v3/document_image/0d85c3d2-3151-4d32-8e7b-1e30e8a4adf2-16175743.jpg)
注意 以上简化步骤的次序.
设 CFG  G 的语言至少包含一个非  的字符串，通过上述步骤从 G 构造 G1 ，则有 L(G1)= L(G) - {$\varepsilon$}.
必须按照顺序的原因：
消去空生成式的时候，可能会引入一些单生成式，而消除单生成式的时候又可能引入一些无用符号。

### 消除递归

递归定义：
![dingyi](https://api2.mubu.com/v3/document_image/7e94dd29-a89f-4f69-bd0b-42af73b3f5be-16175743.jpg)

#### 生成式的代换

引理1：
![引理1](https://api2.mubu.com/v3/document_image/e8952fc6-9135-4689-929b-a8cd7e9763d6-16175743.jpg)
一个小例子：
![一个小例子：](https://api2.mubu.com/v3/document_image/2a7b7faa-e60d-4c0b-a749-5a977b7a2e72-16175743.jpg)

#### 消除直接左递归

引理2
![引理2](https://api2.mubu.com/v3/document_image/7a19e78c-c34c-4c0b-8306-e92a46b1cf7f-16175743.jpg)
例子：
![例子：](https://api2.mubu.com/v3/document_image/4e5120d2-63e7-476f-b65e-93b2faccee87-16175743.jpg)

##### 为什么要消除左递归？

1. 以后的句法分析算法不适用于左递归,会引起死循环。
2. 对于给定的2型文法, 该文法不存在无用符号, 无循环且是无ε生成式的文法, 为了消除G中可能存在的左递归, 构成一个等效的无左递归的文法G1, 可用算法5。
3. 算法5在原理上与求解正规表达式方程组的算法类似.

##### 算法5

![算法5](https://api2.mubu.com/v3/document_image/8b1fcac4-46ff-44bc-add8-e1bbb49e997b-16175743.jpg)

##### 示例

![示例](https://api2.mubu.com/v3/document_image/7d33cbe8-dd03-4731-a2fc-6cc3662ffef8-16175743.jpg)
![示例2](https://api2.mubu.com/v3/document_image/b7130afb-b6ba-4374-9bc4-b69a79cad139-16175743.jpg)

## 下推自动机

## 上下文无关语言的性质



# Chomsky范式和Greibach范式

## Chomsky 范式

2型文法G＝（N，T，P，S）  
生成式形如：  
A→BC和A→a  
称为Chomsky Normal Format  
特别的，若ε∈L（G），则S→ε是P的一个生成式，但**S不能在任何其它生成式的右边**

构成步骤：

1. 消除ε生成式、无用符号、单生成式
2. 引入新的非终结符，凑

![CNF](https://api2.mubu.com/v3/document_image/2c0e2f24-d00e-4b33-9077-aa2c92baa578-16175743.jpg)

## Greibach范式

2型文法G＝（N，T，P，S）  
若生成式的形式都是A→aβ，A∈N，a∈T，β∈N*  
且G不含ε生成式，则称G为Greibach范式，记为GNF

构成步骤：

1. 2型文法变换为CNF。（A→a，A→BC形式）
2. 对非终结符排序
3. 假如按下标递增，不能出现$A1->A2\beta$（A2高于A1）
   1. 把A2的生成式带入，直至满足上述条件
4. 消除左递归（只对最高的Ai进行消除左递归，消除完了之后Ai就会满足GNF形式，即终结符a开头，但会引入新的非终结符Ai’,这些新的非终结符优先级是最低的）
5. 回代
   1. 依次回代Ai到Ai-1，Ai-1到Ai-2....一直到右部首字符都为终结符
6. 将消除左递归时候引入的带’的右部进行代换，换成右部首字符都为终结符。

GNF1：
![GNF1](https://api2.mubu.com/v3/document_image/1f5f4619-f44c-4f1d-9120-7cd807e9874c-16175743.jpg)
GNF2：
![GNF2](https://api2.mubu.com/v3/document_image/88f16a4c-5497-4016-b210-fde1e1179f3c-16175743.jpg)
GNF3：
![GNF3](https://api2.mubu.com/v3/document_image/10a971db-617a-4b4f-8153-7db24755a189-16175743.jpg)