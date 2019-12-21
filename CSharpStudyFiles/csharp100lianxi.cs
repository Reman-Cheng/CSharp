using System;
using System.IO;
using System.Text;
using System.Threading;
using System.Collections;
using System.Collections.Generic;//C#泛型命名空间
using System.Text.RegularExpressions;
using System.Security.Cryptography;
namespace csharp100lianxi
{
    struct Point{
            private double x;
            private double y;

            public double X{get{return x;}set{x=value;}}
            public double Y{get{return y;}set{y=value;}}
            public Point(double x,double y){
                this.x=x;this.y=y;//结构的构造函数中必须要对结构体的每一个字段赋值
                // Console.WriteLine("the x value is:{0},the y value is:{1}",x,y);
            }
        }
	class HelloWorld{
		static void Main(string[] args){
		// 1.有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数？都是多少？


		// 2.利润(I)低于或等于10万元时，奖金可提10%；
		// 利润高于10万元，低于20万元时，低于10万元的部分按10%提成，高于10万元的部分，可提成7.5%；
		// 20万到40万之间时，高于20万元的部分，可提成5%；
		// 40万到60万之间时高于40万元的部分，可提成3%；
		// 60万到100万之间时，高于60万元的部分，可提成1.5%；
		// 高于100万元时，超过100万元的部分按1%提成。
		// 从键盘输入当月利润I，求应发放奖金总数？
			int numberMoney = 1200000;double liRun;
			if(numberMoney<=100000){
				liRun = numberMoney*0.1;
			}else if(numberMoney<200000){
				liRun = (numberMoney-100000)*0.075+10000;
			}else if(numberMoney<400000){
				liRun = (numberMoney-200000)*0.05+17500;
			}else if(numberMoney<600000){
				liRun = (numberMoney-400000)*0.03+27500;
			}else if(numberMoney<1000000){
				liRun = (numberMoney-600000)*0.015+33500;
			}else{
			    liRun = (numberMoney-1000000)*0.01+39500;
			}
			Console.WriteLine("the liRun value is:{0}",liRun);

		// 3.一个整数，它加上100后是一个完全平方数，再加上168又是一个完全平方数，请问该数是多少？
		    for(int i=2;i<=85;i++){
		    	for(int j=2;j<=168/i;j++){
		    		if((i>j && i*j ==168)&& ((i%2==0 & j%2==0)|(i%2==1 & j%2==1)) && ((i+j)/2)*((i+j)/2)>268 && ((i-j)/2)*((i-j)/2)>100){
		    			Console.WriteLine(i+" "+j);				
		    			Console.WriteLine("the zhengshu vaule is:{0}",((i+j)/2)*((i+j)/2)-268);
		    		}
		    	}
		    }

		// 4.输入某年某月某日，判断这一天是这一年的第几天？year%400==0||(year%4==0&&year%100!=0)
		Console.WriteLine("please input year/mouth/day");
		// string input = Convert.ToString(Console.ReadLine());
		string input = "2019/06/25";
		Console.WriteLine(input);
        MatchCollection inputMatch = Regex.Matches(input,@"\d+");
        foreach(Match temp in inputMatch){
        	Console.WriteLine(temp);
        }
        string year1 = inputMatch[0].ToString();
        Console.WriteLine(year1.GetType());
        string mouth1 = inputMatch[1].ToString();
        Console.WriteLine(mouth1.GetType());
        string day1 = inputMatch[2].ToString();
        Console.WriteLine(day1.GetType());
        int year = Convert.ToInt32(year1);
        int mouth = Convert.ToInt32(mouth1);
        int day = Convert.ToInt32(day1);
        Console.WriteLine(year.GetType());
        Console.WriteLine(mouth.GetType());
        Console.WriteLine(day.GetType());
        
        int[] yearRun = new int[]{31,29,31,30,31,30,31,31,30,31,30,31};
        int[] yearPin = new int[]{31,28,31,30,31,30,31,31,30,31,30,31};
        int sumDay = 0;
        if(year%400 == 0 && (year%4 == 0 && year%100 != 0)){               
               for(int i=0;i<mouth-1;i++){
               	sumDay = sumDay + yearRun[i];
               }
               sumDay = sumDay + day;
        }else{       	  
               for(int i=0;i<mouth-1;i++){
               	sumDay = sumDay + yearPin[i];
               }
               sumDay = sumDay + day;
        }
        Console.WriteLine(sumDay);


        // 5.输入三个整数x,y,z，请把这三个数由小到大输出
        // Console.WriteLine("qing shu ru di yi ge shu");
        // int inputX = Convert.ToInt32(Console.ReadLine());
        // Console.WriteLine("qing shu ru di er ge shu");
        // int inputY = Convert.ToInt32(Console.ReadLine());
        // Console.WriteLine("qing shu ru di san ge shu");
        // int inputZ = Convert.ToInt32(Console.ReadLine());
        int inputX = 14,inputY = 5,inputZ = 16;
        int[] inputarr = new int[]{inputX,inputY,inputZ};
        Array.Sort(inputarr);
        foreach(int temp in inputarr){
        	Console.WriteLine(temp);
        }


        // 6.：用*号输出字母C的图案
        Console.WriteLine("   * * *    ");
        Console.WriteLine(" * * * * *  ");
        Console.WriteLine("* *     * * ");
        Console.WriteLine("* *         ");
        Console.WriteLine("* *         ");
        Console.WriteLine("* *         ");
        Console.WriteLine("* *     * * ");
        Console.WriteLine(" * * * * *  ");
        Console.WriteLine("   * * *    ");
        

        // 8.输出9*9口诀
        for(int i=1;i<10;i++){
        	for(int j=i;j>=1;j--){
               Console.Write("{0}*{1}:= {2:D2}  ",i,j,i*j);
        	}
        	Console.WriteLine();
        }

        // 9.要求输出国际象棋棋盘


        // 10.打印楼梯，同时在楼梯上方打印两个笑脸


        // 11.古典问题（兔子生崽）：有一对兔子，从出生后第3个月起每个月都生一对兔子，
        // 小兔子长到第三个月后每个月又生一对兔子，假如兔子都不死，
        // 问每个月的兔子总数为多少？（输出前40个月即可）
        // 兔子的规律为数列1,1,2,3,5,8,13,21....，即下个月是上两个月之和（从第三个月开始)

        // 12.判断101到200之间的素数
        // 判断素数的方法：用一个数分别去除2到sqrt(这个数)，如果能被整除， 则表明此数不是素数，反之是素数。
        for(int i=101;i<=200;i++){
        	bool isShuShu = true;
        	for(int j=2;j<=Math.Sqrt(i);j++){
        		if(i%j == 0){
        			isShuShu = false;
        			break;
        		}
        	}
        	if(isShuShu== true){
        		Console.Write(i+" ");
        	}
        }
        Console.WriteLine();


        // 13.打印出所有的"水仙花数"，所谓"水仙花数"是指一个三位数，其各位数字立方和等于该数 本身。
        // 例如：153是一个"水仙花数"，因为153=1的三次方＋5的三次方＋3的三次方。
        // 程序分析：利用for循环控制100-999个数，每个数分解出个位，十位，百位。
        // Console.WriteLine(Math.Pow(5,2));
        for(int i=100;i<=999;i++){
        	int bai = i/100;
        	int shi = (i%100)/10;
        	int ge = i%10;
        	if(Math.Pow(bai,3)+Math.Pow(shi,3)+Math.Pow(ge,3)==i){
        		Console.Write(i+" ");
        	}
        }
        Console.WriteLine();


		// 14.将一个正整数分解质因数。例如：输入90,打印出90=2*3*3*5。
		// 程序分析：对n进行分解质因数，应先找到一个最小的质数k，然后按下述步骤完成：
		// (1)如果这个质数恰等于（小于的时候，继续执行循环）n，则说明分解质因数的过程已经结束，另外 打印出即可。
		// (2)但n能被k整除，则应打印出k的值，并用n除以k的商,作为新的正整数n.重复执行第二步。
		// (3)如果n不能被k整除，则用k+1作为k的值,重复执行第一步。
		// int inputFenJie = Convert.ToInt32(Console.ReadLine());
		int inputFenJie = 100;
		int kFenjie = 1;
		Console.Write("{0}=1",inputFenJie);
		while(kFenjie<inputFenJie){
			for(int i=2;i<=inputFenJie;i++){
                if(inputFenJie%i == 0){
                	inputFenJie = inputFenJie/i;
                	kFenjie =i;
                	Console.Write("*{0}",i);
                	break;
                }
		    }
		}
		Console.WriteLine();


		// 15.利用条件运算符的嵌套来完成此题：学习成绩>=90分的同学用A表示，60-89分之间的用B表示，60分以下的用C表示。
        //程序分析：(a>b)?a:b这是条件运算符的基本例子
        int intputscore = 87;
        string strscore = (intputscore>60)?((intputscore>=90)?"A":"B"):"C";
        Console.WriteLine(strscore);


        // 16.输入两个正整数m和n，求其最大公约数和最小公倍数。
// （1）最小公倍数=输入的两个数之积除于它们的最大公约数，关键是求出最大公约数；
// （2）求最大公约数用辗转相除法（又名欧几里德算法）
// 1）证明：设c是a和b的最大公约数，记为c=gcd(a,b),a>=b,
// 令r=a mod b
// 设a=kc，b=jc，则k，j互素，否则c不是最大公约数
// 据上，r=a-mb=kc-mjc=(k-mj)c
// 可知r也是c的倍数，且k-mj与j互素，否则与前述k，j互素矛盾,
// 由此可知，b与r的最大公约数也是c，即gcd(a,b)=gcd(b,a mod b)，得证。
// 2）算法描述：
// 第一步：a ÷ b，令r为所得余数（0≤r 第二步：互换：置 a←b，b←r，并返回第一步。
        int inputnuma = 12,inputnumb = 26;
        int inputsum = inputnuma*inputnumb;
        if(inputnuma<inputnumb){
        	int inputtemp;
        	inputtemp = inputnumb;
        	inputnumb = inputnuma;
        	inputnuma = inputtemp;
        }
        int outputr = inputnuma%inputnumb;
        while(outputr!=0){
        	inputnuma = inputnumb;
        	inputnumb = outputr;
        	outputr = inputnuma%inputnumb;
        }
        int maxGongYue = inputnumb;
        int minGongBei = inputsum/maxGongYue;
        Console.WriteLine("the maxGongYue value is:{0},the minGongBei value is:{1}",maxGongYue,minGongBei);
		
		// 17.：输入一行字符，分别统计出其中英文字母、空格、数字和其它字符的个数
		// 程序分析：利用while语句,条件为输入的字符不为'\n'


		// 18.一个数如果恰好等于它的因子之和，这个数就称为"完数"。例如6=1＋2＋3.编程找出1000以内的所有完数
        for(int i=1;i<=1000;i++){
        	int yinZiSum = 0;
        	for(int j=1;j<i;j++){
        		if(i%j == 0){
        			yinZiSum = yinZiSum + j;
        			// Console.WriteLine(yinZiSum);
        		}
        	}
        	if(yinZiSum == i){
        	   Console.Write("the value is:{0}=1",i);
        	   for(int j=2;j<i;j++){
	        	   	if(i%j == 0){
	        	   		Console.Write("+{0}",j);
	        	    }
        	    }
                Console.WriteLine();
            }
        }


        // 21.猴子吃桃问题
        // 1) 设x1为前一天桃子数，设x2为第二天桃子数， 则：
        // x2=x1/2-1, x1=(x2+1)*2
        // x3=x2/2-1, x2=(x3+1)*2
        // 以此类推： x前=(x后+1)*2
        // 2) 从第10天可以类推到第1天，是一个循环过程 1534
        int monkyNum = 1;
        for(int i=1;i<=9;i++){
            monkyNum = (monkyNum+1)*2;
        }
        Console.WriteLine(monkyNum);

        // 22.两个乒乓球队进行比赛，各出三人。甲队为a,b,c三人，乙队为x,y,z三人。已抽签决定比赛名单
        // 有人向队员打听比赛的名单。a说他不和x比，c说他不和x,z比，请编程序找出三队赛手的名单


        // 24.有一分数序列：2/1，3/2，5/3，8/5，13/8，21/13...求出这个数列的前20项之和
        // 程序分析：请抓住分子与分母的变化规律   32.660263
        int[] shulieint1 = new int[20];
        int[] shulieint2 = new int[20];
        double[] shuLieArr = new double[20];
        shulieint1[0] = 2;shulieint1[1]=3;
        shulieint2[0] = 1;shulieint2[1]=2;
        for(int i=2;i<=19;i++){
            shulieint1[i] = shulieint1[i-1]+shulieint1[i-2];
            shulieint2[i] = shulieint2[i-1]+shulieint2[i-2]; 
        }
        double shuLieArrSum = 0;
        for(int i=0;i<=19;i++){
            shuLieArr[i] = (double)shulieint1[i]/(double)shulieint2[i];
            shuLieArrSum = shuLieArrSum + shuLieArr[i];
        }
        Console.WriteLine("{0:N6}",shuLieArrSum);


        // 25.求1+2!+3!+...+20!的和
        // 程序分析：此程序只是把累加变成了累乘。 2561327494111820313
        ulong jieChengSum = 0;
        for(ulong i=1;i<=20;i++){
             jieChengSum = jieChengSum+JieCheng(i);
        }
        Console.WriteLine(jieChengSum);
        Console.WriteLine(JieCheng(40));


       // 29.：给一个不多于5位的正整数，要求：一、求它是几位数，二、逆序打印出各位数字
       // 程序分析：学会分解出每一位数，如下解释
        string inputZZShu = "5679825";
        Console.WriteLine(inputZZShu.Length);
        int inputZZShuint = Convert.ToInt32(inputZZShu);
        for(int i=1;i<=inputZZShu.Length;i++){
            Console.Write(inputZZShuint%10);
            inputZZShuint = inputZZShuint/10;
        }
        Console.WriteLine();

       // 30.一个5位数，判断它是不是回文数。即12321是回文数，个位与万位相同，十位与千位相同

       // 32.删除一个字符串中的指定字母，如：字符串 "aca"，删除其中的 a 字母
        string straca = "aca";
        straca.Replace("a"," ");
        Console.WriteLine(straca);

        // 35.字符串反转，如将字符串 "www.runoob.com" 反转为 "moc.boonur.www" 
        string runoob = "www.runoob.com";
        for(int i=runoob.Length-1;i>=0;i--){
            Console.Write(runoob[i]);
        }
        Console.WriteLine();

        // 39.有一个已经排好序的数组。现输入一个数，要求按原来的规律将它插入数组中
        int?[] sortArray1 = new int?[]{14,55,3,67,88,66}; 
        Array.Sort(sortArray1);
        sortArray1.SetValue(45,5);
        foreach(var temp in sortArray1){
            Console.Write(temp+" ");
        }
        Console.WriteLine();

        // 54.取一个整数 a 从右端开始的 4～7 位
        int zhengshua = 256132749;
        string zhengshuastr = Convert.ToString(zhengshua);
        string outzhengshuastr = zhengshuastr.Substring(zhengshuastr.Length-7,4);
        Console.WriteLine(outzhengshuastr);


        // 61.打印出杨辉三角形（要求打印出10行）
        // 1
        // 1    1
        // 1    2    1
        // 1    3    3    1
        // 1    4    6    4    1


        // 76.编写一个函数，输入n为偶数时，调用函数求1/2+1/4+...+1/n,当输入n为奇数时，调用函数1/1+1/3+...+1/n
        int ncall=9;
        double sumcall=0.0;
        if(ncall%2==0){
        for(int i=2;i<=ncall;i+=2){
            sumcall = sumcall + (1/(double)i);
        }
        }else{
            for(int i=1;i<=ncall;i+=2){
            sumcall = sumcall + (1/(double)i);
        }
        }
        Console.WriteLine("the sumcall value is: {0}",sumcall);


        // 79.字符串排序



        // 82.八进制转换为十进制



        // 83.求0—7所能组成的奇数个数
        int outParam = 0;
        outPara(out outParam);
        Console.WriteLine(outParam);
        refPara(ref outParam);
        Console.WriteLine(outParam);

        Person p = new Person(13,"reman");

        //部分类
        //可以使用partial关键字声明相同名称的类
        Person1 p1 = new Person1(22,"Reman");
//  所以部分类的特点：
// ①必须在同一个命名空间下的使用Partial关键字的同名类
// ②部分类其实就是一个类，C#编译器会把它们编译成一个类
// ③在一个伙伴类中定义的变量可以在另一个伙伴类中访问(因为他们就是一个类)。


        //Const关键字和Readonly关键字的区别
const string strName = "qiangzi";
Console.WriteLine("my name is "+strName);
//定义的常量并没有出现在反编译的代码中，而且使用Const常量的地方被常量代替了


        cat cat1 = new cat();//readonly关键字
//readonly修饰的变量是在被调用的时候在构造函数中被赋值的，那么我们可以在构造函数中修改readonly的默认值

// readonly和const的区别：
// const常量在声明的时候就必须赋初始值，这样声明变量可以提高程序的运行效率。
// 而readonly变量声明时可以不赋初始值，但一定要zai构造函数中赋初始值。

        Direction dr = Direction.east;
        Console.WriteLine("the enum Direction value is:{0}",dr);
        int getdrnumber = (int)dr;
        Console.WriteLine(getdrnumber);

        Point point1 = new Point(10,10);
        Console.WriteLine(point1.X);
        Console.WriteLine(point1.GetType());
// ①无论如何，C#编译器都会为结构生成无参数的构造函数；
// ②结构中的字段不能赋初始值；
// ③在结构的构造函数中必须要对结构体的每一个字段赋值；
        //当我们不声明显式的构造函数时，可以不对成员字段赋值，但是一旦声明了构造函数，就要对所有的成员字段赋值
// ④在构造函数中对属性赋值不认为对字段赋值，属性不一定去操作字段；
        
        Point1 point11 = new Point1(15);
        Console.WriteLine(point11);
        Console.WriteLine(point11.X);
// ①当我们要表示一个轻量级的对象，就可以定义结构体，提高访问速度。
// ②根据传值的影响来选择，当要传递的引用就定义类，当要传递的是"拷贝"就定义结构体。


// 静态成员和实例成员的区别：
        //1. 实例成员属于对象，需要通过"对象名.实例成员"来访问
        HelloWorld helloworld = new HelloWorld();
        Console.WriteLine(helloworld.jiechengint(5));
        Console.WriteLine(JieCheng(6));//静态方法可以直接访问
        Console.WriteLine(HelloWorld.JieCheng(6));
    //静态成员属于类，可以直接通过"类名.静态成员"的方式访问
        staticPerson.Run();
    //实例成员属于对象，需要通过"对象名.实例成员"来访问
        staticPerson staticperson = new staticPerson();
        staticperson.sing();

    //当类第一次被加载的时候（就是该类第一次被加载到内存当中），该类下面的所有静态的成员都会被加载。
    //实例成员有多少对象，就会创建多少对象,而静态成员只被加载到静态存储区，只被创建一次，且直到程序退出时才会被释放。


// 什么时候定义静态的成员变量呢？
// ①变量需要被共享的时候②方法需要被反复的调用的时候

// 在静态方法中不能直接调用实例成员
// 当类第一次被加载的时候，静态成员已经被加载到静态存储区，此时类的对象还有可能能没有创建，所以静态方法中不能调用类成员字段

// ②可以创建类的对象指明对象的成员在静态方法中操作

// ③在实例成员中肯定可以调用静态方法，因为这个时候静态成员肯定存在


    //四，静态类
//①静态类被static关键字修饰
//②静态类中只能声明静态的成员变量，否则会报错（因为访问该实例成员的时候，类的对象可能还没有被创建）
//③静态类中不能有实例的构造函数（如果有实例的构造函数，则该静态类能被实例化，都是静态成员，没有实例成员被调用）
//④静态类不能被继承，反编译刚才的两个类，结果如下：

//会发现静态类的本质是一个抽象密封类，所以不能被继承和实例化。所以，静态类的构造函数，不能有访问修饰符

// 那么什么时候声明静态类呢？

// 如果这个类下面的所有成员的都需要被共享，可以把这个类声明为静态类。

// 且在一般对象中不能声明静态类型的变量（访问该静态变量时，可能该对象还没有被创建）。

//静态类可以有静态的构造函数（且所有类都可以有静态的构造函数）

        cat1 cat11 = new cat1();
        Console.WriteLine(cat11.GetType());
        Console.WriteLine(cat11);
// 由此我们可以知道，静态的构造函数会先于实例构造函数执行
// 说明静态的构造函数只执行了一次。


        //继承
// 由此我们可以发现子类继承了父类的所有成员包括Private和Protect，并为这些成员开辟了空间来存储
//所以虽然子类为父类的所有成员在堆中都开辟了空间，但是父类的私有成员（Private）子类访问不到，
//而受保护的成员（protected）可以通过实例化对象访问的到

        Student stud1 = new Student();
        stud1.Address("five","beijing");
// 很容易的可以发现，当创建子类对象的时候

// ①先调用了子类的构造函数

// ②调用了父类的构造函数

// ③执行了父类的构造函数

// ④执行了子类的构造函数
// 也就是说只要在子类显式的声明了无参的构造函数，在实例化子类的对象是，子类的无参构造函数都会去调用父类无参的构造函数。
// 那么，如果父类没有这个无参的构造函数则会报错。

// 因为在父类中有参数的构造函数覆盖了无参数的构造函数，所以在子类的无参数的构造函数没办法回调父类的无参数的构造函数初始化父类的成员变量。所以报错。

//// 那么在初始化子类的时候，为什么要调用父类的构造函数呢？
//// 在初始化子类之前需要通过构造函数初始化父类的成员变量

// 父类的构造函数先于子类的构造函数执行的意义是什么呢？
// 当在父类的构造函数中和子类的构造函数中为父类的非私有成员变量赋不同默认值。
// 当实例化子类，子类要调用构造函数初始化成员变量，如果先执行了子类的构造函数，再执行父类的构造函数，父类成员字段的值会覆盖子类成员字段的值。
// 但是我们想得到的是子类的属性值。所以为了解决数据冲突，父类的构造函数要先于子类的构造函数执行。

//// 既然子类继承了父类的这些非私有成员，那么父类对象也就可以在子类对象中调用这些非私有成员。所以，子类对象可以替换父类对象的位置。
// 三，子类是否可以有和父类的同名方法
// 既然子类可以定义和父类同名的方法，那么是否可以定同名的字段呢？答案是肯定的，而且会像同名方法一样，子类同名字段会隐藏父类同名的字段。
        work work1 = new work();
        work1.Hello();
        work1.Run();

        //解析里氏替换原则，虚方法
// 就满足了里氏替换原则。子类的Student对象，替换了父类Person对象的位置。


// 1.当一个父类的变量指向一个子类对象的时候(Person p = new Student()),只能通过这个父类变量调用父类成员(p.父类成员)，子类独有的成员无法调用(无法调用p.子类独有的成员)。
// 子类的变量是不可以指向一个父类的对象的(Student stu != new Person())
// 当父类变量指向一个子类对象的时候(Person p = new Student())，可以把父类的变量转化成子类的对象(Student stu =(Student)p)
        Person2 p2 = new Student();
        p2.Sing();//①没有使用任何关键字：执行了父类的Sing()方法；
        p2.Sing1();//②使用virtual和override关键字,直接到子类去执行override关键字修饰的Sing1()方法
        p2.Sing2();//3.如果子类找不到override方法，则会回溯到该子类的父类去找是否有override方法，直到回溯到自身的虚方法，并执行。
        Student stu2 = (Student)p2;
        stu2.Sing();


// 关于引用类型的两种转换方式：
        //将指向子类对象的变量转化成子类类型
        Student s2 = (Student)p2;

        //使用as关键字，转换失败返回一个null值
        Student s3 = p2 as Student;
// 使用as关键字和第一种强制转换的区别就是，第一种如果转换失败会抛异常，第二种转换失败则返回一个null值


        // 解析抽象类，抽象方法
// 多态：1.将父类类型作为方法参数，将父类类型作为返回值
//      2.屏蔽多个子类的不同，将多个子类当成父类来统一处理   


// 1)抽象类中可以拥有不是抽象的抽象成员，为了继承给他的子类调用 (抽象类就是为了定义抽象成员，继承给子类去实现，同时子类也可以调用父类的非抽象成员)
// 2)抽象类中可以有virtual修饰的虚方法,抽象类就是为了定义抽象成员，继承给子类去实现，所以子类也可以实现抽象类中的虚方法。
// 3)抽象类不能实例化，因为有抽象成员，而抽象成员没有方法体
// 4)抽象成员不能私有，如果私有子类没有办法访问
// 5)子类必须重写父类的抽象方法
// 6)在子类中没有办法通过base关键字调用父类抽象方法,抽象类的抽象方法没有实现语句，就算调用也没有意义。但是可以使用base关键字调用非抽象方法
         //Person3 p3 = new Person3();无法创建抽象类或接口的实例 Cannot create an instance of the abstract class or interface
         Student3 stu3 = new Student3();
         stu3.Run();
// 1）抽象方法必须定义在抽象类中
// 2）抽象方法必须使用关键字修饰
// 3) 抽象方法不能有方法体，而继承的子类必须实现抽象方法    

// 那么什么时候使用抽象类呢？

// ①子类必须重写父类的方法（相当于定义了一个标准，规范）
// ②父类没有必要实例化，就用抽象类
// ③抽象类是为了继承，为了多态      


        // 解析接口. 关于面向对象中最重要的一个概念——接口
// C#是有规定使用Interface关键字来声明接口。它的声明是和类一致的。可以说接口就是一个特殊的抽象类


// 在普通的类中，可以有字段，属性，方法，索引器，抽象方法等等。那么接口呢？
// 1.接口可以声明自动属性2.接口就是一个抽象类，当然可以定义抽象方法，但是不再使用abstract关键字，而且方法必须没有方法体；

// 2）继承接口的子类必须实现接口的所有抽象成员
         Runable runable = new Runable();
         runable.Run();
// ①我们的继承类在实现接口成员的时候不需要使用override关键字

// ②实现接口的时候，必须保持签名一致


// 什么时候使用抽象类，什么时候使用接口呢？
// ①使用抽象类：可以找到父类，并且希望通过父类继承给子类一些成员

// ②使用接口：接口就是一个纯粹的为了规范实现的类。比如：多个类具有相同的方法，但是却找不到父类，就可以将方法定义在接口中。让这些类去实现。
        
         //显式实现接口，这个接口的方法，只能通过接口变量来调用。
         //里氏替换原则，父类变量指向子类对象，并通过父类变量调用子类方法
         IRunable ir = new XianShi();
         ir.strName = "xiaoxuesheng";
         ir.Run();
         Console.WriteLine(ir.strName);
// 1.接口是一个特殊的抽象类
// 2.接口成员默认是抽象的
// 3.只能定义属性，方法，索引器，事件
// 4.接口中抽象成员不能有访问修饰符，默认为public
// 5.继承接口的子类必须实现接口的所有抽象成员
// 6.继承类在实现接口成员的时候不需要使用override关键字
// 7.实现接口的时候，必须保持签名一致
// 8.接口就是一个纯粹为了规范的实现类





















        }
        class XianShi:IRunable{
            //这里是子类的字段
            string strname;
            //显示实现接口
            string IRunable.strName{
                set{strname = value;}
                get{return strname;}
            }
            void IRunable.Run(){
                Console.WriteLine("I'm XianShi, I'm running in the school.");
            }
        }
        interface IRunable{
            //The modifier `abstract' is not valid for this item 修饰符“abstract”对此项无效
            //规范子类必须实现strName属性
            string strName{get;set;}
            //规范子类必须实现Run()方法
            void Run();
        }
        class Runable:IRunable{
            //does not implement interface member `csharp100lianxi.HelloWorld.IRunable.strName.get and set'
            public string strName{
                set{strName = value;}
                get{return strName;}
            }
            public void Run(){
                Console.WriteLine("the IRunable's Running!");
            }
        }
        class Student3:Person3{
            //does not implement inherited abstract member 没有实现继承的抽象成员
            public override void Run(){
                Console.WriteLine("I'm student come from Person3 I can running");
            }
        }
        abstract class Person3{
            //private int nAge;

           //abstract string strName;

           //抽象类可以包含不抽象的成员，可以给继承的子类使用
           public void Say()
           {
               Console.WriteLine("I'm father class I'm people");
           }

           public virtual void Sing()
           {
               Console.WriteLine("I'm father class I'm people I can singing");
           }

           //Run的抽象方法
           public abstract void Run();
        }
        class cat1{
            private int n;
            private string strName;

            public cat1(){
                Console.WriteLine("who can execture1");
            }
            static cat1(){
                Console.WriteLine("who can execture2");
            }
        }
        class staticPerson{
        //静态成员变量
            private static int nAge;
        //实例成员变量
            private string strName = "reman";

            public static void Run(){
                //静态方法被调用时,类的对象还有可能能没有创建,所以不能调用类成员字段
                // strName = "qiangreman1";
                //this和base关键字都不能在静态方法中使用
                // this.strName = "qiangreman2";

                // ②可以创建类的对象指明对象的成员在静态方法中操作
                staticPerson p = new staticPerson();
                p.strName = "qiangzi";
                Console.WriteLine("I can running,myname is:{0}",p.strName);
            }
            public void sing(){
                //实例方法被调用的时候，对象实例一定会被创建，所以可以在实例方法中访问实例的字段
                this.strName = "qiangreman3";
                //调用静态成员
                Run();
                Console.WriteLine("I can singing");
            }
        }
        public int jiechengint(int num){
            int result;
            if(num == 0){
                result = 1;
             }else{
                result = num * jiechengint(num-1);
             }
             return result;
        }
        public static ulong JieCheng(ulong num){
            ulong result;
             if(num == 0){
                result = 1;
             }else{
                result = num * JieCheng(num-1);
             }
             return result;   
        }



//泛型、delegate/event、Attribute、Lamda表达式、函数式编程
        //顺序结构、循环结构、分支结构
//对语言来说，无外乎语法，函数，类库，现成的框架这些东西，这些都是“术”，
//而你对数据结构，设计模式，系统架构，计算机原理这些东西的理解，才是“道”

//要成为高手，学好英语，学会翻墙，一定要用Google



        //out参数侧重于输出，必须在方法内对其赋值
        public static void outPara(out int i){
    //The out parameter `i' must be assigned to before control leaves the current method
        i = 12;//方法内部必须对out参数进行赋值
        }

        //ref参数侧重于修改，但是也可以不修改参数的值
        public static void refPara(ref int i){
            i=13;
        }

        enum Direction{
            east,
            west,
            south,
            north
        }
        struct Point1{
            private int x;
            public int X{
                set{}
                get{return x;}
            }
            public Point1(int n){
                this.x=n;
                // this.X=n;
                Console.WriteLine("the x is:{0}",x);
            }
        }
        class cat{
            readonly string reOnlyName = "qiangqiang";
            public cat(){
                this.reOnlyName = "qiangqiang2";
                Console.WriteLine(reOnlyName);
            }
        }
        class work:Person2{
            public void  Hello()
                {
                    Console.WriteLine("I'm Work man can say Hello！");
                }

            public new void  Run()
                {
                    Console.WriteLine("I'm Work man can run！");
                }
        }
        class Student:Person2{
            private string strClass;
            private string strAddress;
            public void Address(string cla,string adre){
                //这里的this关键字调用了子类的成员和父类的非si有成员
                this.strClass = cla;
                this.strAddress = adre;
                this.strName = "ziqiang";

                //这里base关键字调用了是父类的非si有成员
                base.strAge = "10";
                Console.WriteLine("I'm {0} strAge {1},strClass is {2} ,strAddress is {3}",strName,strAge,strClass,strAddress);
            }
            public override void Sing1(){
              
                // this.strClass = "";
                Console.WriteLine("I'm student can singing!");
            }
            public void Sing(){
              
                // this.strClass = "";
                Console.WriteLine("I'm student can singing!");
            }
            public void Sing2(){
              
                // this.strClass = "";
                Console.WriteLine("I'm student can sing2ing!");
            }
            public Student(){
                Console.WriteLine("---------I'm son class-----------");
                this.strName = "RemanStu";
                Console.WriteLine("Student strName is {0}",strName);
            }
        }
        class Person2
        {
            private int nAge;
            protected string strName;
            double douHeight;
            public string strAge;
            public Person2(){

                Console.WriteLine("--------I'm father class---------");
                this.strName = "Reman";
                Console.WriteLine("Person2 strName is {0}",strName);
            }
            public void Hello()
            {
                Console.WriteLine("I'm Person2 can say Hello");
            }
            public void Run()
            {
                Console.WriteLine("I'm Person2 can run");
            }
            public virtual void Sing1(){
              
                // this.strClass = "";
                Console.WriteLine("I'm Person2 can singing!");
            }
            public void Sing(){
              
                // this.strClass = "";
                Console.WriteLine("I'm Person2 can singing!");
            }
            public virtual void Sing2(){
              
                // this.strClass = "";
                Console.WriteLine("I'm no override Person2 can singing!");
            }
        }

        class Person{
            private int age;
            private string name;
            protected string strName;
            protected string strAge;
            public Person(int age){
                this.age = age;
                Console.WriteLine("the reman age is:{0}",age);
            }
            //this关键字后面跟":"符号，可以调用其它的构造函数
            public Person(int age,string name):this(10){
                this.name = name;
                Console.WriteLine("the name is:{0},the age is:{1}",name,age);
            }
        }
 
        // 使用partial关键字声明相同名称的类,相同的类都要用partial关键字
        partial class Person1{
            private string strAddress;

            public string StrAddress
            {
                get { return strAddress; }
                set { strAddress = value; }
            }
            private string strNumber;

            public string StrNumber
            {
                get { return strNumber; }
                set { strNumber = value; }
            }

            public void Run()
            {

            }

        }
        partial class Person1{
             // #region 对象属性
            private int nAge;

            public int NAge
            {
                get { return nAge; }
                set { nAge = value; }
            }

            private string strName;

            public string StrName
            {
                get { return strName; }
                set { strName = value; }
            }

            // #endregion

            // #region 对象的构造函数
            //声明有实现的构造函数
            public Person1()
            {
                this.NAge = 100;
                Console.WriteLine("I'm superman!");
            }

            public Person1(int nAge)
            {
                Console.WriteLine("superman age is:{0}", nAge);
            }
            //这样它会调用this所指的构造方法
            public Person1(int nAge, string strName):this(1)
            {
                Console.WriteLine("I'm is: {0}，the age is: {1}", strName, nAge);
            }
            // #endregion

            public void Sing()
            {

            }

        }

























    }
}