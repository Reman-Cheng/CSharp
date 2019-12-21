using System;
using System.IO;
using System.Text;
using System.Threading;
using System.Collections;
using System.Collections.Generic;//C#泛型命名空间
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Runtime.CompilerServices;
namespace csharp0729{
	public class HelloWord{
		public static void Main(string[] args){
			if(args.Length == 0){
				Console.WriteLine("please enter a numeric argument.");
			}else{
				Console.WriteLine("let's start");
			}
	        Console.WriteLine("hello");
	        string aFriend = "Reman";
	        Console.WriteLine($"Hello {aFriend}");
	        var Person = new{name = "peace",age = 23,sex = "man"};
	        Console.WriteLine($"the man name is:{Person.name}, age is:{Person.age}, sex is:{Person.sex}");

	        string greeting = "     Hello  World !   1   ";
	        Console.WriteLine($"{greeting}");
	        Console.WriteLine($"[{greeting}]");
	        Console.WriteLine($"[{greeting.TrimStart()}]");
	        Console.WriteLine($"[{greeting.TrimEnd()}]");
	        Console.WriteLine($"[{greeting.Trim()}]");//前后都删
	        string sayHello = greeting.Replace("Hello","Greatings");
	        Console.WriteLine($"{sayHello}");
	        sayHello = greeting.Replace(" ","");
	        Console.WriteLine($"{sayHello}");
	        Console.WriteLine($"{sayHello.ToUpper()}");
	        Console.WriteLine($"{sayHello.ToLower()}");
	        Console.WriteLine($"{sayHello.Contains("Hello")}");
	        Console.WriteLine($"{sayHello.Contains("greetings")}");
	        Console.WriteLine($"{sayHello.StartsWith("greetings")}");
	        Console.WriteLine($"{sayHello.EndsWith("greetings")}");

	        int d = (7+4)/3;
	        Console.WriteLine($"{d}");
	        Console.WriteLine($"The range of integers is {int.MinValue} to {int.MaxValue}");
	        Console.WriteLine($"The range of the decimal type is {decimal.MinValue} to {decimal.MaxValue}");
            
            decimal decc = 1.0m;
            decimal decc1 = 3.0M;
            Console.WriteLine($"{decc/decc1}");
            Console.WriteLine(1.0/3.0);
            int count = 0;
            while (count < 10){
            	Console.WriteLine($"{count}");
            	count++;
            }

            var names = new List<string> { "<name>", "Ana", "Felipe" ,"Bill"};
            names.Add("Maria");
            names.Remove("An");//没有也不会报错
			foreach (var name in names)
			{
			  Console.WriteLine($"Hello {name}!");
			}
			Console.WriteLine(names.Count);
			Console.WriteLine(names[names.Count-1]);


            var index = names.IndexOf("Felipe");
			if(index != -1){
			Console.WriteLine($"The name {names[index]} is at index {index}");
		    }
		    names.Sort();
		    foreach( var name in names){
		    	Console.WriteLine($"Hello [{name}]");
		    }

		    var Feibo = new List<int>{1,1};
		    for(int i=2;i<20;i++){
		    	int Feibonum = Feibo[i-2]+Feibo[i-1];
		    	Feibo.Add(Feibonum);
		    }
		    Console.WriteLine(Feibo[19]);

		    BankAccount bankcoustmer = new BankAccount("1234567890","reman",100);
            Console.WriteLine(bankcoustmer.GetMoney(100));
            Console.WriteLine(bankcoustmer.SaveMoney(109));

            Person person1 = new Person("Bill","Willson");
            Console.WriteLine(person1);
            Console.WriteLine(person1.AllCaps());
            Console.WriteLine(person1);

            var item = (name:"eggplant",Price:1.99m,perPackage:3);
            var date = DateTime.Now;
            Console.WriteLine($"On {date}, the Price of {item.name} was {item.Price}");
            Console.WriteLine($"On {date:d}, {date:t},{item.Price:e},{item.Price:F3},{item.Price:C2}");
            // var item1 = {name:"eggplant",Price:1.99m,perPackage:3};//不能这样用，要放在列表中


            var inventory = new Dictionary<string,int>(){
            	["hammer,ball pein"] = 18,
            	["hammer,cross pein"] = 5,
            	["screwdriver, Phillips #2"] = 14
            };
            foreach(var item2 in inventory){
            	Console.WriteLine($"|{item2.Key,-25}|{item2.Value,3}|");//正数前面加空格，负数后面加空格            	
            }
            Console.WriteLine($"[{DateTime.Now,-20:d}] Hour [{DateTime.Now,-10:HH}] [{1063.342,15:N2}] feet");
            
            StackExp s = new StackExp();
	        s.Push(1);
	        s.Push(10);
	        s.Push(100);
	        Console.WriteLine(s.Pop());
	        Console.WriteLine(s.Pop());
	        Console.WriteLine(s.Pop());


	        foreach (int i in Range(-10,10)) 
		    {
		        Console.WriteLine(i);
		    }

		    Pair<int,double> pair = new Pair<int,double>(10,12.5);
		    Console.WriteLine($"{pair.First},{pair.Second}");

		    Point3D point3d = new Point3D(1,2,3);//会先运行父类的构造方法
		    Point3D1 point3d1 = new Point3D1(1,2,3);

            Color newcolor = new Color(1,2,3);
		    Console.WriteLine(Color.Black.r);//静态属于类，实例属于对象
		    Color.Black.r = 3;
		    Console.WriteLine(Color.Black.r);


		    Entity.SetNextSerialNo(1000);
	        Entity e1 = new Entity();
	        Entity e2 = new Entity();
	        Console.WriteLine(e1.GetSerialNo());            // Outputs "1000"
	        Console.WriteLine(e2.GetSerialNo());            // Outputs "1001"
	        Console.WriteLine(Entity.GetNextSerialNo());    // Outputs "1002"


            Expression exp1 = new Operation(new VariableReference("x"),'+',new Constant(3));
            F(1,1);
            int ftest = 22;
            string ftest2 = "thing";
            Console.WriteLine(F<int,string>(ftest,ftest2));

            MyList<string> list1 = new MyList<string>();
            MyList<string> list2 = new MyList<string>(10);

            MyList<string> nameMyList = new MyList<string>();
            nameMyList.Add("Liz");
            nameMyList.Add("Martha");
            nameMyList.Add("Beth");
            for(int i = 0; i<nameMyList.Count;i++){
            	string ss= nameMyList[i];
            	nameMyList[i]=ss.ToUpper();
            	Console.WriteLine(nameMyList[i]);
            }
            Console.WriteLine(nameMyList.Capacity);

            Console.WriteLine("------ArrayExample------");
            int[] arrayexample = new int[10];
            for(int i=0;i<arrayexample.Length;i++){
            	arrayexample[i]=i*i;
            }
            for(int i=0;i<arrayexample.Length;i++){
            	Console.WriteLine($"arrayexample[{i}] = {arrayexample[i]}");
            }

            
            Console.WriteLine("------MyList Int--------");
            MyList<int> myListinta = new MyList<int>();
            myListinta.Add(1);
            myListinta.Add(1);
            Console.WriteLine($"{myListinta[0]},{myListinta[1]}");

            EditBox editBox1 = new EditBox();
            editBox1.Paint();
            editBox1.SetCombo();
            editBox1.SetText("finding");
            editBox1.SetItems(new string[]{"a","b","c"});


            double[] doublea = {0.0,0.5,1.0};
            double[] squares = DelegateExample.Apply(doublea,DelegateExample.Square);
            double[] sines = DelegateExample.Apply(doublea,Math.Sin);
            Multiplier multiplier = new Multiplier(2.0);
            double[] doubleb = DelegateExample.Apply(doublea,multiplier.Multiply);

            // Console.WriteLine(0xe85d - 65536);
            // Console.WriteLine(0xe5);
            // Console.WriteLine(0xce);
            // Console.WriteLine(0x04);
            // Console.WriteLine(0x66);
            // Console.WriteLine(0x0F);
            // Console.WriteLine($"{0x2FAE},{0x5BF}");

            //静态成员属于类，实例成员属于对象


            Type widgetType = typeof(Widget);

			//Gets every HelpAttribute defined for the Widget type
			object[] widgetClassAttributes = widgetType.GetCustomAttributes(typeof(HelpAttribute), false);

			if (widgetClassAttributes.Length > 0)
			{
			    HelpAttribute attr = (HelpAttribute)widgetClassAttributes[0];
			    Console.WriteLine($"Widget class help URL : {attr.Url} - Related topic : {attr.Topic}");
			}

			System.Reflection.MethodInfo displayMethod = widgetType.GetMethod(nameof(Widget.Display));

			//Gets every HelpAttribute defined for the Widget.Display method
			object[] displayMethodAttributes = displayMethod.GetCustomAttributes(typeof(HelpAttribute), false);

			if (displayMethodAttributes.Length > 0)
			{
			    HelpAttribute attr = (HelpAttribute)displayMethodAttributes[0];
			    Console.WriteLine($"Display method help URL : {attr.Url} - Related topic : {attr.Topic}");
			}

			//更专注于功能，而不是语言的构造

			Pointstruct pointstruct = new Pointstruct();
			pointstruct.X = 3;
			pointstruct.Y = 4;
			Console.WriteLine(pointstruct);

			// await foreach(var number in GenerateSequence()){
			// 	Console.WriteLine(number);
			// }
			var phrase1 = "last for name";
			var manyPhrases = new StringBuilder();
			for (var i=0;i<10;i++){
				manyPhrases.Append(phrase1+"\n");

			}
			Console.WriteLine(manyPhrases);

			Console.WriteLine(Convert.ToInt32("27"));

			Console.WriteLine(ParamSum(5.6,7.7,6.6));

			Stud stud1 = new Stud("reman");

			



            



            




            




		            





          

















		}
		// public static async System.Collections.Generic.IAsyncEnumerable<int> GenerateSequence(){
		// 	for (int i=0;i<20;i++){
		// 		await Task.Delay(100);
		// 		// Console.WriteLine(i);
		// 		yield return i;
		// 	}
		// }
		static double ParamSum(params double[] arr){
			double sum = 0;
			for(int i=0;i<arr.Length;i++){
                 sum = sum + arr[i];
			}
			return sum;
		}
		static void F(double x,double y){
			Console.WriteLine("F double");
		}
		static void F(int x,int y){
			Console.WriteLine("F int");
		}
		static string F<T1,T2>(T1 x,T2 y){
			return x+" and "+y;
		}
		static void WriteLinesToFile(IEnumerable<string> lines){
			using (var file = new System.IO.StreamWriter("/Users/swqt/Desktop/WriteLines2.txt")){
				foreach(string line in lines){
					if(!line.Contains("Second")){
						file.WriteLine(line);
					}
				}
			}
		}

		public struct Pointstruct{
			public double X{get;set;}
			public double Y{get;set;}
			public double Distance => Math.Sqrt(X*X+Y*Y);
			public override string ToString()=>
			$"({X},{Y}) is {Distance} from the origin";
		}

		public class HelpAttribute:Attribute{
			private string url;
			private string topic;
			public HelpAttribute(string url){
				this.url = url;
			}
			public string Url => url;

			public string Topic{
				set{topic = value;}
				get{return topic;}
			}
		}
		[Help("https://docs.microsoft.com/dotnet/csharp/tour-of-csharp/attributes")]
		public class Widget{
			[Help("https://docs.microsoft.com/dotnet/csharp/tour-of-csharp/attributes",Topic = "Display")]
			public void Display(string text){}
		}




		delegate double Function(double x);
		class Multiplier{
	        private double factor;
			public Multiplier(double factor){
				this.factor = factor;
			}
			public double Multiply(double x){
				return x*factor;
			}
		}
		class DelegateExample{
			public static double Square(double x){
				return x*x;
			}
			public static double[] Apply(double[] a, Function f){
				double[] result = new double[a.Length];
				for(int i=0;i<a.Length;i++){
					result[i] = f(a[i]);
					Console.WriteLine(result[i]);
				}
				return result;
			}
		}


		interface IControl{
			void Paint();
		}
		interface ITextBox:IControl{
			void SetText(string text);
		}
		interface IListBox:IControl{
			void SetItems(string[] items);
		}
		interface IComboBox:ITextBox,IListBox{
			void SetCombo();
		}
		class EditBox:IComboBox{
			public void Paint(){
               Console.WriteLine("the Paint");
			}
			public void SetText(string text){
               Console.WriteLine($"the SetText {text}");
			}
			public void SetItems(string[] items){
               foreach(var temp in items){
               	Console.WriteLine(temp);
               }
			}
			public void SetCombo(){
               Console.WriteLine("the SetCombo");
			}
		}


		// 实例构造函数是实现初始化类实例所需执行的操作的成员
		// 静态构造函数是实现在首次加载类时初始化类本身所需执行的操作的成员
        class MyList<T>{//索引器，能够自动扩容
        	const int defaultCapacity = 4;
        	T[] items;
        	int count;
        	public MyList(int capacity = defaultCapacity){
        		this.items = new T[capacity];
        	}
        	public int Count => count;
            // 属性是字段的自然扩展
        	public int Capacity{
        		get{return items.Length;}
        		set{
        			if(value<count){value = count;}
        			if(value!= items.Length){
        				T[] newItems = new T[value];
        				Array.Copy(items,0,newItems,0,count);
        				items = newItems;
        			}
        		}
        	}
        	public T this[int index]{
        		get{return items[index];}
        		set{items[index] = value;
        			OnChanged();}
        	}
        	public void Add(T item){
        		if(count == Capacity){Capacity = count * 2;}
        		items[count] = item;
        		count++;
        		OnChanged();
        	}
        	protected virtual void OnChanged()=>Changed?.Invoke(this,EventArgs.Empty);
        	public override bool Equals(object other)=>Equals(this,other as MyList<T>);

        	static bool Equals(MyList<T> a,MyList<T> b){
        		if(Object.ReferenceEquals(a,null)) return Object.ReferenceEquals(b,null);
        		if(Object.ReferenceEquals(b,null) || a.count != b.count) return false;
        		for(int i=0;i<a.count;i++){
        			if(!object.Equals(a.items[i],b.items[i])){
        				return false;
        			}
        		}
        		return true;
        	}
        	public event EventHandler Changed;

        	public static bool operator == (MyList<T> a,MyList<T> b)=> Equals(a,b);
        	public static bool operator != (MyList<T> a,MyList<T> b)=> !Equals(a,b);

        }
		class Entity
		{
		    static int nextSerialNo;
		    int serialNo;
		    public Entity() 
		    {
		        serialNo = nextSerialNo++;
		    }
		    public int GetSerialNo() 
		    {
		        return serialNo;
		    }
		    public static int GetNextSerialNo() 
		    {
		        return nextSerialNo;
		    }
		    public static void SetNextSerialNo(int value) 
		    {
		        nextSerialNo = value;
		    }
		}

		public class Color
		{
		    public static readonly Color Black = new Color(0, 0, 0);
		    public static readonly Color White = new Color(255, 255, 255);
		    public static readonly Color Red = new Color(255, 0, 0);
		    public static readonly Color Green = new Color(0, 255, 0);
		    public static readonly Color Blue = new Color(0, 0, 255);
		    // private byte r, g, b;
		    public byte r, g, b;
		    public Color(byte r, byte g, byte b) 
		    {
		        this.r = r;
		        this.g = g;
		        this.b = b;
		        Console.WriteLine($"{this.r},{this.g},{this.b}");
		    }
		    public Color(){

		    }
		}

		public class Point1{
			protected int x,y;
			public Point1(int x,int y){
				this.x = x;
				this.y = y;
				Console.WriteLine("the Point1 class");
			}
		}
		public class Point3D1:Point1{
			private int z;
			public Point3D1(int x,int y,int z):base(x,y){
				this.z = z;
				Console.WriteLine("the Point3D1 class");
			}
		}

		public class Point{
			private int x,y;
			public Point(int x,int y){
				this.x = x;
				this.y = y;
				Console.WriteLine("the Point class");
			}
		}
		public class Point3D:Point{
			private int z;
			public Point3D(int x,int y,int z):base(x,y){
				this.z = z;
				Console.WriteLine("the Point3D class");
			}
		}

		public class Pair<T1,T2>{
			public T1 First;
			public T2 Second;
			public Pair(T1 first,T2 second){
				this.First = first;
				this.Second = second;
			}
		}
		static IEnumerable<int> Range(int from, int to) 
		{
		    for (int i = from; i < to; i++) 
		    {
		        yield return i;//return 后继续执行
		    }
		    // yield break;
		}

		class StackExp{
			Entry top;
			public void Push(object data){
				top = new Entry(top,data);
			}
			public object Pop(){
				if(top == null){
					throw new InvalidOperationException();
				}
				object result = top.data;
				top = top.next;
				return result;
			}
			class Entry{
				public Entry next;
				public object data;
				public Entry(Entry next,object data){
					this.next = next;
					this.data = data;
				}
			}
		}
		class BankAccount{
			private string accountId;
			private string name;
			private double money;

			public string AccountId{
				set{accountId = value;}
				get{return accountId;}
			}
			public string Name{
				set{name = value;}
				get{return name;}
			}
			public double Money{
				set{money = value;}
				get{return money;}
			}
			public BankAccount(string accountId,string name,double money){
                this.accountId = accountId;
                this.name = name;
                this.money = money;
			}
			public BankAccount(){

			}

			public string SaveMoney(double valuemoney){
				money = money + valuemoney;
				Console.WriteLine("you save money: "+valuemoney);
                return "the last money: "+money;
			}
			public string GetMoney(double valuemoney){
				if(money - valuemoney >= 0){
					Console.WriteLine("you get money: "+valuemoney);
					money = money - valuemoney;
				}else{
					Console.WriteLine("the money is not enough!");
				}	
                return "the last money: "+money;
			}
		}
		class Person{
			public string FirstName{get;private set;}
			public string LastName{get;private set;}
			public string MiddleName{get;} = "";

			public Person(string first,string last,string middle){
				this.FirstName = first;
				this.LastName = last;
				this.MiddleName = middle;
			}

			public Person(string first,string last){
				this.FirstName = first;
				this.LastName = last;
			}

			public override string ToString(){
				return FirstName+" "+LastName;
			}
			public string AllCaps(){
				// FirstName = FirstName.ToUpper();
				// LastName = LastName.ToUpper();
				return ToString().ToUpper();
			}
		}
		class Person1{
			private string king;
			public Person1(){
                 Console.WriteLine("the father Person1");
			}
			public Person1(string king){
				this.king = king;
                 Console.WriteLine("the father Person1 king");
			}
		}
		class Stud:Person1{
			public string name;
			public Stud(){
				Console.WriteLine("the children Stud");
			}
			public Stud(string name){
				this.name = name;
				Console.WriteLine("the children name");
			}
		}






	}
	public abstract class Expression{
		public abstract double Evaluate(Dictionary<string,object> vars);
	}
	public class Constant:Expression{
		double value;
		public Constant(double value){
            this.value = value;
		}
		public override double Evaluate(Dictionary<string,object> vars){
			return value;
		}
	}
	public class VariableReference:Expression{
		string name;
		public VariableReference(string name){
			this.name = name;
		}
		public override double Evaluate(Dictionary<string,object> vars){
			object value = vars[name];
			if(value == null){
				throw new Exception("Unknown variable: "+ name);
			}
			return Convert.ToDouble(value);
		}
	}
	public class Operation:Expression{
		Expression left;
		char op;
		Expression right;
		public Operation(Expression left,char op,Expression right){
			this.left = left;
			this.op = op;
			this.right = right;
		}
		public override double Evaluate(Dictionary<string,object> vars){
			double x = left.Evaluate(vars);
			double y = right.Evaluate(vars);
			switch(op){
				case '+':return x+y;
				case '-':return x-y;
				case '*':return x*y;
				case '/':return x/y;
			}throw new Exception("Unknown operator");
		}
	}






}