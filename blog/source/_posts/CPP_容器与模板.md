---
title: CPP_容器类和模板
date: 2022-04-22 17:32:00
categories:
	- 笔记
tags:
	- course
	- C++

cover: /img/cpuandgirl.jpg
---

纯纯速通一下-3，全是截图，留着忘了基础操作的时候看

## 模板

为什么要有模板？
比如比较大小的函数，仅仅是参数类型不同，而操作一样，能不能只写一个函数？

模板定义
![](https://api2.mubu.com/v3/document_image/63229055-16fb-4237-821a-750f793ce906-16175743.jpg)

模板分类
![](https://api2.mubu.com/v3/document_image/8a649085-a9a2-46cd-bd88-83c418baddc2-16175743.jpg)
使用例子：
![](https://api2.mubu.com/v3/document_image/fe2eaa0b-d5fb-4a43-97d0-3d071ed9f103-16175743.jpg)
例子2：
![](https://api2.mubu.com/v3/document_image/5b47f3d4-9855-45f9-8b66-2b36938ff18f-16175743.jpg)

## 容器类

![](https://api2.mubu.com/v3/document_image/d5499771-36c0-4c5b-95f8-b371bab6f55a-16175743.jpg)

![](https://api2.mubu.com/v3/document_image/d74c7e2e-0031-478a-98d2-ebc0b013356f-16175743.jpg)

![](https://api2.mubu.com/v3/document_image/715754da-d46e-436c-9279-293b7ccdde99-16175743.jpg)

使用条件：
![](https://api2.mubu.com/v3/document_image/04b709f7-45d7-4f50-8b0d-c0dc3a1dd478-16175743.jpg)

使用格式
![](https://api2.mubu.com/v3/document_image/911599db-e41f-4eab-9ef7-78f7aab5f297-16175743.jpg)

初始化方式：
![](https://api2.mubu.com/v3/document_image/77d9cb0b-d50f-4ca3-82a6-844be0582c1b-16175743.jpg)
![](https://api2.mubu.com/v3/document_image/b6db9fe6-4faf-41aa-a7c2-a52a2aaf9029-16175743.jpg)
![](https://api2.mubu.com/v3/document_image/0fdd07cd-813a-4190-9bee-6c6c8fb03941-16175743.jpg)
![](https://api2.mubu.com/v3/document_image/8d434ba7-9a65-4cfc-a6ea-ae94736a8893-16175743.jpg)


### 迭代器

![](https://api2.mubu.com/v3/document_image/9b589e00-7f69-4393-932b-ec079764afa2-16175743.jpg)

迭代器的范围
![](https://api2.mubu.com/v3/document_image/b8073103-2d90-46bb-8443-7a853d92cce8-16175743.jpg)

迭代器失效
![](https://api2.mubu.com/v3/document_image/0d66ce77-28ab-4460-b308-469981a67987-16175743.jpg)
![](https://api2.mubu.com/v3/document_image/7d05d222-5e5e-4873-8dbb-e253bb724e84-16175743.jpg)
不同标准的C++的迭代器遍历
！[](https://api2.mubu.com/v3/document_image/727574aa-ef3b-4dc9-9a47-a7d2d761f12a-16175743.jpg)

### 顺序容器的典型操作

![](https://api2.mubu.com/v3/document_image/ac2fc968-1f95-4ed9-a99f-ef026a32d566-16175743.jpg)
![](https://api2.mubu.com/v3/document_image/ae5b3b87-2df3-48eb-9def-aff039ea8746-16175743.jpg)

1. vector
   ![](https://api2.mubu.com/v3/document_image/4b87d4d4-55c1-4f3c-b1da-ba5f6a3ced25-16175743.jpg)
2. list
   list的erase操作的参数与vector类似，这里没截到
   ![](https://api2.mubu.com/v3/document_image/e86767e6-b274-4100-ace0-1ab0bc2922a1-16175743.jpg)
3. 比较
   ![](https://api2.mubu.com/v3/document_image/a0cbe200-e687-475f-ba2a-93183c68f2ed-16175743.jpg)

### 关联容器

![](https://api2.mubu.com/v3/document_image/515e9d9d-2735-4f1a-be29-5ac5823e5a05-16175743.jpg)
![](https://api2.mubu.com/v3/document_image/26ab10b8-d08f-4186-b8d8-661b8b20d372-16175743.jpg)

map:
![](https://api2.mubu.com/v3/document_image/9cfa2a79-901f-47ab-b5c3-8eba59d58bf9-16175743.jpg)

### 泛型算法

![](https://api2.mubu.com/v3/document_image/2cf1a1b7-abbf-457d-9e76-34b384383ad6-16175743.jpg)
用法
![](https://api2.mubu.com/v3/document_image/cce292c3-6fa2-4edc-a90d-ed92b3a31fcb-16175743.jpg)

模板是泛型编程的基础

![](https://api2.mubu.com/v3/document_image/8c1036c4-842f-4972-ada3-d0926aa47927-16175743.jpg)
