using System;
using System.Text.RegularExpressions;
using System.IO;
using System.Collections;
using System.Threading;
//编译 mcs /Users/swqt/Desktop/obj-c/csharp/csharpstudy1.cs
//执行 mono /Users/swqt/Desktop/obj-c/csharp/csharpstudy1.exe


struct Books{ //jiegouti
    private string title;
    private string author;
    private string subject;
    private int book_id;

    public void getValues(string t,string a,string s,int id){
        this.title = t;
        this.author = a;
        this.subject = s;
        this.book_id = id;
    }
    public void Display(){
        Console.WriteLine("Title : {0}",title);
        Console.WriteLine("Author : {0}", author);
        Console.WriteLine("Subject : {0}", subject);
        Console.WriteLine("Book_id :{0}", book_id);
    }
}
struct Anaimal{
    private string name;
    private string color;
    private string action;
    private int age;

    //构造函数. 必须为结构体所有字段赋值
    public Anaimal(string n, string c, string a,int age){
        this.name = n;
        this.color = c;
        this.action = a;
        this.age = age;
    }
    public void Display(){
        Console.WriteLine("Name : {0}",name);
        Console.WriteLine("Color : {0}", color);
        Console.WriteLine("Action : {0}", action);
        Console.WriteLine("Age :{0}", age);
    }
}
namespace csharpstudy1{
    public delegate int MyDelegate(string s);
    public delegate int NUmberChanger(int n);
    public delegate T NumberChanger<T>(T n);
    public delegate int NumberChanger1(int n);
public class HelloWorld
{
    //枚举
    enum Day {sun,mon,tue,wed,thu,fri,sat};
    
    static int MyDelegate(string s){
        Console.WriteLine(s);
        return 10;
    }
    static public void Main ()
    {
        Console.WriteLine ("Hello Mono World");

        float length = 4.5f;
        float width = 3.5f;
        Console.WriteLine("getArea: {0}",length*width);
        Console.WriteLine(sizeof(int));

// 隐式类型转换 - 这些转换是 C# 默认的以安全方式进行的转换, 不会导致数据丢失。例如，从小的整数类型转换为大的整数类型，从派生类转换为基类。
// 显式类型转换 - 显式类型转换，即强制类型转换。显式转换需要强制转换运算符，而且强制转换会造成数据丢失。


        double d = 543.33;
        int i;
        // 强制转换double为int  显式类型转换
        i = (int)d;
        Console.WriteLine(i);

// 1	ToBoolean
// 如果可能的话，把类型转换为布尔型。
// 2	ToByte
// 把类型转换为字节类型。
// 3	ToChar
// 如果可能的话，把类型转换为单个 Unicode 字符类型。
// 4	ToDateTime
// 把类型（整数或字符串类型）转换为 日期-时间 结构。
// 5	ToDecimal
// 把浮点型或整数类型转换为十进制类型。
// 6	ToDouble
// 把类型转换为双精度浮点型。
// 7	ToInt16
// 把类型转换为 16 位整数类型。
// 8	ToInt32
// 把类型转换为 32 位整数类型。
// 9	ToInt64
// 把类型转换为 64 位整数类型。
// 10	ToSbyte
// 把类型转换为有符号字节类型。
// 11	ToSingle
// 把类型转换为小浮点数类型。
// 12	ToString
// 把类型转换为字符串类型。
// 13	ToType
// 把类型转换为指定类型。
// 14	ToUInt16
// 把类型转换为 16 位无符号整数类型。
// 15	ToUInt32
// 把类型转换为 32 位无符号整数类型。
// 16	ToUInt64
// 把类型转换为 64 位无符号整数类型。

         int a = 14;
         float f =53.005f;
         double d1 = 2345.6788;
         bool b =true;
         Console.WriteLine(a.ToString());
         Console.WriteLine(f.ToString());
         Console.WriteLine(d1.ToString());
         Console.WriteLine(b.ToString());


// 整数类型	sbyte、byte、short、ushort、int、uint、long、ulong 和 char
// 浮点型	float 和 double
// 十进制类型	decimal
// 布尔类型	true 或 false 值，指定的值
// 空类型	可为空值的数据类型
// 枚举类型  enum
//引用类型.  class
        
        //定义过的变量名无法再次被定义
        // int i1, j, k;
		// char c, ch;
		// float f2, salary;
		// double d2;
        // double a = 14.33;//`a' is already defined in this scope
		int d3 = 3, f3 = 5;    /* 初始化 d 和 f. */
		byte z = 22;         /* 初始化 z. */
		double pi = 3.14159; /* 声明 pi 的近似值 */
		char x = 'x';        /* 变量 x 的值为 'x' */
       
       Console.WriteLine("{0} + {1} = {2}",d3,f3,d3+f3);

       int num;
       // System 命名空间中的 Console 类提供了一个函数 ReadLine()，用于接收来自用户的输入，并把它存储到一个变量中。
       // 函数 Convert.ToInt32() 把用户输入的数据转换为 int 数据类型，因为 Console.ReadLine() 只接受字符串格式的数据。
       // string strread = Console.ReadLine();
       // Console.WriteLine(strread);


// 整数常量
// 整数常量可以是十进制、八进制或十六进制的常量。前缀指定基数：0x 或 0X 表示十六进制，0 表示八进制，没有前缀则表示十进制。
// 整数常量也可以有后缀，可以是 U 和 L 的组合，其中，U 和 L 分别表示 unsigned 和 long。后缀可以是大写或者小写，多个后缀以任意顺序进行组合。

       int int16 = 0x45;
       Console.WriteLine(int16);
       string f4 = @"Joe said ""Hello"" to me"; 
       Console.WriteLine(f4);
       // string ff4 = @"Joe said \"Hello\" to me"; 不成功，不能这样用
       // Console.WriteLine(ff4);
       string f5 = "Joe said \"Hello\" to me"; 
       Console.WriteLine(f5);


// 常量是使用 const 关键字来定义的 
       sampleClass mc = new sampleClass(11,22);
       Console.WriteLine("x = {0},y = {1}",mc.x,mc.y);
       Console.WriteLine("c1 = {0},c2 = {1}",sampleClass.c1,sampleClass.c2);


// 算术运算符
// +	把两个操作数相加	A + B 将得到 30
// -	从第一个操作数中减去第二个操作数	A - B 将得到 -10
// *	把两个操作数相乘	A * B 将得到 200
// /	分子除以分母	B / A 将得到 2
// %	取模运算符，整除后的余数	B % A 将得到 0
// ++	自增运算符，整数值增加 1	A++ 将得到 11
// --	自减运算符，整数值减少 1	A-- 将得到 9


// 关系运算符
// ==	检查两个操作数的值是否相等，如果相等则条件为真。	(A == B) 不为真。
// !=	检查两个操作数的值是否相等，如果不相等则条件为真。	(A != B) 为真。
// >	检查左操作数的值是否大于右操作数的值，如果是则条件为真。	(A > B) 不为真。
// <	检查左操作数的值是否小于右操作数的值，如果是则条件为真。	(A < B) 为真。
// >=	检查左操作数的值是否大于或等于右操作数的值，如果是则条件为真。	(A >= B) 不为真。
// <=	检查左操作数的值是否小于或等于右操作数的值，如果是则条件为真。	(A <= B) 为真。


// 逻辑运算符
// &&	称为逻辑与运算符。如果两个操作数都非零，则条件为真。	(A && B) 为假。
// ||	称为逻辑或运算符。如果两个操作数中有任意一个非零，则条件为真。	(A || B) 为真。
// !	称为逻辑非运算符。用来逆转操作数的逻辑状态。如果条件为真则逻辑非运算符将使其为假。	!(A && B) 为真。


// 位运算符
// 位运算符作用于位，并逐位执行操作。&与、 |或 和 ^异或 的真值表
       // A 的值为 60，变量 B 的值为 13
// &	如果同时存在于两个操作数中，二进制 AND 运算符复制一位到结果中。	(A & B) 将得到 12，即为 0000 1100
// |	如果存在于任一操作数中，二进制 OR 运算符复制一位到结果中。	(A | B) 将得到 61，即为 0011 1101
// ^	如果存在于其中一个操作数中但不同时存在于两个操作数中，二进制异或运算符复制一位到结果中。	(A ^ B) 将得到 49，即为 0011 0001
// ~	按位取反运算符是一元运算符，具有"翻转"位效果，即0变成1，1变成0，包括符号位。	(~A ) 将得到 -61，即为 1100 0011，一个有符号二进制数的补码形式。
// <<	二进制左移运算符。左操作数的值向左移动右操作数指定的位数。	A << 2 将得到 240，即为 1111 0000
// >>	二进制右移运算符。左操作数的值向右移动右操作数指定的位数。	A >> 2 将得到 15，即为 0000 1111


// 其他运算符
// sizeof()	返回数据类型的大小。	sizeof(int)，将返回 4.
// typeof()	返回 class 的类型。	typeof(StreamReader);
// &	返回变量的地址。	&a; 将得到变量的实际地址。
// *	变量的指针。	*a; 将指向一个变量。
// ? :	条件表达式	如果条件为真 ? 则为 X : 否则为 Y  三目表达
// is	判断对象是否为某一类型。	If( Ford is Car) // 检查 Ford 是否是 Car 类的一个对象。
// as	强制转换，即使转换失败也不会抛出异常。	Object obj = new StringReader("Hello"); StringReader r = obj as StringReader;
        Console.WriteLine(typeof(sampleClass));
        if (f5 is string){
        	Console.WriteLine("f5 is string");
        }
        if (mc is sampleClass){
        	Console.WriteLine("mc is sampleClass'object");
        }
        int strtonum = 134;
        // Console.WriteLine((string)(&f5));
        Console.WriteLine(strtonum.ToString());
        // Console.WriteLine(&strtonum);

// 引用类型可以使用空引用表示一个不存在的值，而值类型通常不能表示为空。
// 例如：string str=null; 是正确的，int i=null; 编译器就会报错。
// 为了使值类型也可为空，就可以使用可空类型，即用可空类型修饰符 ? 来表示，表现形式为 T?

// 空合并运算符 ??
// a??b 当 a 为 null 时则返回 b，a 不为 null 时则返回 a 本身


            char grade = 'B';

            switch (grade)
            {
                case 'A':
                    Console.WriteLine("very good");
                    break;
                case 'B':
                case 'C':
                    Console.WriteLine("good");
                    break;
                case 'D':
                    Console.WriteLine("pass");
                    break;
                case 'F':
                    Console.WriteLine("try again");
                    break;
                default:
                    Console.WriteLine("indevide grade");
                    break;
            }
            Console.WriteLine("your grade is {0}", grade);
            
            int testa = 10;
            while (testa < 20)
            {
                Console.WriteLine("testa value: {0}", testa);
                testa++;
            }
            

             for (int testa2 = 10; testa2 < 20; testa2 = testa2 + 1)
            {
                Console.WriteLine("testa2 value is: {0}", testa2);
            }

            int[] arr1 = {0,1,2,3,4,5,6};
            foreach(int element in arr1){
            	Console.Write(element);
            }
            Console.WriteLine("\n");

            int[] arr2 = new int[]{0,1,2,3,4,5,6};
            foreach(int element in arr2){
            	Console.Write(element);
            }
            Console.WriteLine();

            for (int i10 = 0; i10 < arr2.Length; i10++)
	        {
	            System.Console.Write(arr2[i10]);
	        }
	        Console.WriteLine("\n");

            int testa3 = 10;
	        do
            {
               Console.WriteLine("testa3 value is: {0}", testa3);
                testa3 = testa3 + 1;
            } while (testa3 < 20);
            //当不成立时退出
            Console.WriteLine("");

            int ia, jb;

	         for (ia = 2; ia < 100; ia++)
	         {
	            for (jb = 2; jb <= (ia / jb); jb++)
	               if ((ia % jb) == 0) break; // 如果找到，则不是质数
	            if (jb > (ia / jb)) 
	               Console.WriteLine("{0} is zhi shu", ia);
	         }


	        int at = 10;
            do
            {
                if (at == 15)
                {
                    /* 跳过迭代 */
                    at = at + 1;
                    continue;
                    Console.WriteLine("atatatatat");
                }
                Console.WriteLine("at's value is: {0}", at);
                at++;

            } while (at < 20);



// public：所有对象都可以访问；
// private：对象本身在对象内部可以访问；
// protected：只有该类对象及其子类对象可以访问
// internal：同一个程序集的对象可以访问；
// protected internal：访问限于当前程序集或派生自包含类的类型。	

         
         //Public 访问修饰符允许一个类将其成员变量和成员函数暴露给其他的函数和对象。任何公有成员可以被外部的类访问。
            Rectangle r = new Rectangle(4.5,3.5);//创建对象，使用对象中属性
            r.Display();

                      
// Private 访问修饰符允许一个类将其成员变量和成员函数对其他的函数和对象进行隐藏。只有同一个类中的函数可以访问它的私有成员。即使是类的实例也不能访问它的私有成员。
             Rectangle1 r1 = new Rectangle1();
             // Console.WriteLine(r1.length);私有的不能被创建的对象访问
             r1.Display();


// Protected 访问修饰符允许子类访问它的基类的成员变量和成员函数。这样有助于实现继承。我们将在继承的章节详细讨论


// Internal 访问修饰符
// Internal 访问说明符允许一个类将其成员变量和成员函数暴露给当前程序中的其他函数和对象。换句话说，带有 internal 访问修饰符的任何成员可以被定义在该成员所定义的应用程序内的任何类或方法访问。

              
// Protected Internal 访问修饰符
// Protected Internal 访问修饰符允许在本类,派生类或者包含该类的程序集中访问。这也被用于实现继承。


              Rectangle2 r2 = new Rectangle2();
              r2.length = 3.5;
              r2.width = 3.6;
              r2.Display();

          int findNum1=10,findNum2 = 30;
          HelloWorld H = new HelloWorld();
          //要创建对象调用类中的方法
          int ret = H.FindMax(findNum1,findNum2);    
          Console.WriteLine("{0}",ret);
          int ret1 = H.FindMax(22,11);//可以直接传number参数    
          Console.WriteLine("{0}",ret1);

          Console.WriteLine("the six factorial is: {0}",H.factorial(6));
          Console.WriteLine("the five factorial is: {0}",H.factorial(5));


// 参数传递
// 值参数	这种方式复制参数的实际值给函数的形式参数，实参和形参使用的是两个不同内存中的值。在这种情况下，当形参的值发生改变时，不会影响实参的值，从而保证了实参数据的安全。
// 引用参数	这种方式复制参数的内存位置的引用给形式参数。这意味着，当形参的值发生改变时，同时也改变实参的值。
// 输出参数	这种方式可以返回多个值。

          Console.WriteLine("the findNum1 and findNum2 value is: {0} {1}",findNum1,findNum2);
          H.swap(findNum1,findNum2);//只是形参发生变化，实参没有发生变化
          Console.WriteLine("the findNum1 and findNum2 value is: {0} {1}",findNum1,findNum2);


// 按引用传递参数
// 引用参数是一个对变量的内存位置的引用。当按引用传递参数时，与值参数不同的是，它不会为这些参数创建一个新的存储位置。引用参数表示与提供给方法的实际参数具有相同的内存位置。

// 在 C# 中，使用 ref 关键字声明引用参数
          // Console.WriteLine("the findNum1 and findNum2 value is: {0} {1}",findNum1,findNum2);
          // H.swap(ref findNum1,ref findNum2);
          // Console.WriteLine("the findNum1 and findNum2 value is: {0} {1}",findNum1,findNum2);


// 按输出传递参数
// return 语句可用于只从函数中返回一个值。但是，可以使用 输出参数 来从函数中返回两个值。输出参数会把方法输出的数据赋给自己，其他方面与引用参数相似。

          int getvaluenum = 100;
          H.getvalue(out getvaluenum);
          Console.WriteLine("the value of getvaluenum:{0}",getvaluenum);



          int retfuncnum1 = H.retfunc(findNum1,findNum2);
          Console.WriteLine("the retfuncnum value is:{0}",retfuncnum1);

         //  H.getValues(out findNum1, out findNum2);

         // Console.WriteLine("在方法调用之后，findNum1 的值： {0}", findNum1);
         // Console.WriteLine("在方法调用之后，findNum2 的值： {0}", findNum2);


// 可空类型（Nullable）
// 单问号 ? 与 双问号 ??
// ? : 单问号用于对 int,double,bool 等无法直接赋值为 null 的数据类型进行 null 的赋值，意思是这个数据类型是 NullAble 类型的。

        int? nullnum1 = 3;//等同于  Nullable<int> i = new Nullable<int>(3);如果没有赋值则为默认值null
        Console.WriteLine("the nullnum1 value is: {0}",nullnum1);


        int? nullnum2 = null;
        int? nullnum3 = 45;
        double? nulldouble1 = null;
        double? nulldouble2 = 45.67;
        bool? nullbool1 = null;
        bool? nullbool2 = new bool?();

        Console.WriteLine("the can be null value: {0}, {1}, {2}, {3}", nullnum2, nullnum3, nulldouble1, nulldouble2);
        Console.WriteLine("one bool value of null: {0},{1}", nullbool1,nullbool2);


// Null 合并运算符（ ?? ）
// Null 合并运算符用于定义可空类型和引用类型的默认值。Null 合并运算符为类型转换定义了一个预设值，以防可空类型的值为 Null。
// Null 合并运算符把操作数类型隐式转换为另一个可空（或不可空）的值类型的操作数的类型。
// 如果第一个操作数的值为 null，则运算符返回第二个操作数的值，否则返回第一个操作数的值


         double? num1 = null;
         double? num2 = 3.14157;
         double num3;
         num3 = num1 ?? 5.34;      // num1 如果为空值则返回 5.34
         Console.WriteLine("num3 的值： {0}", num3);
         num3 = num2 ?? 5.34; // num2如果为空值则 返回 5.34
         Console.WriteLine("num3 的值： {0}", num3);

 

// 数组（Array）
// 数组是一个存储  相同类型  元素的固定大小的顺序集合
// 数组是用来存储数据的集合，通常认为数组是一个同一类型变量的集合。
         Console.WriteLine();
         double[] balance = new double [10];//不赋值的话，默认为0
         for (int balnum = 0;balnum < balance.Length;balnum++){
         	Console.WriteLine(balance[balnum]);
         }
         Console.WriteLine();


         int [] marks = new int []  { 99,  98, 92, 97, 95};
         int [] score = marks;//可以赋值一个数组变量到另一个目标数组变量中。在这种情况下，目标和源会指向相同的内存位置
         for (int balnum = 0;balnum < marks.Length;balnum++){
         	Console.WriteLine(marks[balnum]);
         }
         Console.WriteLine();
         for (int balnum = 0;balnum < score.Length;balnum++){
         	Console.WriteLine(score[balnum]);
         }
         Console.WriteLine();

         foreach(int balnum in marks){
         	Console.WriteLine("Element: {0}",balnum);
         }
         Console.WriteLine();


// C# 多维数组
// 声明一个 string 变量的二维数组,如  string [,] names;
// 声明一个 int 变量的三维数组，如  int [ , , ] m;
		int [,] arrerwei = new int [3,4] {
		 {0, 1, 2, 3} ,   /*  初始化索引号为 0 的行 */
		 {4, 5, 6, 7} ,   /*  初始化索引号为 1 的行 */
		 {8, 9, 10, 11}   /*  初始化索引号为 2 的行 */
		};

		int j;
		for(i=0;i<3;i++){
			for(j=0;j<4;j++){
				Console.WriteLine("arrerwei[{0},{1}] = {2}",i,j,arrerwei[i,j]);
			}
		}
        Console.WriteLine();
        //三维数组
		int [, ,] arrsanwei = new int [3,4,2] {
		 {{0,1}, {1,2}, {2,3}, {3,4}} , 
		 {{4,5}, {5,6},{ 6,7},{ 7,8}} ,   
		 {{8,9}, {9,10}, {10,11}, {11,12}}   
		};
		int k;
		for(i=0;i<3;i++){
			for(j=0;j<4;j++){
				for(k=0;k<2;k++){
					Console.WriteLine("arrsanwei[{0},{1},{2}] = {3}",i,j,k,arrsanwei[i,j,k]);
				}
			}
		}


// C# 交错数组
// 交错数组是数组的数组。您可以声明一个带有 int 值的交错数组 scores，如 int [][] scores;
        int [][] scores = new int [5][];
        for(i=0;i<scores.Length;i++){
        	scores[i] = new int[4];
        }

        //这样就可以定义不同长度的各个数组,就是输出时会越界
        int [][]scores1 = new int[2][]{new int[]{92,93,49},new int[]{54,36,77,67}};
        for (i=0;i<2;i++){
        	for(j=0;j<3;j++){
        		Console.WriteLine("scores1[{0}][{1}] = {2}",i,j,scores1[i][j]);
        	}
        }


// 传递数组给函数
        double avg;
        avg = H.getAverage(marks,5);
        Console.WriteLine("the average value is: {0}",avg);


// 参数数组
// 当声明一个方法时，您不能确定要传递给函数作为参数的参数数目
// 在使用数组作为形参时，C# 提供了 params 关键字，使调用数组为形参的方法时，既可以传递数组实参，也可以传递一组数组元素。
// params 的使用格式为：public 返回类型 方法名称( params 类型名称[] 数组名称 )
        int sum;
        sum = H.AddElements(512,729,566);
        Console.WriteLine("the sum is: {0}",sum);


// 通过使用 String 类构造函数
// 通过检索属性或调用一个返回字符串的方法
// 通过格式化方法来转换一个值或对象为它的字符串表示形式

       string[] str1 = new string[] {"Hello","the","World","for","anyone"};
       for (i=0;i<str1.Length;i++){
        Console.WriteLine(str1[i]);
       }

       string[] str2 = {"Hello","the","World","for","anyone"};
       string mesage = String.Join(" ",str2);//字符串中间加入空格
       Console.WriteLine(mesage);


       DateTime dt = new DateTime(2019,06,11,08,20,05);
       string datetime = String.Format("mesage sent at {0:t} on {0:D}",dt);
       Console.WriteLine(datetime);
       string datetime2 = string.Format("{0:yyyy/MM/dd HH:mm:ss}",dt);//格式化时间
       Console.WriteLine(datetime2);

       //获取子字符串
       string strsub = "Last night I dreamt of San Pedro"; 
       string substr = strsub.Substring(1,4);//位置和个数 
       Console.WriteLine(substr); 

       //连接字符串
       string[] starray = new string[]{"Down the way nights are dark",
         "And the sun shines daily on the mountain top",
         "I took a trip on a sailing ship",
         "And when I reached Jamaica",
         "I made a stop"};
         string stastr = String.Join("\n",starray);
         Console.WriteLine(stastr);


        //结构体
         // 1、结构体中声明的字段无法赋予初值，类可以
         // 2、结构体的构造函数中，必须为结构体所有字段赋值，类的构造函数无此限制:
        Books book1 = new Books();
        Books book2 = new Books();
        book1.getValues("c programming","nuha ali","c programming tutorial",2452);
        book2.getValues("telecom billing","zara ali","telecom billing tutorial",20593);
        book1.Display();
        book2.Display();
        
        Anaimal anaimal1 = new Anaimal("tigger","blue","run",3);
        anaimal1.Display();

        
        //枚举
        // 枚举列表中的每个符号代表一个整数值，一个比它前面的符号大的整数值。默认情况下，第一个枚举符号的值是 0
        Console.WriteLine((int)Day.sun);
       

       //类的定义
        // 访问标识符指定了对类及其成员的访问规则。如果没有指定，则使用默认的访问标识符。
        // 类的默认访问标识符是 internal，成员的默认访问标识符是 private

        // 构造函数的名称与类的名称完全相同，它没有任何返回类型
       
       // 默认的构造函数没有任何参数。但是如果你需要一个带有参数的构造函数可以有参数，这种构造函数叫做参数化构造函数。
       // 这种技术可以帮助你在创建对象的同时给对象赋初始值
       Box box1 = new Box(13.2,4.4,5.6);
       double box1ret = box1.getVolume();
       Console.WriteLine("{0} ",box1ret);


       // 类的静态成员
       // 关键字 static 意味着类中只有一个该成员的实例,静态变量用于定义常量，因为它们的值可以通过直接调用类而不需要创建类的实例来获取
       // 静态变量可在成员函数或类的定义外部进行初始化。你也可以在类的定义内部初始化静态变量
       // 可以把一个成员函数声明为 static。这样的函数只能访问静态变量。静态函数在对象被创建之前就已经存在
       StaticVar static1 = new StaticVar();
       static1.count();
       Console.WriteLine("the value is: {0}",StaticVar.getNum());

       
       //继承
       Tabletop Tabletop1 = new Tabletop(5.2,6.6);
       // Tabletop1.GetCost();
       Tabletop1.Display();
       
       //多重继承
       // 多重继承指的是一个类别可以同时从多于一个父类继承行为与特征的功能。与单一继承相对，单一继承指一个类别只可以继承自一个父类
       // C# 不支持多重继承。但是，您可以使用接口来实现多重继承


       // 函数重载  可以有多个相同名字的函数，对应传入不同的参数及参数个数
       TestData testdata1 = new TestData();
       int testdata1out = testdata1.Add(1,2);
       Console.WriteLine(testdata1out);
       int testdata1out2 = testdata1.Add(1,2,3);
       Console.WriteLine(testdata1out2);


       // 动态多态性
       // 允许您使用关键字 abstract 创建抽象类
// 您不能创建一个抽象类的实例
// 您不能在一个抽象类外部声明一个抽象方法
// 通过在类定义前面放置关键字 sealed，可以将类声明为密封类。当一个类被声明为 sealed 时，它不能被继承。抽象类不能被声明为 sealed
       Rectang Rectang1 = new Rectang(2,5);
       int Recret = Rectang1.area();
       Console.WriteLine(Recret);

       //虚方法
// 当有一个定义在类中的函数需要在继承类中实现时，可以使用虚方法。

// 虚方法是使用关键字 virtual 声明的。

// 虚方法可以在不同的继承类中有不同的实现。

// 对虚方法的调用是在运行时发生的。

// 动态多态性是通过 抽象类 和 虚方法 实现的。

// 以下实例创建了 Shape 基类，并创建派生类 Circle、 Rectangle、Triangle， Shape 类提供一个名为 Draw 的虚拟方法，在每个派生类中重写该方法以绘制该类的指定形状。
       Caller Caller1 = new Caller();
       Rectangle3 R = new Rectangle3(10,7);
       Triangle T = new Triangle(10,5);
       Caller1.CallArea(R);
       Caller1.CallArea(T);


       Box boxtest1 = new Box(6.0,7.0,5.0);
       Box boxtest2 = new Box(12.0,13.0,10.0);
       Box boxtest3 = new Box();
       double volume1;
       volume1 = boxtest1.getVolume();
       Console.WriteLine("the box1 volume is: {0}",volume1);
       volume1 = boxtest2.getVolume();
       Console.WriteLine("the box2 volume is: {0}",volume1);
       boxtest3 = boxtest1 + boxtest2;
       volume1 = boxtest3.getVolume();
       Console.WriteLine("the box3 volume is: {0}",volume1);


// +, -, !, ~, ++, --  这些一元运算符只有一个操作数，且可以被重载。
// +, -, *, /, %   这些二元运算符带有两个操作数，且可以被重载。
// ==, !=, <, >, <=, >=    这些比较运算符可以被重载。
// &&, ||  这些条件逻辑运算符不能被直接重载。
// +=, -=, *=, /=, %=  这些赋值运算符不能被重载。
// =, ., ?:, ->, new, is, sizeof, typeof   这些运算符不能被重载。


        //接口
// 接口定义了属性、方法和事件，这些都是接口的成员。接口只包含了成员的声明。成员的定义是派生类的责任
       InterfaceImplementer Imy = new InterfaceImplementer();
       Imy.MethodToImplement();
       Imy.ParentInterfaceMethod();
       // 如果一个接口继承其他接口，那么实现类或结构就需要实现所有接口的成员。
       // 以下实例 IMyInterface 继承了 IParentInterface 接口，
       // 因此接口实现类必须实现 MethodToImplement() 和 ParentInterfaceMethod() 方法：

// 接口方法不能用public abstract等修饰。接口内不能有字段变量，构造函数
// 接口内可以定义属性（有get和set的方法）。如string color { get ; set ; }这种
// 实现接口时，必须和接口的格式一致
// 必须实现接口的所有方法


// 接口用于规范，抽象类用于共性。抽象类是类，所以只能被单继承，但是接口却可以一次实现多个。

// 接口中只能声明方法，属性，事件，索引器。而抽象类中可以有方法的实现，也可以定义非静态的类变量。

// 抽象类可以提供某些方法的部分实现，接口不可以。抽象类的实例是它的子类给出的。接口的实例是实现接口的类给出的。

// 在抽象类中加入一个方法，那么它的子类就同时有了这个方法。而在接口中加入新的方法，那么实现它的类就要重新编写（这就是为什么说接口是一个类的规范了）。

// 接口成员被定义为公共的，但抽象类的成员也可以是私有的、受保护的、内部的或受保护的内部成员（其中受保护的内部成员只能在应用程序的代码或派生类中访问）。

// 此外接口不能包含字段、构造函数、析构函数、静态成员或常量。

// 还有一点，我们在VS中实现接口时会发现有2个选项，一个是实现接口，一个是显示实现接口。实现接口就是我们平常理解的实现接口，而显示实现接口的话，实现的方法是属于接口的，而不是属于实现类的。


      //命名空间的使用 namespace_name.item_name;
      first_space.namespace_cl fc = new first_space.namespace_cl();
      second_space.namespace_cl sc = new second_space.namespace_cl();
      fc.func();
      sc.func();


      //正则表达示
      string inputzhengze = "1851 1999 1950 1905 2003";
      string patternnumber = @"(?<=19)\d{2}\b";
      foreach (Match match in Regex.Matches(inputzhengze,patternnumber)){
        Console.WriteLine(match.Value);
      }

      string strshowmatch = "A Thousand Splendid Suns";

     Console.WriteLine("Matching words that start with 'S': ");
     showMatch(strshowmatch, @"\bS\S*");
     

     string strshowmatch1 = "make maze and manage to measure it";
     Console.WriteLine("Matching words start with 'm' and ends with 'e':");
     showMatch(strshowmatch1, @"\bm\S*e\b");

     
     string strtest1 = "13min sfld34, alfdjf0aj0fl0)f;a";
     foreach (Match match in Regex.Matches(strtest1,@"\d\S*")){
          Console.WriteLine(match.Value);
     }


    FileStream FilleStream1 = new FileStream("/Users/swqt/Desktop/sample.txt",FileMode.OpenOrCreate,FileAccess.ReadWrite,FileShare.ReadWrite);
    for ( i = 1; i <= 20; i++)
    {
        FilleStream1.WriteByte((byte)i);
    }
    FilleStream1.Position = 0;

    for ( i = 0; i <= 20; i++)
    {
        Console.Write(FilleStream1.ReadByte() + " ");
    }
    FilleStream1.Close();
    Console.WriteLine();

    // StreamWriter 类 供写入
    // StreamWriter 类继承自抽象类 TextWriter，表示编写器写入一系列字符
    string[] names = new string[] {"Zara Ali", "Nuha Ali"};
    using (StreamWriter sw = new StreamWriter("/Users/swqt/Desktop/names.txt"))
    {
        foreach (string s in names)
        {
            sw.WriteLine(s);

        }
    }

    // 从文件中读取并显示每行
    string line = "";
    using (StreamReader sr = new StreamReader("/Users/swqt/Desktop/names.txt"))
    {
        while ((line = sr.ReadLine()) != null)
        {
            Console.WriteLine(line);
        }
    }

    
    //访问器（accessor）声明可包含一个 get 访问器、一个 set 访问器
    Student newstudent = new Student();
    newstudent.Code = "U.S";
    newstudent.Name = "zhangsan";
    newstudent.Age = 23;
    Console.WriteLine("Student Info: {0}",newstudent);
    newstudent.Age = newstudent.Age+2;
    Console.WriteLine("Student Info: {0}",newstudent);
//抽象属性    抽象类可拥有抽象属性，这些属性应在派生类中被实现

    
    // 属性如果是一个数组的话，set 中的其它代码不会执行
    WordtoBit wordtobit = new WordtoBit();
    wordtobit.X[5] = true;
    foreach(bool b1 in wordtobit.X){
        Console.WriteLine(b1);
    }

    
    //委托可以定义在任何方法，其他类中的方法也行，只要形式一样即可
    MyDelegate myDelegate1 = MyDelegate;
    int myDelnum = myDelegate1("fing the function");
    Console.WriteLine(myDelnum);
    myDelegate1 = DelegateFun;//委托克随便指向其他方法,只要是这种返回类型和参数类型就行
    myDelegate1("rawuart");


    // 委托的 多播
    // 委托对象可使用 "+" 运算符进行合并。一个合并委托调用它所合并的两个委托。
    // 只有相同类型的委托可被合并。"-" 运算符可用于从合并的委托中移除组件委托。
    NUmberChanger nc;
    NUmberChanger nc1 = AddNum;
    NUmberChanger nc2 = MultNum;
    
    nc = nc2 + nc1;//先运行nc2在运行nc1
    nc(5);
    Console.WriteLine("get the num value is: {0}",getNum());


    // 委托（Delegate）的用途  定义一个委托相当于定义一个新类，所有可以定义类的地方都可以定义委托
    printString ps1 = WriteToScreen;
    printString ps2 = WriteToFile;
    sendString(ps1);
    sendString(ps2);


    //事件（Event）
    //事件（Event）基本上说是一个用户操作，如按键、点击、鼠标移动等等，或者是一些出现，如系统生成的通知。应用程序需要在事件发生时响应事件
    //事件使用 发布-订阅（publisher-subscriber）模型

    //声明事件本身，使用 event 关键字：
    EventTest eventtest1 = new EventTest(); /* 实例化对象,第一次没有触发事件 */
    subscribEvent v = new subscribEvent(); /* 实例化对象 */
    eventtest1.ChangeNum += new EventTest.NumManipulationHandler( v.printf ); /* 注册 */
    eventtest1.SetValue( 7 );
    eventtest1.SetValue( 11 );


    // C#  集合 
    // C# 动态数组 （ArrayList）
    // 可以使用索引在指定的位置添加和移除项目，动态数组会自动重新调整它的大小
    ArrayList al = new ArrayList();
    Console.WriteLine("adding some numbers: ");
    al.Add(45);
    al.Add(78);
    al.Add(33);
    al.Add(56);
    al.Add(12);
    al.Add(23);
    al.Add(9);

    Console.WriteLine("Capacity: {0} ", al.Capacity);
    Console.WriteLine("Count: {0}", al.Count);

    Console.Write("Content: ");
    foreach (int temp in al)
    {
        Console.Write(temp + " ");
    }
    Console.WriteLine();
    Console.Write("Sorted Content: ");
    al.Sort();
    foreach (int temp in al)
    {
        Console.Write(temp + " ");
    }
    Console.WriteLine();


    // C# 哈希表（Hashtable）
// Hashtable 类代表了一系列基于键的哈希代码组织起来的键/值对。它使用键来访问集合中的元素。
// 当您使用键访问元素时，则使用哈希表，而且您可以识别一个有用的键值。哈希表中的每一项都有一个键/值对。键用于访问集合中的项目。
    Hashtable ht = new Hashtable();
     ht.Add("001", "Zara Ali");
     ht.Add("002", "Abida Rehman");
     ht.Add("003", "Joe Holzner");
     ht.Add("004", "Mausam Benazir Nur");
     ht.Add("005", "M. Amlan");
     ht.Add("006", 10);
     ht.Add("007", "Ritesh Saikia");

    if (ht.ContainsValue("Nuha Ali"))
     {
        Console.WriteLine("This student name is already in the list");
     }
     else
     {
        ht.Add("008", "Nuha Ali");
     }
     // 获取键的集合 
     ICollection key = ht.Keys;
     foreach (string k1 in key)
     {
        Console.WriteLine(k1 + ": " + ht[k1]);
     }
     Console.WriteLine("----var k in ht.keys----");
     // foreach(string kky in ht.keys){
     // 	Console.WriteLine(kky+": "+ht[kky]);
     // }


    //泛型（Generic）
// 泛型允许您编写一个可以与任何数据类型一起工作的类或方法
    // 可以创建自己的泛型接口、泛型类、泛型方法、泛型事件和泛型委托
    // 您可以对泛型类进行约束以访问特定数据类型的方法
    MyGenericArray <int> intArray = new MyGenericArray<int>(5);
    for (i=0;i<5;i++){
        intArray.setItem(i,i*3);
    }
    for (i=0;i<5;i++){
        Console.Write(intArray.getItem(i)+" ");
    }
//这样的话可以设置不同数据类型的数组
    Console.WriteLine();
    MyGenericArray <string> strArray = new MyGenericArray<string>(5);
    for(i=0;i<5;i++){
        strArray.setItem(i,"strArray"+i);
    }
    for (i=0;i<5;i++){
        Console.Write(strArray.getItem(i)+" ");
    }
    Console.WriteLine();


    //泛型（Generic）方法  这样就可以定义多种类型数据的参数
    int swapa=10,swapb=9;
    char swapc='i',swapd='v';
    Console.WriteLine("Int values before calling swap:");
    Console.WriteLine("a = {0}, b = {1}", swapa, swapb);
    Console.WriteLine("Char values before calling swap:");
    Console.WriteLine("c = {0}, d = {1}", swapc, swapd);
    Swap<int>(ref swapa, ref swapb);
    Swap<char>(ref swapc, ref swapd);
    Console.WriteLine("Int values after calling swap:");
    Console.WriteLine("a = {0}, b = {1}", swapa, swapb);
    Console.WriteLine("Char values after calling swap:");
    Console.WriteLine("c = {0}, d = {1}", swapc, swapd);
    

    // 泛型（Generic）委托
    NumberChanger<int> numberchanger1 = AddNum;
    NumberChanger<int> numberchanger2 = MultNum;

    numberchanger1(25);
    Console.WriteLine("Value of Num: {0}", getNum());
    numberchanger1(5);
    Console.WriteLine("Value of Num: {0}", getNum());


    //C# 匿名方法  在匿名方法中您不需要指定返回类型，它是从方法主体内的 return 语句推断的。
    // 使用匿名方法创建委托实例
    NumberChanger1 Num1 = delegate(int Num1x){
        Console.WriteLine("Anonymous Method: {0}",Num1x);
        return Num1x;
    };
    // 使用匿名方法调用委托
    Num1(19);

    // 使用命名方法实例化委托
    Num1 = new NumberChanger1(AddNum);
    Num1(4);
    Num1 = new NumberChanger1(MultNum);
    Num1(2);


    //C# 不安全代码
    // 当一个代码块使用 unsafe 修饰符标记时，C# 允许在函数中使用指针变量。不安全代码或非托管代码是指使用了指针变量的代码块
    // int* p1, p2, p3;     // 正确  
    // int *p1, *p2, *p3;   // 错误 

// 使用 ToString() 方法检索存储在指针变量所引用位置的数据
    // unsafe{
    //     int var20 =20;
    //     int* p = &var20;
    //     Console.WriteLine("Data is: {0}",var20);
    //     Console.WriteLine("DAta is: {0}",p->ToString());
    //     Console.WriteLine("Address is: {0}",(int)p);
    // }


    //C# 多线程
// 当 C# 程序开始执行时，主线程自动创建。使用 Thread 类创建的线程被主线程的子线程调用。
// 您可以使用 Thread 类的 CurrentThread 属性访问线程。
    Thread th = Thread.CurrentThread;
    Console.WriteLine("the Threading is: "+th);

    ThreadStart childref = new ThreadStart(CallToChildThread);
    Console.WriteLine("In Main: Creating the Child thread");
    Thread childThread = new Thread(childref);
    childThread.Start();

// C# GetType和typeof
    var nametype = "www.w3school.cn";
    var agetype = 25;
    var isRabbittype = true;
    Type nameType = nametype.GetType();
    Type ageType = agetype.GetType();
    Type isRabbitType = isRabbittype.GetType();
    Console.WriteLine("the nametype is:{0}",nameType);
    Console.WriteLine("the ageType is:{0}",ageType);
    Console.WriteLine("the isRabbitType is:{0}",isRabbitType);





    }
    public static void CallToChildThread()
    {
        Console.WriteLine("Child thread starts");
    }
    static void Swap<T>(ref T l,ref T r){
         T temp;
         temp = l;
         l = r;
         r = temp;
    }
    public class MyGenericArray<T>{
        private T[] array;
        public MyGenericArray(int size){
            array = new T[size+1];
        }
        public T getItem(int index){
            return array[index];
        }
        public void setItem(int index,T value){
            array[index] = value;
        }
    }
    //发布器类
    public class EventTest
  {
    private int value;
    public delegate void NumManipulationHandler();
    public event NumManipulationHandler ChangeNum;// 基于上面的委托定义事件
    protected virtual void OnNumChanged(){
        if(ChangeNum != null){
            ChangeNum();
        }else{
            Console.WriteLine("event not fire");
        }
    }
    public EventTest(){
        int n = 5;
        SetValue(n);
    }
    public void SetValue(int n){
        if(value != n){
            value = n;
            OnNumChanged();
        }
    }
  }
    //订阅器类
    public class subscribEvent{
        public void printf(){
            Console.WriteLine("event fire");

        }
    }




    static FileStream fs;
    static StreamWriter sw;
    public delegate void printString(string s);
    public static void WriteToScreen(string str){
        Console.WriteLine("The String is: {0}",str);
    }
    public static void WriteToFile(string s){
        fs = new FileStream("/Users/swqt/Desktop/message.txt",FileMode.Append,FileAccess.Write);
        sw = new StreamWriter(fs);
        sw.WriteLine(s);
        sw.Flush();
        sw.Close();
        fs.Close();
    }
    public static void sendString(printString ps){
        ps("hello world");
    }
    static int num = 10;
    public static int AddNum(int p)
    {
        num += p;
        Console.WriteLine(num);
        return num;
    }

    public static int MultNum(int q)
    {
        num *= q;
        Console.WriteLine(num);
        return num;
    }
    public static int getNum()
    {
        return num;
    }
    static public int DelegateFun(string s){
        Console.WriteLine("the string is: "+s);
        return 101;
    }
    private static void showMatch(string text, string expr)
    {
         Console.WriteLine("The Expression: " + expr);
         MatchCollection mc = Regex.Matches(text, expr);
         foreach (Match m in mc)
         {
            Console.WriteLine(m);
         }
    }
    public int FindMax(int num1,int num2){
    	int result;
    	if (num1>num2){
    		result = num1;
    	}else{
    		result = num2;
    	}
    	return result;
    }

    public int factorial(int num){
    	int result;
    	if (num==1){
    		return 1;
    	}else{
    		result = factorial(num - 1)*num;
    		return result;
    	}
    }
    public void swap(int x, int y){
    	int temp;
    	temp = x;
    	x = y;
    	y = temp;
    }
    public void getvalue(out int x )
    {
	     int temp = 5;
	     x = temp;
    }
    public void getValues(out int x, out int y )
      {
          Console.WriteLine("请输入第一个值： ");
          x = Convert.ToInt32(Console.ReadLine());
          Console.WriteLine("请输入第二个值： ");
          y = Convert.ToInt32(Console.ReadLine());
      }
    public int retfunc(int x,int y){
    	return y+x;
    }
    double getAverage(int[] arr, int size)
      {
         int i;
         double avg;
         int sum = 0;

         for (i = 0; i < size; ++i)
         {
            sum += arr[i];
         }

         avg = (double)sum / size;
         return avg;
      }
    public int AddElements(params int[] arr)
      {
         int sum = 0;
         foreach (int i in arr)
         {
            sum += i;
         }
         return sum;
      }
      





    
}
class WordtoBit
{
    private bool[] x = new bool[16];
    public bool[] X
    {
        get { return x; }
        set
        {
            x = value;
            Console.WriteLine("这句不能执行！");
        }
    }
}
class Student:Person{
    private string code = "N.A";
    private string name = "not known";
    private int age = 20;

    public string Code{set;get;}
    public override string Name{set;get;}//重载抽象父lei 要override
    public override int Age{set;get;}//重载抽象父lei 要override

    public override string ToString(){
        return "Code = " + Code +", Name = " + Name + ", Age = " + Age;
    }

}
public abstract class Person
{
    public abstract string Name
      {
         get;
         set;
      }
      public abstract int Age
      {
         get;
         set;
      }
}
class InterfaceImplementer:IMyInterface{
      public void MethodToImplement(){
        Console.WriteLine("MethodToImplement() called");
      }
      public void ParentInterfaceMethod(){
        Console.WriteLine("ParentInterfaceMethod() called");
      }
}
interface IParentInterface{
    void ParentInterfaceMethod();
}
interface IMyInterface:IParentInterface{
    void MethodToImplement();
}
class Shape 
   {
      protected int width, height;
      public Shape( int a=0, int b=0)
      {
         this.width = a;
         this.height = b;
      }
      public virtual int area()
      {
         Console.WriteLine("父类的面积：");
         return 0;
      }
   }
   class Rectangle3: Shape
   {
      public Rectangle3( int a=0, int b=0): base(a, b)
      {

      }
      public override int area ()
      {
         Console.WriteLine("Rectangle3 类的面积：");
         return (width * height); 
      }
   }
   class Triangle: Shape
   {
      public Triangle(int a = 0, int b = 0): base(a, b)
      {
      
      }
      public override int area()
      {
         Console.WriteLine("Triangle 类的面积：");
         return (width * height / 2); 
      }
   }
   class Caller
   {
      public void CallArea(Shape sh)
      {
         int a;
         a = sh.area();
         Console.WriteLine("面积： {0}", a);
      }
   }  
abstract class Shap{
    abstract public int area();
}
class Rectang:Shap{
    private int length;
    private int width;

    public Rectang(int a,int b){
        this.length = a;
        this.width = b;
    }
    public override int area(){
        Console.WriteLine("the area about Rectang is: ");
        return width*length;
    }
}
class TestData{
    public int Add(int a,int b, int c){
        return a+b+c;
    }
    public int Add(int a, int b){
        return a+b;
    }
}
class StaticVar{
    public static int num;
    public void count(){
        num++;
    }
    public static int getNum(){
        return num;
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
    public Box(){
        
    }
    public double getVolume(){
        return length*width*height;
    }
    public void setLength(double len){
        length = len;
    }
    public void setBreadth(double wid){
        width = wid;
    }
    public void setHeight(double hei){
        height = hei;
    }
    public static Box operator+ (Box b,Box c){
        Box box = new Box();
        box.length = b.length + c.length;
        box.width = b.width + c.width;
        box.height = b.height + c.height;
        return box;
    }
//类的 析构函数 是类的一个特殊的成员函数，当类的对象超出范围时执行
// 析构函数的名称是在类的名称前加上一个波浪形（~）作为前缀，它不返回值，也不带任何参数
    // 析构函数用于在结束程序（比如关闭文件、释放内存等）之前释放资源。析构函数不能继承或重载。
   ~Box(){
    Console.WriteLine("duixiang yishanchu");
   }
    
}

class sampleClass{
    	public int x;
    	public int y;
    	//定义常量 const
    	public const int c1 = 5;
    	public const int c2 = c1 + 5;
        
        //这 sampleClass 怎么用的
    	public sampleClass(int p1,int p2){
    		x = p1;
    		y = p2;
    	}
    }

class Rectangle
    {
        //成员变量
        public double length;
        public double width;

        public Rectangle(double l,double w){
            this.length = l;
            this.width = w;
        }

        public double GetArea()
        {
            return length * width;
        }
        public void Display()
        {
            Console.WriteLine("length: {0}", length);
            Console.WriteLine("width: {0}", width);
            Console.WriteLine("area: {0}", GetArea());
        }
    }
class Tabletop:Rectangle{
    private double cost;
    public Tabletop(double l,double w):base(l,w){

    }

    public double GetCost(){
        // double cost;
        cost = GetArea()*70;
        return cost;
    }

    public void Display(){
        // base.Display();
        Console.WriteLine("the cost is: {0}",GetCost());
    }




}
class Rectangle1
    {
        //成员变量
        private double length;
        private double width;

// 由于成员函数 AcceptDetails() 和 Display() 被声明为 public，所以它们可以被 Main() 使用 Rectangle 类的实例 r 访问
        public void Acceptdetails()
        {
            Console.WriteLine("请输入长度：");
            length = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("请输入宽度：");
            width = Convert.ToDouble(Console.ReadLine());
        }
        public double GetArea()
        {
            return length * width;
        }
        public void Display()
        {
        	length = 3.5;
        	width = 3.6;
            Console.WriteLine("length1: {0}", length);
            Console.WriteLine("width1: {0}", width);
            Console.WriteLine("area1: {0}", GetArea());
        }
    }

class Rectangle2
    {
        //成员变量
        internal double length;
        internal double width;
        
        // 请注意成员函数 GetArea() 声明的时候不带有任何访问修饰符。如果没有指定访问修饰符，则使用类成员的默认访问修饰符，即为 private
        double GetArea()
        {
            return length * width;
        }
       public void Display()
        {
            Console.WriteLine("length2: {0}", length);
            Console.WriteLine("width2: {0}", width);
            Console.WriteLine("arae2: {0}", GetArea());
        }
    }











}

namespace first_space
{
   class namespace_cl
   {
      public void func()
      {
         Console.WriteLine("Inside first_space");
      }
   }
}
namespace second_space
{
   class namespace_cl
   {
      public void func()
      {
         Console.WriteLine("Inside second_space");
      }
   }
} 