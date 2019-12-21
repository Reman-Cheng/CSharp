using System;
using System.IO;
using System.Text;
using System.Threading;
using System.Collections;
using System.Threading.Tasks;
using System.Collections.Generic;//C#泛型命名空间
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Runtime.CompilerServices;
namespace csharp0729{
	public class HelloWord{
		public static void Main(string[] args){
			// Coffee cup = PourCoffee();
			Console.WriteLine("coffe is ready");
			foreach(string s in Directory.GetDirectories(Environment.CurrentDirectory)){
				Console.WriteLine(s);
			}
			Console.WriteLine(DateTime.Now);
			Console.WriteLine(DateTime.Now.ToLongDateString());

			int num1 = 1;
			Console.WriteLine(num1.ToString().GetType());

			Person per1 = new Person("Reman","Cheng");
			Console.WriteLine(per1);
			per1.DisplayName();

			Console.WriteLine(0x577EDE);
			double len1 = 0x577EDE;
			Console.WriteLine((len1/Math.Pow(2,23)+1)*Math.Pow(2,-16)*1000000);
			Console.WriteLine(((0x09D472)/Math.Pow(2,23)+1)*Math.Pow(2,16)/1000);
            Console.WriteLine(12.3*(2535.6967)/(Math.Pow(2,15)-1));
            Console.WriteLine(3.6*(965.796348)/(Math.Pow(2,15)-1));
            Console.WriteLine(3.6*(1932.757305)/(Math.Pow(2,15)-1));
            Console.WriteLine(12.3*(1272.228860)/(Math.Pow(2,15)-1));
            Console.WriteLine(12.3*(2545.887060)/(Math.Pow(2,15)-1));
            Console.WriteLine(3.6*(968.491893)/(Math.Pow(2,15)-1));
            Console.WriteLine(3.6*(1938.078910)/(Math.Pow(2,15)-1));
            Console.WriteLine("-------====----------");
            Console.WriteLine(3*32+7*2+0-127);
            Console.WriteLine((0x6D9A89/Math.Pow(2,23)+1)*Math.Pow(2,-17)*1000000);
            Console.WriteLine(4*32+7*2+1-127);
            Console.WriteLine((0x93358/Math.Pow(2,23)+1)*Math.Pow(2,16)/1000);
            Console.WriteLine((4807.31665008-4650.97382454)/(2023.06178126-1017.44055045)*1000);
            

		}
        public static void Func1(){
        	
        }




	}
	class Person{
		private string firstname;
		private string lastname;
		public Person(string firstname,string lastname){
               this.firstname = firstname;
               this.lastname = lastname;
		}
		public override string ToString() => $"{firstname},{lastname}".Trim();
		public void DisplayName() => Console.WriteLine(ToString());
	}





}