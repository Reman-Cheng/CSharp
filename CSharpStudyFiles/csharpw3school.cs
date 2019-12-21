using System;
using System.IO;
using System.Threading;
using System.Collections;
using System.Collections.Generic;//C#泛型命名空间
using System.Text.RegularExpressions;
using System.Security.Cryptography;
// 一个 namespace 是一系列的类

  // 抽象方法和虚方法的区别

	// 虚方法必须有实现部分，抽象方法没有提供实现部分，抽象方法是一种强制派生类覆盖的方法，否则派生类将不能被实例化。
	// 抽象方法只能在抽象类中声明，虚方法不是。如果类包含抽象方法，那么该类也是抽象的，也必须声明类是抽象的。
	// 抽象方法必须在派生类中重写，这一点和接口类似，虚方法不需要再派生类中重写。
// 简单说，抽象方法是需要子类去实现的。虚方法是已经实现了的，可以被子类覆盖，也可以不覆盖，取决于需求。
// 抽象方法和虚方法都可以供派生类重写。

//     接口使用的注意事项：

// 接口方法不能用public abstract等修饰。接口内不能有字段变量，构造函数。
// 接口内可以定义属性（有get和set的方法）。如string color { get ; set ; }这种。
// 实现接口时，必须和接口的格式一致。
// 必须实现接口的所有方法。
// 接口不能包含字段、构造函数、析构函数、静态成员或常量。


namespace csharpw3school
{
	struct Books{
		private string name;
		private string title;
		private string subject;
		private int id;

		public void SetValue(string n,string t,string s,int id){
			this.name = n;
			this.title = t;
			this.subject = s;
			this.id = id;
		}
		public void Display(){
			Console.WriteLine("the name is:{0}",name);
			Console.WriteLine("the title is:{0}",title);
			Console.WriteLine("the subject is:{0}",subject);
			Console.WriteLine("the id is:{0}",id);
		}

	}
	enum Days { Sun, Mon, tue, Wed, thu, Fri, Sat };
	public delegate double MyDelegate(double a,double b);
	public delegate void MyDelegate1(double a,double b);
	delegate void NumberChanger(int n);
	class Boiler{
		private double temp;
		private double pressure;
		public Boiler(double t,double p){
			this.temp = t;
			this.pressure = p;
		}
		public Boiler(){

		}

		public double getTemp(){
			return temp;
		}
		public double getPressure(){
			return pressure;
		}

	}
	class DelegateBoilerEvent{
		public delegate void BoilerLogHandler(string status);

		//基于上面的委托定义事件
		public event BoilerLogHandler BoilerEventLog;

		public void LogProcess(){
			string remarks = "O.K";
			Boiler b = new Boiler(100.0,12.0);
			double t = b.getTemp();
			double p = b.getPressure();
			if(t>150.0 || t<80.0 || p<12 ||p>15){
				remarks = "Need Maintenance";
			}
			OnBoilerEventLog("Logging Info:\n");
			OnBoilerEventLog("Temparature "+t+"\nPressure: "+p);
			OnBoilerEventLog("\nMessage: "+remarks);
		}
		protected void OnBoilerEventLog(string message){
			if(BoilerEventLog != null){
				BoilerEventLog(message);
			}
		}
	}
	class BoilerInfoLogger{
		FileStream fs;
		StreamWriter sw;
		public BoilerInfoLogger(string filename){
			fs = new FileStream(filename,FileMode.Append,FileAccess.Write);
			sw = new StreamWriter(fs);
		}
		public void Logger(string info){
			sw.WriteLine(info);
		}
		public void Close(){
			sw.Close();
			fs.Close();
		}
	}
	class HelloWorld{
		static void Main(string[] args){
			Console.WriteLine("HelloWorld");


            //ipv4 pipei
      //       string teststr = "2.105.235.251";
      //       MatchCollection outstr = Regex.Matchs(teststr,@"^((([0-1]\d\d?|[2][0-4]\d|[2][5][0-5])\.){3}([0-1]\d\d?|[2][0-4]\d|[2][5][0-5]))$");
		    // foreach(Match os in outstr){
		    // 	Console.WriteLine(os);
		    // }
		Regentle reg1 = new Regentle();
		reg1.length = 10.5;
		reg1.width = 5.4;
		reg1.Display();    


        //C# 数据类型
    //值类型（Value types）
    //引用类型（Reference types）
    //指针类型（Pointer types）

    // 值类型变量可以直接分配给一个值。它们是从类 System.ValueType 中派生的
    Console.WriteLine("Size of int: {0}",sizeof(int));
    Console.WriteLine("Size of float: {0}",sizeof(float));
    Console.WriteLine("Size of byte: {0}",sizeof(byte));
    Console.WriteLine("Size of double: {0}",sizeof(double));


    // 内置的 引用类型有：object、dynamic 和 string

// Object 是 System.Object 类的别名

    //object 是通用的所有数据类型，可以被分配到任何其他类型(值类型、引用类型、预定义类型或用户自定义类型)
    // 但是，在分配值之前，需要先进行类型转换。
    Object obj;
    obj = 100; // 这是装箱    
    Console.WriteLine(obj);

    int val = 8;
    object obj1 = val; //. 整型数据转换为了对象类型（装箱）;
    Console.WriteLine(obj1);
    int nval = (int)obj1;//再拆箱
    Console.WriteLine(nval);


//动态（Dynamic）类型. dynamic <variable_name> = value;
    dynamic d = 10.5;
    Console.WriteLine(d);
     

//字符串（String）类型   字符串（String）类型是 System.String 类的别名
    String str1 = "w3school.cn";
    string str2 = @"c:\widows";

//用户自定义引用类型有：class、interface 或 delegate。



    //C# 类型转换

//隐式类型转换 - 这些转换是 C# 默认的以安全方式进行的转换。例如，从小的整数类型转换为大的整数类型，从派生类转换为基类
//显式类型转换 - 这些转换是通过用户使用预定义的函数显式完成的。显式转换需要强制转换运算符。
    val = (int)d;
    Console.WriteLine(val);//10.5 -> 10

    bool bool1 = true;
    Console.WriteLine(bool1.ToString());//true -> True


// 类型之间的转换方法 - Convert 和 Parse    
    string locstr = 123.ToString();

	//如果要将"locstr"转成整型数
//这些方法只是形式不一样
	//方法一: 用 Convert 
	int locali = Convert.ToInt16(locstr);
    Console.WriteLine(locali);
	//方法二: 用 Parse
	int ii = int.Parse(locstr);
    Console.WriteLine(ii);



    // C# 变量.  变量定义.  变量初始化
// ReadLine()，用于接收来自用户的输入，并把它存储到一个变量中。
// num = Convert.ToInt32(Console.ReadLine());


    // C# 常量
// 常量是使用 const 关键字来定义的
    const double pi = 3.1425926;
    double r1=6.0;
    double areaCircle = pi*r1*r1;
    Console.WriteLine("Radius: {0},Area: {1}",r1,areaCircle);


    // C# 运算符
        // 算术运算符
		// 关系运算符
		// 逻辑运算符
		// 位运算符
		// 赋值运算符
		// 杂项运算符


// 逻辑运算符    
		//  &&	 称为逻辑与运算符。如果两个操作数都非零，则条件为真。	(A && B) 为假。
		//  ||	 称为逻辑或运算符。如果两个操作数中有任意一个非零，则条件为真。	(A || B) 为真。
		//  !	 称为逻辑非运算符。用来逆转操作数的逻辑状态。如果条件为真则逻辑非运算符将使其为假。	!(A && B) 为真。
// 位运算符
        // &、 | 和 ^ 的真值表.  与 或 异或


// as强制转换，即使转换失败也不会抛出异常,返回null


    //C# 封装


// 抽象和封装是面向对象程序设计的相关特性

//Public
// Public 访问修饰符允许一个类将其成员变量和成员函数暴露给其他的函数和对象

//Private
//只有同一个类中的函数可以访问它的私有成员。即使是类的实例也不能访问它的私有成员
         RegentlePrivate regentleprivate = new RegentlePrivate(12.5,14.6);
         regentleprivate.Display();

// Protected 访问修饰符
// Protected 访问修饰符允许子类访问它的基类的成员变量和成员函数。这样有助于实现继承


// Internal 访问修饰符
// Internal 访问说明符允许一个类将其成员变量和成员函数暴露给当前程序中的其他函数和对象。
// 换句话说，带有 internal 访问修饰符的任何成员可以被定义在该成员所定义的应用程序内的任何类或方法访问。
         RegentleInternal regentleinternal = new RegentleInternal();
         regentleinternal.length = 4.5;
         regentleinternal.width =6.5;
         regentleinternal.Display();


//Protected Internal 访问修饰符
// Protected Internal 访问修饰符允许一个类将其成员变量和成员函数对同一应用程序内的子类以外的其他的类对象和函数进行隐藏,这也被用于实现继承。


 //    范围比较
 // (1) Pubilc ：任何公有成员可以被外部的类访问。
 // (2) Private ：只有同一个类中的函数可以访问它的私有成员。
 // (3) Protected ：该类内部和继承类中可以访问。
 // (4) internal : 同一个程序集的对象可以访问。
 // (5) Protected internal ：3 和 4 的并集，符合任意一条都可以访问。


    //C# 方法
    Console.WriteLine("6 的阶乘是： {0}", Factorial(6));
// 按值传递参数   实参没改变，形参改变   
    HelloWorld hellowrold = new HelloWorld();
    int a=100,b=200;
    Console.WriteLine("a: {0},b: {1} ",a,b);
    hellowrold.swap(a,b);
    Console.WriteLine("a: {0},b: {1} ",a,b);

// 按引用传递参数.   使用 ref 关键字声明引用参数
    a=100;b=200;
    Console.WriteLine("a: {0},b: {1} ",a,b);
    hellowrold.swapref(ref a,ref b);
    Console.WriteLine("a: {0},b: {1} ",a,b);//改变了实参的值

// 按输出传递参数.  可以使用 输出参数 来从函数中返回两个值。输出参数会把方法输出的数据赋给自己，其他方面与引用参数相似
    int outa,outb;
    // 提供给输出参数的变量不需要赋值。当需要从一个参数没有指定初始值的方法中返回值时，输出参数特别有用
    hellowrold.getValue(out outa,out outb);
    Console.WriteLine("befor call function,after outa is: {0}  outb is:{1}", outa,outb);

//
    //C# 可空类型（Nullable）说明
    int? num1 = null;
    int? num2 = 45;
    double? num3 = new double();//默认 0
    double? num4 = 3.14159;
    bool? boolval = new bool?();
    bool? boolval2 = new bool();//默认False
    Console.WriteLine("{0} {1} {2} {3} {4} {5}",num1,num2,num3,num4,boolval,boolval2);


// Null 合并运算符（ ?? ）    
    double numnull;
    numnull = num1 ?? 5.34;//如果第一个操作数的值为 null，则运算符返回第二个操作数的值，否则返回第一个操作数的值
    Console.WriteLine(numnull);
    numnull = num2 ?? 5.34;
    Console.WriteLine(numnull);


    // C# 数组（Array）声明与使用
    double[] arrArray1 = {13.5,66.7,76.5};//第一种声明方法
    int[] arrArray2 = new int[10];//第二种声明方法,要定义一个初使长度
    int[] arrArray3 = new int [] {7,6,44,78,90};//第三种声明方法


    int[] arrArraytest = new int[10];
    for (int iarr=0;iarr<10;iarr++){
    	arrArraytest[iarr] = 100 + iarr;
    }
    int j=0;
    foreach(int temp in arrArraytest){
    	
    	Console.WriteLine("element[{0}]: {1}",j,temp);
    	j=j+1;
    }


// C# 多维数组
    int [,] arrArrayerwei = new int[3,4];
    for(int i=0;i<3;i++){
    	for(j=0;j<4;j++){
    		arrArrayerwei[i,j] = i*j+j;
    		Console.WriteLine("arrArrayerwei[{0},{1}]: {2}",i,j,arrArrayerwei[i,j]);
    	}
    }
    
    string [,,] arrArraysanwei = new string[2,2,2];
    for (int i=0;i<2;i++){
    	for(j=0;j<2;j++){
    		for(int k=0;k<2;k++){
    			arrArraysanwei[i,j,k] = " "+i+j+k+" ";
    			Console.WriteLine("arrArraysanwei[{0},{1},{2}]: {3}",i,j,k,arrArraysanwei[i,j,k]);
    		}
    	}
    }

// C# 交错数组  为了长短不齐的数组
// int[][] scores = new int[2][]{new int[]{92,93,94},new int[]{85,66,87,88}};
    int[][,] arrArrayjiaocuo = new int[5][,];
    for(int i=0;i<5;i++){
           arrArrayjiaocuo[i] = new int[3,2];//次级数组要初使化
    	for(j=0;j<3;j++){
    		for(int k =0;k<2;k++){
    			arrArrayjiaocuo[i][j,k] = i+j+k;
                Console.WriteLine("arrArrayjiaocuo[{0}][{1},{2}]: {3}",i,j,k,arrArrayjiaocuo[i][j,k]);
    		}          
    	}
    }

// C# 传递数组给函数
    MyArray myarray = new MyArray();
    int[] intmyarray = new int[]{100,44,66,77,334,56};
    num3 = myarray.getAverage(intmyarray);
    Console.WriteLine("the average is: {0}",num3);


// C# 参数数组.   参数数组通常用于传递未知数量的参数给函数  传人的参数前加 params
    num1 = myarray.getSum(100,200,300,400);
    Console.WriteLine("the sum is: {0}",num1);

    Console.WriteLine("--------------------Array-----------------");
// C# Array 类.    Array 类是 C# 中所有数组的基类
    Array.Reverse(intmyarray);
    foreach(var temp in intmyarray){
    	Console.WriteLine(temp);
    }
    Console.WriteLine("Sort after");
    Array.Sort(intmyarray);
    foreach(var temp in intmyarray){
    	Console.WriteLine(temp);
    }


// C# 字符串（String）使用教程
    string[] sarray = {"hello","from","tutorials","point"};//string 是类型类似int
    string message = String.Join(" ",sarray);//合并成一个string，并以空格分开 String是一个系统类
    Console.WriteLine("Message: {0}",message);
 
    DateTime waiting = new DateTime(2019, 06, 19, 14, 09, 45);
    string chat1 = String.Format("Message sent at {0:t} on {0:D}", waiting);
    Console.WriteLine("Message: {0}", chat1);


// String 类的方法
    //Compare比较  Concat连接  Contains包含. Copy. Equals  IndexOf. Insert IsNullOrEmpty  Join  
    //Remove  Replace. Split. Trim
    string substr = "let me to find the recored";
    string outsubstr = substr.Substring(2,3);
    Console.WriteLine("the outsubstr is: {0}",outsubstr);
    string outsubstr1 = substr.Replace("r","9");
    Console.WriteLine("the outsubstr is: {0}",outsubstr1);

    // C# 结构（Struct）
    
// 结构可带有方法、字段、索引、属性、运算符方法和事件
    // 类是引用类型，结构是值类型
	// 结构不支持继承
	// 结构不能声明默认的构造函数
    Books book1 = new Books();
    book1.SetValue("find","to finding some thing","math",11);
    book1.Display();
    Console.WriteLine("-----=======-------");
    Books book2 = new Books();
    book2.SetValue("flowinyouheart","music beautiful","music",11);
    book2.Display();
    Console.WriteLine("-----=======-------");


    var enum1 = Days.Mon;
    Console.WriteLine("Monday: {0}",enum1);
    int WeekdayEnd = (int)Days.Fri;
    Console.WriteLine("Friday: {0}", WeekdayEnd);
    Console.WriteLine("-----===eunm end====-------");


    //C# 类（Class）. 类的默认访问标识符是 internal. 成员的默认访问标识符是 private
    Box box1 = new Box(2,3,4);
    box1.Display();


// C# 类的静态成员
	// 关键字 static 意味着类中只有一个该成员的实例。
	// 静态变量用于定义常量，因为它们的值可以通过直接调用类而不需要创建类的实例来获取。
	// 静态变量可在成员函数或类的定义外部进行初始化。您也可以在类的定义内部初始化静态变量。

    // 也可以把一个成员函数声明为 static。这样的函数只能访问静态变量。静态函数在对象被创建之前就已经存在
    StaticVar static1 = new StaticVar();
    StaticVar static2 = new StaticVar();
    static1.Count();
    static2.Count();
    Console.WriteLine("the static1 value is: {0}",static1.getNum());
    Console.WriteLine("the static2 value is: {0}",static2.getNum());
    Console.WriteLine("the static value is: {0}",StaticVar.getNum2());//静态函数要直接通过类名调用


// C# 继承
    Console.WriteLine("----jicheng----");
    Tabletop tabletop1 = new Tabletop(10.6,3.8);
    tabletop1.Display();


// C# 不支持多重继承。但是，您可以使用接口来实现多重继承
    Console.WriteLine("----duochong----");
    DuoChong douchong = new DuoChong(2.5,6.8);
    douchong.Display();


//C# 多态性
    // 静态多态性
    // 1.函数重载
    // 2.运算符重载
// 可以是参数列表中的参数类型不同，也可以是参数个数不同。不能重载只有返回类型不同的函数声明
    PrintData pd = new PrintData();
    pd.print("to find the program in the code");
    pd.print(1);
    print("how is possibly");
    print(34.566);


    // 动态多态性.   动态多态性是通过 抽象类 和 虚方法 实现的

    // 抽象方法是一种强制派生类覆盖的方法，否则派生类将不能被实例化
// 您不能创建一个抽象类的实例。
// 您不能在一个抽象类外部声明一个抽象方法
// 通过在类定义前面放置关键字 sealed，可以将类声明为密封类。当一个类被声明为 sealed 时，它不能被继承。抽象类不能被声明为 sealed。
    
    RegentleAbstract regentleabstract1 = new RegentleAbstract(10.6,4.8);
    Console.WriteLine(regentleabstract1.GetArea());

// 虚方法 和 重载虚方法
    RegentleVirtual regentlevirtual = new RegentleVirtual(10.5,5.5);
    double regentlevirtualarea = regentlevirtual.GetArea();
    Console.WriteLine(regentlevirtualarea);
    TriangleVirtual trianglevirtual = new TriangleVirtual(12.6,6.8);
    double trianglevirtualarea = trianglevirtual.GetArea();
    Console.WriteLine(trianglevirtualarea);

   
    //C# 运算符重载    可以重定义或重载 C# 中内置的运算符
    Box boxtest1 = new Box(2.2,4.4,6.6);
    Box boxtest2 = new Box(2.2,4.4,6.6);
    Box boxtest3 = new Box();

    boxtest3 = boxtest1 + boxtest2;
    boxtest1.Display();
    boxtest2.Display();
    boxtest3.Display();
    Console.WriteLine(boxtest1 == boxtest2);
    Console.WriteLine(boxtest1 != boxtest2);
    Console.WriteLine(boxtest1 <= boxtest2);
    Console.WriteLine(boxtest1 >= boxtest2);


    //C# 接口（Interface）. 接口定义了所有类继承接口时应遵循的语法合同
// 接口定义了属性、方法和事件
    Transaction transaction1 = new Transaction("089","2019","456");
    Transaction transaction2 = new Transaction("014","2019","findto");
    transaction1.showTransactionJ();
    transaction2.showTransactionJ();
    Console.WriteLine("----Interface----");

    //C# 预处理器指令
    #define PI

    // C# 正则表达式
    string zhengzetest1 = "1851 1999 1950 1905 2003";
    MatchCollection matchzhengzetest1 = Regex.Matches(zhengzetest1,@"(?<=19)\d{2}\b");
    foreach(Match temp in matchzhengzetest1){
    	Console.WriteLine("the Regex value is: {0}",temp);
    }
    string zhengzetestReplace = zhengzetest1.Replace(" ","A");//这样进行替换
    Console.WriteLine("the Replace sting after is: {0}",zhengzetestReplace);

    string input = "Hello   World   ";
    string pattern = "\\s+";
    string replacement = " ";
    Regex rgx = new Regex(pattern);
    Console.WriteLine("the rgx is: {0}",rgx);
    string result = rgx.Replace(input, replacement);//另一种替换
    Console.WriteLine("Replacement String: {0}", result);  
    

    // C# 异常处理


    //文件的输入与输出
    FileStream filestream1 = new FileStream("/Users/swqt/Desktop/names.txt",
    	FileMode.OpenOrCreate,FileAccess.ReadWrite,FileShare.ReadWrite);
    for(int i =0;i<=100;i++){
    	filestream1.WriteByte((byte)i);//16进制的字节流形式
    }
    filestream1.Position = 0;
    for(int i =0;i<=100;i++){
    	Console.Write(filestream1.ReadByte()+" ");//读出来的显示成10进制形式
    }
    filestream1.Close();
    Console.WriteLine("----shurushuchu end----");


// C# 文本文件的读写   
    // StreamReader 和 StreamWriter 类用于文本文件的数据读写
    
    string[] jamaica = new string[]{
    	"Down the way where the nights are gay",
    	"And the sun shines daily on the mountain top",
    	"I took a trip on a sailing ship",
    	"And when I reached Jamaica",
    	"I made a stop"
    };
    using(StreamWriter streamwriter1 = new StreamWriter("/Users/swqt/Desktop/jamaica.txt")){
	    foreach(var temp in jamaica){
	    	streamwriter1.WriteLine(temp);
	    	Console.WriteLine("ok");
	    }
    }
    string streamreaderline = "";
    using(StreamReader streamreader1 = new StreamReader("/Users/swqt/Desktop/jamaica.txt")){
	    while((streamreaderline = streamreader1.ReadLine())!= null){
	    	Console.WriteLine(streamreaderline);
	    }
    }
    
  
//C# 二进制文件的读写
    // BinaryWriter bw1 = new BinaryWriter(new FileStream("/Users/swqt/Desktop/message.txt",FileMode.Open))
    // bw1.Write(25);bw1.Write(3.14);bw1.Write("hello");
    // bw1.Close();


// C# Windows 文件系统的操作
    // 创建一个 DirectoryInfo 对象
    DirectoryInfo mydir = new DirectoryInfo(@"/Users/swqt/Desktop");

    // 获取目录中的文件以及它们的名称和大小
    FileInfo[] f = mydir.GetFiles();
    foreach (FileInfo file in f)
    {
        Console.WriteLine("File Name: {0} Size: {1}",
            file.Name, file.Length);
    }


    Console.WriteLine("----Attribute----");
    // C# 特性（Attribute）
//特性（Attribute）是用于在运行时传递程序中各种元素（比如类、方法、结构、枚举、组件等）的行为信息的声明性标签

    // 预定义特性（Attribute）
     // Net 框架提供了三种预定义特性：
     // 1.AttributeUsage
	 // 2.Conditional
	 // 3.Obsolete
	OldMethod();

//反射（Reflection）指程序可以访问、检测和修改它本身状态或行为的一种能力。
    System.Reflection.MemberInfo info = typeof(MyClass);
    object[] attributes = info.GetCustomAttributes(true);
    for(int i=0;i<attributes.Length;i++){
    	Console.WriteLine(attributes[i]);//会显示附加到类 MyClass 上的自定义特性
    }
 

    Regentle regentleattribute = new Regentle(10.6,4.6);
    regentleattribute.Display();
    Type typeregentle = typeof(Regentle);
    // 遍历 Rectangle 类的特性
    foreach(Object attribute2 in typeregentle.GetCustomAttributes(false)){
    	DeBugInfo dbi = (DeBugInfo)attribute2;
    	if(null != dbi){
    	   Console.WriteLine("Bug no: {0}", dbi.BugNo);
           Console.WriteLine("Developer: {0}", dbi.Developer);
           Console.WriteLine("Last Reviewed: {0}",dbi.LastReview);
           Console.WriteLine("Remarks: {0}", dbi.Message);
    	}
    }
    // 遍历方法特性
    foreach (var m in typeregentle.GetMethods())
         {
            foreach (Attribute aattribute1 in m.GetCustomAttributes(true))
            {
               DeBugInfo dbi = (DeBugInfo)aattribute1;
               if (null != dbi)
               {
                  Console.WriteLine("Bug no: {0}, for Method: {1}",
                                                dbi.BugNo, m.Name);
                  Console.WriteLine("Developer: {0}", dbi.Developer);
                  Console.WriteLine("Last Reviewed: {0}",
                                                dbi.LastReview);
                  Console.WriteLine("Remarks: {0}", dbi.Message);
               }
            }
         }


    // C# 属性（Property）
// 访问器（Accessors） get{} set{}
    Student stu1 = new Student();
    stu1.Code = "100";
    stu1.Name = "Zara";
    stu1.Age = 23;
    stu1.Display();
    stu1.Age = stu1.Age + 1;
    stu1.Display();


// 抽象属性（Abstract Properties）. 抽象类可拥有抽象属性，这些属性应在派生类中被实现
    

// C# 索引器（Indexer）


// C# 委托. 访问非静态成员需要对象引用
      MyDelegate mydelegate1 = Add;
      MyDelegate mydelegate2 = new MyDelegate(Maltp);
      double myrec1 = mydelegate1(3.4,5.6);
      Console.WriteLine("the value is: {0}",myrec1);
      Console.WriteLine(mydelegate2(3.4,5.6));



    // C# 事件（Event）
// 发布器（publisher） 是一个包含事件和委托定义的对象
// 订阅器（subscriber） 是一个接受事件并提供事件处理程序的对象
BoilerInfoLogger filelog = new BoilerInfoLogger("/Users/swqt/Desktop/boiler.txt");
DelegateBoilerEvent boilerEvent = new DelegateBoilerEvent();
boilerEvent.BoilerEventLog += new DelegateBoilerEvent.BoilerLogHandler(Logger);
boilerEvent.BoilerEventLog += new DelegateBoilerEvent.BoilerLogHandler(filelog.Logger);
boilerEvent.LogProcess();
filelog.Close();


// C# 动态数组（ArrayList）

// C# 哈希表（Hashtable)

// C# 排序列表（SortedList）.  排序列表是数组和哈希表的组合
     SortedList sl = new SortedList();
     sl.Add("001", "Zara Ali");
     sl.Add("002", "Abida Rehman");
     sl.Add("003", "Joe Holzner");
     sl.Add("004", "Mausam Benazir Nur");
     sl.Add("005", "M. Amlan");
     sl.Add("006", "M. Arif");
     sl.Add("007", "Ritesh Saikia");

     if (sl.ContainsValue("Nuha Ali"))
     {
        Console.WriteLine("This student name is already in the list");
     }
     else
     {
        sl.Add("008", "Nuha Ali");
     }
     ICollection key = sl.Keys;
     foreach(var temp in key){
     	Console.WriteLine(temp+" : "+sl[temp]);
     }


Console.WriteLine();
// C# 堆栈（Stack）
     Stack stack1 = new Stack();
     stack1.Push("M");
     stack1.Push("O");
     stack1.Push("V");
     stack1.Push("E");
     Console.WriteLine("return the Stack value: ");
     Console.WriteLine("the top value is: {0}",stack1.Peek());
     foreach(var temp in stack1){
     	Console.WriteLine(temp);
     }
     stack1.Pop();
     stack1.Pop();
     Console.WriteLine("Pop after the Stack value: ");
     foreach(var temp in stack1){
     	Console.WriteLine(temp);
     }


// C# 队列（Queue）
     Queue queue1 = new Queue();
     queue1.Enqueue("K");
     queue1.Enqueue("I");
     queue1.Enqueue("N");
     queue1.Enqueue("G");
     Console.WriteLine("the queue1 value is: ");
     foreach(var temp in queue1){
     	Console.WriteLine(temp);
     }
     var dequeue1 = queue1.Dequeue();
     Console.WriteLine(dequeue1);
     Console.WriteLine("the queue1 remain value is: ");
     foreach(var temp in queue1){
     	Console.WriteLine(temp);
     }

// C# 点阵列（BitArray）


    //C# 泛型（Generic）
    MyGenericArray<string> genericarray1 = new MyGenericArray<string>(10);
    genericarray1.SetValue(0,"finding");
    Console.WriteLine("the value is: {0}",genericarray1.GetValue(0));
    for(int i=0;i<10;i++){
    	genericarray1.SetValue(i,"finding"+i);
    }
    for(int i=0;i<10;i++){
    	Console.WriteLine("the value is: {0}",genericarray1.GetValue(i));
    }


// 泛型（Generic）方法
    string swapstr1 = "king";
    string swapstr2 = "queen";
    Swap<string>(ref swapstr1,ref swapstr2);
    Console.WriteLine("the left value is:{0} the right value is:{1}",swapstr1,swapstr2);
    // string returnstr1 = "value";
    // int returnint1 = 15;
    // string returnstr2 = ReturnStr<string,int>(returnstr1,returnint1);
    // Console.WriteLine(returnstr2);


// C# 匿名方法
    //不能事先定义num5 和 num6. 这种匿名方法的方法在Main中，所传参数会和Main中其他参数起冲突
    MyDelegate1 mydelegate3 = delegate(double num5,double num6){
    	Console.WriteLine("the a is:{0},the b is:{1}",num5,num6);
    	// return num5+num6;
    };
    mydelegate3(56.22,11.33);
    NumberChanger numberchanger1 = delegate(int x){
    	Console.WriteLine("the numberchanger value is:{0}",x);
    };
    numberchanger1(10);

// 阶乘
    int jiecheng1 = jiecheng(5);
    Console.WriteLine("the jiecheng value is:{0}",jiecheng1);
// C#四舍五入的几种方法
    double dValue = 14.8756;
    Console.WriteLine(Math.Round(dValue,2));
    Console.WriteLine(dValue.ToString("f1"));
    Console.WriteLine(dValue.ToString("#0.000"));//小数点后有几个0就保留几位
    Console.WriteLine(String.Format("{0:N1}",dValue));
    Console.WriteLine(String.Format("{0:N2}",dValue));
    Console.WriteLine(String.Format("{0:N3}",dValue));
    Console.WriteLine(String.Format("{0:N4}",dValue));


// C#随机数生成方法
    // 1、使用Random 类
    Console.WriteLine("----Random1----");
    for(int i=0;i<20;i++){
    	Random random1 = new Random();//Random循环只适用于要求比较低的情况
    	Console.WriteLine(random1.Next(1,100));}//高并发的情况下,Random类所取到的系统时钟种子接近甚至完全一样
    Console.WriteLine("----Random2----");
    Random random2 = new Random();
    for(int i=0;i<20;i++){
    	//Random循环只适用于要求比较低的情况
    	Console.WriteLine(random2.Next(1,100));}
    //2、使用Guid 类. GUID (Globally Unique Identifier) 全球唯一标识符
    for(int i=0;i<10;i++){
    	Console.WriteLine(Guid.NewGuid());}
 // var uuid = Guid.NewGuid().ToString(); // 9af7f46a-ea52-4aa3-b8c3-9fd484c2af12
 // var uuidN = Guid.NewGuid().ToString("N"); //硬件的ID码 e0a953c3ee6040eaa9fae2b667060e09 
 // var uuidD = Guid.NewGuid().ToString("D"); // 9af7f46a-ea52-4aa3-b8c3-9fd484c2af12
 // var uuidB = Guid.NewGuid().ToString("B"); // {734fd453-a4f8-4c5d-9c98-3fe2d7079760}
 // var uuidP = Guid.NewGuid().ToString("P"); //  (ade24d16-db0f-40af-8794-1e08e2040df3)
 // var uuidX = Guid.NewGuid().ToString("X"); // {0x3fa412e3,0x8356,0x428f,{0xaa,0x34,0xb7,0x40,0xda,0xaf,0x45,0x6f}}

     //3.使用RNGCryptoServiceProvider 类
     // RNGCryptoServiceProvider 使用加密服务提供程序 (CSP) 提供的实现来实现加密随机数生成器 (RNG)
    Console.WriteLine("----RNGCryptoServiceProvider----");
    	for(int i=0;i<10;i++){
    		RNGCryptoServiceProvider csp = new RNGCryptoServiceProvider();
            byte[] byteCsp = new byte[10];
            csp.GetBytes(byteCsp);
            Console.WriteLine(BitConverter.ToString(byteCsp));
    	}
    	// 但是RNGCryptoServiceProvider的计算较为繁琐,在循环中使用会消耗造成大量的系统资源开销,使用时需注意


// C# Dictionary的用法
// 1、从一组键（Key）到一组值（Value）的映射，每一个添加项都是由一个值及其相关连的键组成

// 2、任何键都必须是唯一的

// 3、键不能为空引用null（VB中的Nothing），若值为引用类型，则可以为空值

// 4、Key和Value可以是任何类型（string，int，custom class 等）
    Dictionary<int,string> myDictionary = new Dictionary<int,string>();
    myDictionary.Add(1,"sam");
    myDictionary.Add(2,"tom");
    myDictionary.Add(3,"rem");
    myDictionary.Add(4,"kim");
    myDictionary.Add(5,"fim");

    if(myDictionary.ContainsKey(1)){
    	Console.WriteLine("Key:{0},Value:{1}","1",myDictionary[1]);
    }
    foreach(KeyValuePair<int,string> kvp in myDictionary){
    	Console.WriteLine("Key = {0}, Value = {1}",kvp.Key,kvp.Value);
    }
    Dictionary<int,string>.KeyCollection keycol = myDictionary.Keys;
    foreach(var temp in keycol){
    	Console.WriteLine("Key = {0}",temp);
    }
    // 通过Remove方法移除指定的键值.  myDictionary.Remove(1);

// Convert.ToInt32(input);


// 一列数的规则如下: 1、1、2、3、5、8、13、21、34...... 求第30位数是多少，用递归算法实现
Console.WriteLine(FeiBoNaQie(30));

// 请编程实现一个冒泡排序算法
	int[] maopao = new int[]{14,55,66,3,45,65,91,18,23};
	for (int i=0;i<maopao.Length;i++){
		for (j=0;j<maopao.Length-i;j++){
			if (maopao[j]>maopao[maopao.Length-i-1]){
				int temp;
				temp = maopao[j];
				maopao[j] = maopao[maopao.Length-i-1];
				maopao[maopao.Length-i-1] = temp;
			}
	    }
	}
	foreach(var temp in maopao){
		Console.WriteLine(temp);
	}


// Params只能用来修饰一维数组


//C＃泛型约束




















	}
	public static int FeiBoNaQie(int number){
		int result;
	    if(number ==1 || number ==2){
		    result = 1;
		}
		else
		{
		    result = FeiBoNaQie(number-1)+FeiBoNaQie(number-2);
		}
	    return result;
	}
    public static int jiecheng(int number){
    	int result;
    	if(number == 0){
    		result = 1;
    	}else{
    		result = number * jiecheng(number - 1);
    	}
    	return result;
    }
	public static void Swap<T>(ref T l,ref T r){
           T temp;
           temp = l;
           l = r;
           r = temp;
	}
	// public static string ReturnStr<T,T>(T l,T r){

 //           return l+r;
	// }
	public static void Logger(string info){
		Console.WriteLine(info);
	}
	public static double Add(double a,double b){
		return a+b;
	}
	public static double Maltp(double a,double b){
		return a*b;
	}
    
	// [Obsolete("Don't use OldMethod, use NewMethod instead",true)]
	static void OldMethod()
    { 
        Console.WriteLine("It is the old method");
    }
    static void NewMethod()
    { 
        Console.WriteLine("It is the new method"); 
    }
		static public void print(int i){
            Console.WriteLine(i);
		}
		static public void print(double i){
            Console.WriteLine(i);
		}
		static public void print(string i){
            Console.WriteLine(i);
		}
		static public void Hello(){
			Console.WriteLine("Hello");
		}
        static public int Factorial(int num){
        	int result;
        	if(num == 1){
        		return 1;
        	}else{
        		result = Factorial(num - 1)*num;
        		return result;
        	}
        }
        public void swap(int x,int y){
        	int temp;
        	temp = x;
        	x=y;
        	y=temp;
        }
        public void swapref(ref int x,ref int y){
        	int temp;
        	temp = x;
        	x=y;
        	y=temp;
        }
        public void getValue(out int x,out int y){
        	int temp = 5;
        	x = temp;
        	y = temp + 4;
        }



	}
	public class MyGenericArray<T>{
		private T[] array;
		public MyGenericArray(int size){
               array = new T[size];
		}
		public T GetValue(int index){
			return array[index];
		}
		public void SetValue(int index,T value){
            array[index]=value;
		}
	}
	abstract class Person{
		public abstract string Code{set;get;}
		public abstract string Name{set;get;}
		public abstract int Age{set;get;}
	}
	class Student:Person{
		private string code;
		private string name;
		private int age;
		public override string Code{
			// set;get;//这种默认的情况，不会产生实际效果,string 下默认为null
			set{code = value;}
			get{return code;}
		}
		public override string Name{
			set;get;
		} 
		public override int Age{
			set;get;//这种默认的情况，不会产生实际效果,int 下默认为0
		}
		public void Display(){
			Console.WriteLine("Student Info: Code = {0},Name = {1},Age = {2}",code,name,age);
		}
	}
	[AttributeUsage(AttributeTargets.All)]
	class HelpAttribute:Attribute{
		public readonly string Url;
		private string topic;
		public string Topic{set;get;}
		public HelpAttribute(string url){ // url 是一个定位（positional）参数
			this.Url = url;
		}
	}
	[HelpAttribute("Information on the class MyClass")]
	class MyClass{

	}
	[AttributeUsage(AttributeTargets.Class |
	AttributeTargets.Constructor |
	AttributeTargets.Field |
	AttributeTargets.Method |
	AttributeTargets.Property,
	AllowMultiple = true)]
	public class DeBugInfo:System.Attribute{
		private int bugno;
		private string developer;
		private string lastreview;
		public string message;
		public DeBugInfo(int b,string d,string l){
			this.bugno = b;
			this.developer = d;
			this.lastreview = l;
		}
		public int BugNo{
			get{return bugno;}
		}
		public string Developer{
			get{return developer;}
		}
		public string LastReview{
			get{return lastreview;}
		}
		public string Message{
			set{message = value;}get{return message;}
		}
	}
	// 接口声明默认是 public 的
	public interface ITransactions{
		//接口成员
		void showTransactionJ();
		string GetAmount();
	}
	class Transaction:ITransactions{
		private string tCode;
		private string date;
		private string amount;
		public Transaction(string c,string d,string a){
              this.tCode = c;
              this.date = d;
              this.amount = a;
		}
		public Transaction(){
			this.tCode = "";
			this.date = "";
			this.amount = "";
		}
		public string GetAmount(){//不用override
			return amount;
		}
		public void showTransactionJ(){
			Console.WriteLine("the tCode value is: {0}",tCode);
			Console.WriteLine("the date value is: {0}",date);
			Console.WriteLine("teh amount value is: {0}",amount);
		}
	}
	class Shapevirtual{
		protected double width,height;
		public Shapevirtual(double w,double h){
			this.width = w;
			this.height = h;
		}
		public virtual double GetArea(){
			Console.WriteLine("father area is: ");
			return 0;
		}
	}
	class RegentleVirtual:Shapevirtual{
		public RegentleVirtual(double w,double h):base(w,h){

		}
		public override double GetArea(){
			Console.WriteLine("RegentleVirtual area is: ");
			return width*height;
		}
	}
	class TriangleVirtual:Shapevirtual{
		public TriangleVirtual(double w,double h):base(w,h){

		}
		public override double GetArea(){
			Console.WriteLine("TriangleVirtual area is: ");
			return (width*height)/2;
		}
	}
	abstract class Shape{
		abstract public double GetArea();//abstract 抽象类中不具体实现
	}
	class RegentleAbstract:Shape{
		private double length;
		private double width;
		public RegentleAbstract(double l,double w){
			this.length = l;
			this.width = w;
		}
		public override double GetArea(){//重载此方法进行方法的实现
			return length*width;
		}
	}
	class PrintData{
		public void print(int i){//默认为private 无法被对象访问
			Console.WriteLine(i);
		}
		public void print(double i){
			Console.WriteLine(i);
		}
		public void print(string i){
			Console.WriteLine(i);
		}
		// void print(string i,params var[]){
		// 	Console.WriteLine(i,)
		// }
	}
	//....Regentle....//
	[DeBugInfo(45,"Zara Ali","12/8/2012",Message = "Return type mismatch")]
	[DeBugInfo(49,"Nuha Ali","10/10/2012",Message = "Unused variable")]
    class Regentle{
    	public double length;
    	public double width;
    	public Regentle(double l,double w){
    		this.length = l;
    		this.width = w;
    	}
    	public Regentle(){

    	}
    	[DeBugInfo(55,"Zara Ali","19/10/2012",Message = "Return type mismatch")]
    	public double GetArea(){
    		return length*width;
    	} 
    	[DeBugInfo(56,"Zara Ali","19/10/2012")]
    	public void Display(){
    		Console.WriteLine("the length is: {0}",length);
    		Console.WriteLine("the width is: {0}",width);
    		Console.WriteLine("the area is: {0}",GetArea());
    	}
    }
    class RegentleProtected{
    	protected double length;
    	protected double width;
    	public RegentleProtected(double l,double w){
    		this.length = l;
    		this.width = w;
    	}
    	public double GetArea(){
    		return length*width;
    	} 
    	public void Display(){
    		Console.WriteLine("the length is: {0}",length);
    		Console.WriteLine("the width is: {0}",width);
    		Console.WriteLine("the area is: {0}",GetArea());
    	}
    }
    class Tabletop:RegentleProtected{
        private double cost;
        public Tabletop(double l,double w):base(l,w){
    		
    	}
    	public double GetCost(){
    		return GetArea()*0.7;
    	}
    	public void Display(){
    		base.Display();
    		Console.WriteLine("the cost is: {0}",GetCost());
    	}
    }
    public interface PainCost{
    	double GetCost();//接口中只定义方法不具体实现
    }
    class DuoChong:RegentleProtected,PainCost{
    	public DuoChong(double l,double w):base(l,w){
    		
    	}
    	public double GetCost(){
    		return GetArea()*0.7;
    	}
    	public void Display(){
    		base.Display();
    		Console.WriteLine("the cost is: {0}",GetCost());
    	}

    }
    class RegentlePrivate{
    	private double length;
    	private double width;
    	public RegentlePrivate(double l,double w){//构造函数的名称与类的名称完全相同，它没有任何返回类型
    		this.length = l;
    		this.width = w;
    	}
    	public double GetArea(){
    		return length*width;
    	} 
    	public void Display(){
    		Console.WriteLine("the length is: {0}",length);
    		Console.WriteLine("the width is: {0}",width);
    		Console.WriteLine("the area is: {0}",GetArea());
    	}
    }
    class RegentleInternal{
    	internal double length;
    	internal double width;
    	
    	public double GetArea(){
    		return length*width;
    	} 
    	public void Display(){
    		Console.WriteLine("the length is: {0}",length);
    		Console.WriteLine("the width is: {0}",width);
    		Console.WriteLine("the area is: {0}",GetArea());
    	}
    }
    class MyArray{
    	public double getAverage(int[] arr){//如果不定义默认为private 方法，无法被外界访问
    		double avg;
    		int sum =0;
    		for(int i =0;i<arr.Length;i++){
    			sum = sum + arr[i];
    		}
    		avg = (double)sum/arr.Length;
    		return avg;
    	}
    	public int getSum(params int[]arr){
    		int sum=0;
    		foreach(var temp in arr){
    			sum = sum + temp;
    		}
    		return sum;
    	}
    }
    class Box{
    	private double length;
    	private double width;
    	private double height;

    	public Box(double l,double w,double h){
               this.length = l;
               this.width = w;
               this.height = h;
    	}
    	public Box(){}
    	public double GetArea(){
    		double area = length*width*2+length*height*2+width*height*2;
    		return area;
    	}
    	public double GetVolum(){
    		return length*width*height;
    	}
    	public void Display(){
    		Console.WriteLine("the box area is: {0}",GetArea());
    		Console.WriteLine("the box volum is: {0}",GetVolum());
    	}
    	~Box(){//析构函数用于在结束程序之前释放资源。析构函数不能继承或重载
    		Console.WriteLine("object is deleted!");
    	}
    	public static Box operator +(Box a,Box b){
               Box box = new Box();
               box.length = a.length + b.length;
               box.width = a.width + b.width;
               box.height = a.height + b.height;
               return box;
    	}
    	public static bool operator ==(Box a ,Box b){
               bool bool1 = false;
               if((a.length == b.length)&&(b.width == a.width)&&(a.height == b.height)){
               	return true;
               }
               return bool1;
    	}
    	public static bool operator !=(Box a ,Box b){
               bool bool1 = false;
               if((a.length != b.length)||(b.width != a.width)||(a.height != b.height)){
               	return true;
               }
               return bool1;
    	}
    	public static bool operator <=(Box a ,Box b){
               bool bool1 = false;
               if((a.length <= b.length)&&(b.width <= a.width)&(a.height <= b.height)){
               	return true;
               }
               return bool1;
    	}
    	public static bool operator >=(Box a ,Box b){
               bool bool1 = false;
               if((a.length >= b.length)&&(b.width >= a.width)&(a.height >= b.height)){
               	return true;
               }
               return bool1;
    	}

    }
    class StaticVar{
    	public static int num=0;
    	public void Count(){
    		num++;
    	}
    	public int getNum(){
    		return num;
    	}
    	public static int getNum2(){
    		return num;
    	}
    }





















}