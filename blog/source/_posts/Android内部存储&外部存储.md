---
title: Android内部存储和外部存储
date: 2022-08-3 19:26:00
categories:
	- Android
tags:
	- Android

cover: /img/pexels-marek-piwnicki-11032446.jpg
---

## 内部存储

1. 内部存储不是内存
   内部存储位于系统中很特殊的一个位置，如果你想将文件存储于内部存储中，那么文件默认**只能被你的应用访问到，且一个应用所创建的所有文件都在和应用包名相同的目录下。**也就是说应用创建于内部存储的文件，与这个应用是关联起来的。当一个应用卸载之后，内部存储中的这些文件也被删除。
2. 从技术上来讲如果你在创建内部存储文件的时候将文件属性设置成可读，其他app能够访问自己应用的数据，前提是他知道你这个应用的包名，如果一个文件的属性是私有（private），那么即使知道包名其他应用也无法访问。
3. 内部存储空间十分有限，因而显得可贵，另外，它也是系统本身和系统应用程序主要的数据存储所在地，一旦内部存储空间耗尽，手机也就无法使用了。所以对于内部存储空间，我们要尽量避免使用。
4. Shared Preferences和SQLite数据库都是存储在内部存储空间上的。内部存储一般用Context来获取和操作。

### 访问内部存储

内部存储位于手机系统下的"/data/data/<包名>/files"目录中。
使用javaI/O流体系可以很方便的对内部存储的数据进行读写。
其中，FileOutputStream类的openFileOutput()方法用来打开相应的输出流；
FileOutputStream类的openFileInput()方法用来打开相应的输入流。
默认情况下仅当前应用程序可见。卸载了一起删。
![示例](https://api2.mubu.com/v3/document_image/57676964-b07d-4723-85c4-3016e254ccc1-16175743.jpg)

![示例](https://api2.mubu.com/v3/document_image/c04123c8-57e6-417b-a9fa-db985f1ea175-16175743.jpg)

## 外部存储

老的Android系统的跟新的Android系统是有差别的，很多人去网上查找资料，看了一下以前的资料，又看了一下现在的资料，但是发现它们说法不一样然后就困惑了。

首先说一个大家普遍的概念“如果在pc机上是区分外部存储和内部存储的话，那么电脑自带的硬盘算是内部存储，U盘或者移动硬盘就是外部存储了。”因此很多人带着这样的理解去看待安卓手机，把内置存储（机身存储）当做内部存储，而把扩展的SD卡当做是外部存储。这么认为确实没错，因为在4.4（API19）以前的手机上确实是这样的，手机自身带的存储卡就是内部存储，而扩展的SD卡就是外部存储。

但是从4.4的系统开始，很多的中高端机器都将自己的机身存储扩展到了8G以上，比如有的人的手机是16G的，有的人的手机是32G的，但是这个16G，32G是内部存储吗，不是的！！！，它们依然是外部存储，也就是说4.4系统及以上的手机将机身存储存储（手机自身带的存储叫做机身存储）在概念上分成了”内部存储internal” 和”外部存储external” 两部分。既然16G，32G是外部存储，那有人又有疑惑了，那4.4系统及以上的手机要是插了SD卡呢，SD卡又是什么呢，如果SD卡也是外部存储的话，那怎么区分机身存储的外部存储跟SD卡的外部存储呢？对，SD卡也是外部存储，那怎么区分呢，在4.4以后的系统中，API提供了这样一个方法来遍历手机的外部存储路径：

```java

File files;
	if(Build.Version.sdk_int>=Build.VERSION_CODES.KITKAT)
	{
		files = getExternalFilesDirs(Environment.MEDIA_MOUNTED);
		for(File file:files){
			Log.i("main",String.valueOf(file));
		}
	}

```

$\delta$

运行结果：

![运行结果](https://api2.mubu.com/v3/document_image/ceda83d6-8d67-4a76-8dfd-f5c83bdce5cb-16175743.jpg)

图片看区别：

![两者区别](https://api2.mubu.com/v3/document_image/4084bea6-6c8a-4487-b059-e07e248a35ac-16175743.jpg)

## 内存、内部存储和外部存储

1. 内存：我们在英文中称作memory，内存是计算机中重要的部件之一，它是与CPU进行沟通的桥梁。计算机中所有程序的运行都是在内存中进行的，所以说它是用于计算机运行时的，它不是用来存储数据的。
2. 内部存储or外部存储：内部存储我们称为InternalStorage，外部我们称为ExternalStorage，这两个概念来自于早期的Android智能机，4.4以前，内置存储就是内部存储，外置SD卡就是外置存储。我们通过getDataDirectory就可以获取内置存储根路径，通过getExternalStorageDirectory就可以获取外置SD卡根路径。4.4以后外部存储就包含两部分了，其中通过getExternalStorageDirectory获取的是机身存储的外部存储，而外置SD卡我们则需要通过getExternalDirs遍历来获取了。
3. 机身存储：机身存储是指手机自身携带的存储空间，出厂时就已经有了，4.4以前机身存储就是内部存储，4.4及以后机身存储包含了内部存储和外部存储。

<font size=1>参考：[Android文件存储---内部存储/外部存储](https://blog.csdn.net/weixin_45882303/article/details/121915887)</font>