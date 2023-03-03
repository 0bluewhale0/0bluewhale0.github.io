---
title: C++之胡乱记点我不知道的东西
date: 2022-03-18 15:26:00
categories:
	- 笔记
tags:
	- course
	- C++

cover: /img/zlbeatdragon.jpg
---

- 常量对象是在定义对象的时候，在前面加，常量成员函数是在成员函数说明的后面加上const关键字
- 常量成员函数不能够修改它所作用的对象，也不能调用同类的非常量成员函数。
- 两个成员函数，名字和参数都一样，一个带const关键字，一个不带，算重载。
- 友元：friend，友元分为友元函数和友元类两种
- 一个类的友元函数可以访问该类的私有成员，友元不是成员函数
- 如果一个类A是另一个类B的友元类，类A的成员函数可以直接访问类B的私有成员。友元类是需要像函数一样声明在类声明里的。
  具体格式如下：

  ```c++
  class Car
  {
	private:
	int price;
	friend class Driver; 
	Car();
	~Car();
  }

  class Driver
  {
	  public:
	  Car mycar;
	  void modifycar()//改装汽车
	  {
		  mycar.price+=1000;
	  }
  }
  ```
- 友元类的关系不能传递和继承
- C++运算符的重载![](https://api2.mubu.com/v3/document_image/e92acf47-b6a7-406c-83f1-84715254dd21-16175743.jpg)
- 运算符的重载本质上是函数的重载，根据不同的参数决定调用哪个函数。运算符可以被多次重载，可以重载为普通函数，也可以重载为成员函数

```c++
class Complex//复数类
{
	public:
	double real,img;
	Complex(r=0.0,i=0.0):real(r),img(i){}
	Complex operator-(const Complex c);
}
Complex operator+(const Complex a,const Complex b)
{
	return Complex(a.real+b.real,a.jmg+b.img);//返回一个临时对象
}

Complex Complex::operator-(const Complex c)
{
	return Complex(real-c.real,img-c.img);//返回一个临时对象
}
```
重载为普通函数时，参数数目和操作数数目相同，重载为成员函数时，参数数目比操作数少1，相当于成员函数作用的成员本身就带有了一个参数。

- 赋值运算符等号的重载，有时候赋值运算符希望两边类型不匹配，比如把一个int类型赋值给一个complex对象，或者把一个char*类型的字符串赋值给有一个字符串对象。这个时候就要对赋值号‘=’重载。‘=’只能重载为成员函数。

```c++
class Mstring
{
	private:
	char* str;
	Mstring():str(new char[1]){
		str[0]=0;
	}
	const char* getstr(){
		return str;
	}
	Mstring& operator=(const char* s);//返回值是对象的引用，原因后面说
	~Mstring(){
		delete [] str;
	}
}
Mstring& Mstring::operator=(const char* s){
	delete [] str;
	str=new char(strlen(s)+1);
	strcpy(str,s);
	return *this;
}
int main()
{
	Mstring s;
	s="Good Luck";
	cout<<s.getstr()<<endl;
	//Mstring s2="Hello"; 不注释会出错，因为这是初始化语句，不是赋值语句，而构造函数是无参的，编译器不知道应该怎么初始化s2。
	s = "试问天上仙人，谁敢来此人间？";
	cout<<s.getstr()<<endl;
	return 0;
}
```
  
- 关于const 关键字修饰指针：
  ![11](https://api2.mubu.com/v3/document_image/cc845cc5-a178-42e3-9eaf-004fb333288f-16175743.jpg)
  其中，
  ```c++
  int a=100;
  int const *p=&a;//这两种写法是等价的
  const int *p=&a;//

  ```

- 内联函数：在函数定义时候最前面加上inline关键字，这样就直接插入代码了。 
- 使用全局函数或者库里面的函数可以加上两个冒号，如 ::strcpy()。
- 对于静态成员使用时候必须先**初始化**，静态成员函数必须在类内声明，类外定义。
- 文件的作用域包含类的作用域包含块的作用域，判断作用域要遵循**最小作用域优先**的原则

>mutable关键字   
	mutable的中文意思是“可变的，易变的”，跟constant（既C++中的const）是反义词。
	在C++中，mutable也是为了突破const的限制而设置的。被mutable修饰的变量，将永远处于可变的状态，即使在一个const函数中。
	我们知道，如果类的成员函数不会改变对象的状态，那么这个成员函数一般会声明成const的。但是，有些时候，我们需要在const的函数里面修改一些跟类状态无关的数据成员，那么这个数据成员就应该被mutalbe来修饰。

自己实现可变长数组：

类定义：

```C++
class CArray{
	int size;//数组元素的个数
	int *ptr;//数组指针
public:
	CArray(int s=0);
	CArray(CArray &A);
	~CArray();
	int length();//返回数组长度
	void push_back(int v);
	CArray& operator=(const CArray& A );
	int& operator[](int i);
}
```

函数：

```C++

CArray::CArray(int s):size(s)
{
	if(0==s)
	ptr=NULL;
	else 
	ptr = new int [s];
}
CArray::CArray(CArray &A)
{
	if(A.ptr==null)
	{
		ptr=null;
		size=0;
		return;
	}
	ptr=new int [A.size];
	memcpy(ptr,A.ptr,sizeof(int)*a.size);
	size=a.size;
}
CArray::~CArray()
{
	if(ptr)
	delete [] ptr;
}
int CArray:: length()
{
	return size;
}
void CArray::push_back(int v)//这个函数写的相当漂亮
{
	if(ptr)//本来不是空
	{
		int *tmptr=new int [size+1];
		memcpy(tmptr,ptr,sizeof(int)*size);
		delete []ptr;
		ptr=tmptr;
	}
	else
	ptr=new int[1];
	ptr[size++]=v;//第size+1个下标是size
}
CArray& CArray::operator=(const CArray& A )
{
	if(ptr==a.ptr)
		return *this;
	if(a.ptr==NULL)
	{
		if(ptr)
		delete [] ptr;
		ptr=NULL;
		size =0;
		return *this;
	}
	if(size<A.size)//如果原有空间够大就不用分配新的空间
	{
		if(ptr)
		delete []ptr;
		ptr=new int [A.size];

	}
	memcpy(ptr,A.ptr,sizeof(int)*A.size);
	size=A.size;
	return *this;
}
//一个比较好的做法是：当只有一个元素时候，就分配比较多的（如32）个空间，然后再是64个空间，能够大大提高造作效率
//C++里面的vector就是这么做的

int& CArray::operator[](int i)
{
	return ptr[i];
}

```
C++ "=default" 关键字[这里讲的挺详细](https://www.jianshu.com/p/f964b929f2bc)

继承和派生

子类继承了父类所有的成员，但是不能访问父类	
同名的成员函数可以覆盖父类的

继承和复合关系

圆类和点类就是复合的关系，因为点是圆的固有属性
学生类和中学生类就是继承的关系，因为一个中学生可以说是一个学生。
还有一种关系叫做互相知道的关系
具体来说是这样
![知道](https://api2.mubu.com/v3/document_image/606aa7d7-cd09-4ecf-a24f-a8b55fca2c6e-16175743.jpg)



