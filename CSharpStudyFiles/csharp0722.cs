using System;
using System.IO;
using System.Text;
using System.Threading;
using System.Collections;
using System.Collections.Generic;//C#泛型命名空间
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Runtime.CompilerServices;
// System.Collections.IEnumerator;
// System.Collections.Generic.IEnumerator<T>

namespace csharp0722
{
	class MySharp{
		static void Main(string[] args){
			#pragma warning disable 414
			Person p1 = new Person();
			Console.WriteLine(p1.level);

			Person1<string,int> p2 = new Person1<string,int>();
			p2.Name = "king";
			p2.Health = 100;
			Console.WriteLine("{0},{1}",p2.Name,p2.Health);
            
            //lambda表达式具有以下形式：(parameters) => expression
			Converter sqr = x=>x*x;
			Console.WriteLine(sqr(4));

			Converter sqr2 = x=>{return x*x*x;};
			Console.WriteLine(sqr2(3));

			Func<int,int> sqrfunc = x=>x*x;
			Console.WriteLine(sqrfunc(3));

			Func<string,string,int> totalLength = (s1, s2) => s1.Length + s2.Length;
			int total = totalLength ("a", "the"); 
			Console.WriteLine(total);
            //Func 只有一个返回值 ,最后string为返回值类型
			Func<int,int,string> thesum = staticSum;
			Console.WriteLine(staticSum(5,6));

			int factor =2;
			Func<int,int> multiplier = n=>n*factor;
			factor =4;
			Console.WriteLine(multiplier(4));
			// 由lambda表达式引用的外部变量称为捕获变量
			//捕获的变量在实际调用委托时求值，而不是在捕获变量时求值

			int outersVariable =0;
			Func<int> myLambda = ()=>outersVariable++;
			Console.WriteLine(myLambda());
			Console.WriteLine(myLambda());
			Console.WriteLine(outersVariable);

			//调用匿名方法,等同于以下lambda表达式
			Converter sqrx = delegate(int x){return x*x;};
			Console.WriteLine(sqrx);
			Console.WriteLine(sqrx(3));


			//枚举器是值的列表上的只读，只向前的光标
			using(var enumerator = "www.w3school.cn".GetEnumerator())
			while (enumerator.MoveNext()){
				var element = enumerator.Current;
				Console.WriteLine(element);
			}
			//与下面的相同
			Console.WriteLine("----------www-----------");
			foreach(char c in "www.w3school.cn"){
				Console.WriteLine(c);
			}

			//yield return语句返回该枚举器的下一个元素
			//迭代器是一个包含一个或多个 yield 语句的方法，属性或索引器
			//yield break 语句指示迭代器块应提早退出，而不返回更多元素
			foreach(string s in Foo()){
				Console.WriteLine(s);
			}

			//匿名类型是由编译器在运行时创建的一个类，用于存储一组值
			//要创建匿名类型，请使用 new 关键字，后跟对象初始值设定器，指定类型将包含的属性和值
			//例如:var person = new { Name = "Jack", Age = 23 };
			Console.WriteLine("--------var--------");
			int Age = 23;
			var person = new { Name = "Jack", Age = 23 ,Length = Age.ToString().Length};
			Console.WriteLine("{0},{1},{2}",person.Name,person.Age,person.Length);

			var a1 = new {x=1,y=4};
			var a2 = new {x=1,y=4};
			Console.WriteLine(a1.GetType());
			Console.WriteLine(a2.GetType());

			var Persons = new[]{
				new{name = "a",age = 4},
				new{name = "b",age = 4}
			};
			Console.WriteLine(Persons[0].name);
			Console.WriteLine(Persons[1].name);



			// C# 动态绑定  动态绑定会将类型，成员和操作的解析过程从编译时延迟到运行时
            // 关键字 dynamic 声明动态类型

            
            //C# 属性
            // 属性可以向代码元素添加自定义信息,我们可以使用属性标记一个类已被弃用。我们还可以标记一个接口是一个web服务的web接口
            OneMethod();


// #define symbol	定义符号
// #undef symbol	未定义符号
// #if symbol[operator symbol2]...	符号到测试运算符是==，！=，&&和||后跟＃else，＃elif和#endif
// #else	对随后的#endif执行代码
// #elif symbol[operator symbol2]	结合#else分支和#if测试
// #endif	结束条件指令
// #warning text	在编译器中输出警告文本
// #error text	在编译器中输出错误文本
// #pragma warning [disable | restore]	禁用或恢复编译器警告
// #line [number["file"] | hidden]	number指定源代码中的行; file是在计算机输出中出现的文件名;
// #region name	标记轮廓的开始
// #endregion	结束轮廓区域




            //C# XML文档
            ///<summary>Cancels a command.</summary>


// <summary>...</summary> 
// 标记类型或成员的摘要；通常是单个短语或句子。
// <remarks>...</remarks>
// 标记描述类型或成员的其他文本。
// <param name="name">...</param>
// 说明方法的参数。
// <returns>...</returns>
// 说明方法的返回值。
// <exception [cref="type"]>...</exception>
// 列出方法可能抛出的异常。
// <permission [cref="type"]>...</permission>
// 设置记录的类型或成员所需的IPermission类型。
// <example>...</example>
// 标记一个例子。
// <c>...</c>
// 标记内嵌程式码片段。
// <code>...</code>
// 标记多行代码示例。
// <see cref="member">...</see>
// 标记到另一个类型或成员的内联交叉引用。
// <seealso cref="member">...</seealso>
// 交叉引用另一个类型或成员。
// <paramref name="name"/>
// 引用<summary>或<remarks>标记中的参数
// 创建项目符号，编号或表格样式的列表。
// <para>...</para>
// 将内容格式化为单独的段落。
// <include file="filename" path="tagpath[@name="id"]">...</para>
// 合并包含文档的外部XML文件






























































        #pragma warning restore 414
		}
		static void OneMethod (
        [CallerMemberName] string memberName = null,
        [CallerFilePath] string filePath = null,
        [CallerLineNumber] int lineNumber = 0){
        
            Console.WriteLine (memberName);
            Console.WriteLine (filePath);
            Console.WriteLine (lineNumber);
        }
		public static string staticSum(int a,int b){
			int c;
			c = a+b;
			return "the sum is: "+c;
		}
		public static IEnumerable<string> Foo(){
			yield return "one";
			yield return "two";
			yield return "three";
		}





	}
	// System.Collections.IEnumerator
    // System.Collections.Generic.IEnumerator<T>
	delegate int Converter(int i);
	class Person{
		private string name = "reman";
		private string emojo = "^_^";
		private int health = 0;
		public int level = 0;
	}
	class Person1<T1,T2>{
		private T1 name;
		private T2 health;
		public T1 Name{set{name =value;}get{return name;}}
		public T2 Health{set{health =value;}get{return health;}}
		public Person1(){
              
		}
		public Person1(T1 name,T2 health){
              this.name = name;
              this.health = health;
		}
	}














}