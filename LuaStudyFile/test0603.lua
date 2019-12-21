-- local successCount =0;
-- local commitPercent = 0.1;
-- local percent = commitPercent*10000;
-- require("socket")
-- math.randomseed(tostring(socket.gettime()):reverse():sub(1, 6))
-- for i=1,100 do
--     local randomNum = math.random(1,10000);
--     print("--randomNum--"..randomNum.."--commitPercent--"..percent)    
--     if randomNum>percent then
--         print("--false--")
--     else
--         print("--true--")
--         successCount = successCount +1;
--     end    
-- end
-- print("--successCount--"..successCount)


local tab1 = {
	{{1,2},{3,4}},
	{{5,6},{7,8}},
	{{9,10},{11,12}}
}
for k,v in pairs(tab1)do
	for m,n in pairs(v)do
		for b,h in pairs(n)do
			print(b,h)
		end
	end
end

function func1( ... )
	local arg = {...}
	local sum = 0
	for k,v in pairs(arg)do
        sum = sum + v
    end
    avg = sum/#arg
    return sum,avg,std
end
sum1,avg,std = func1(34,55,67,88);
print(sum1,avg,std);


print("=====ipv4====");
-- ipv4匹配
input = "4.231.105.251";
-- output = string.match(input,"^([[[0-1]%d%d?|[2][0-4]%d|25[0-5]]%.]{3}[[0-1]%d%d?|[2][0-4]%d|[25][0-5]])$");
-- print(output);
-- output = string.match(input,"([[0-1]%d%d?]|[[2][0-4]%d]|[25[0-5]]{3})");
-- print(output);
input = "131.4.105.151";
-- output = string.match(input,"[[0-1]%d%d?%.|[0-1]%d%d?%.]");//没有选择性
print(output);


print(string.match("hello","()ll()"))

strname = nil
print((strname == ("" and nil)) and "wu" or "king")


string = "the name is finding";
function explode(str,symbol)
	local rt = {}
	string.gsub(str,"[^"..symbol.."]+",function(w)
		table.insert(rt,w)
	end)
	return rt
end
rttable = explode(string," ");
for k,v in pairs(rttable)do
	print(k..": "..v);
end


function implode(arr,symbol)
	local  implode_str = ""
	symbol = symbol or ","
	for k,v in pairs(arr) do
		implode_str = implode_str..v..symbol;
	end
	return string.sub(implode_str,1,#implode_str - 1);
end
restring = implode(rttable," ");
print(restring);


function TableReverse(table)
	for i=1,math.floor(#table/2)do
		table[i],table[#table - i + 1] = table[#table - i + 1],table[i]
	end
	return table
end
TableReverse(rttable);
for k,v in pairs(rttable)do
	print(k..": "..v);
end

-- 一列数的规则如下: 1、1、2、3、5、8、13、21、34...... 求第30位数是多少，用递归算法实现
function feibonaqie(num)
	if(num ==1 or num ==2)then
		result = 1;
	else
		result = feibonaqie(num-1)+feibonaqie(num-2)
	end
	return result
end
print(feibonaqie(30))

-- // 请编程实现一个冒泡排序算法
tab1 = {14,55,66,3,45,65,91,18,23}
for i=1,#tab1 do
	for j=1,#tab1-i+1 do
		if tab1[j]>tab1[#tab1-i+1] then
			tab1[#tab1-i+1],tab1[j] = tab1[j],tab1[#tab1-i+1]
		end
	end
end
for k,v in ipairs(tab1)do
	print(k,v)
end

--有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数？都是多少？


-- 利润(I)低于或等于10万元时，奖金可提10%；
-- 利润高于10万元，低于20万元时，低于10万元的部分按10%提成，高于10万元的部分，可提成7.5%；
-- 20万到40万之间时，高于20万元的部分，可提成5%；
-- 40万到60万之间时高于40万元的部分，可提成3%；
-- 60万到100万之间时，高于60万元的部分，可提成1.5%；
-- 高于100万元时，超过100万元的部分按1%提成。
-- 从键盘输入当月利润I，求应发放奖金总数？
numberMoney = 1200000;
if(numberMoney<=100000)then
	liRun = numberMoney * 0.1;
elseif(numberMoney<200000)then
    liRun = (numberMoney-100000)*0.075+10000;
elseif(numberMoney<400000)then
	liRun = (numberMoney-200000)*0.05+10000+7500;
elseif(numberMoney<600000)then
	liRun = (numberMoney-400000)*0.03+17500+10000;
elseif(numberMoney<1000000)then
	liRun = (numberMoney-600000)*0.015+27500+6000;
else
	liRun = (numberMoney-1000000)*0.01+27500+6000+6000;
end
print(liRun);

-- 一个整数，它加上100后是一个完全平方数，再加上168又是一个完全平方数，请问该数是多少？
-- 假设该数为 x。

-- 1、则：x + 100 = n2, x + 100 + 168 = m2

-- 2、计算等式：m2 - n2 = (m + n)(m - n) = 168

-- 3、设置： m + n = i，m - n = j，i * j =168，i 和 j 至少一个是偶数

-- 4、可得： m = (i + j) / 2， n = (i - j) / 2，i 和 j 要么都是偶数，要么都是奇数。

-- 5、从 3 和 4 推导可知道，i 与 j 均是大于等于 2 的偶数。

-- 6、由于 i * j = 168， j>=2，则 1 < i < 168 / 2 + 1。

-- 7、接下来将 i 的所有数字循环计算即可。
for i=2,85 do
	for j=2,168/i do
		if(i*j ==168 and i>j)and((i%2==0 and j%2==0)or(i%2==1 and j%2 ==1))then
            if(((i+j)/2)^2>268 and ((i-j)/2)^2>100)then
				print(((i+j)/2)^2-268)
            end
		end
	end
end
print(math.sqrt(1849))


-- 输入某年某月某日，判断这一天是这一年的第几天？year%400==0||(year%4==0&&year%100!=0)
input = "2019/06/25";
yearRun = {31,29,31,30,31,30,31,31,30,31,30,31};
yearPin = {31,28,31,30,31,30,31,31,30,31,30,31};
year,mouth,day = string.match(input,"(%d+)/(%d+)/(%d+)");
year = tonumber(year);mouth = tonumber(mouth);day = tonumber(day);
print(type(year),mouth,day);

if(year%400 == 0 and (year%4 == 0 and year%100 ~= 0))then
	sumday = 0;
	for i=1,mouth-1 do		
	    sumday = sumday + yearRun[i];
    end
    sumday = sumday + day;
else
	sumday = 0;
    for i=1,mouth-1 do		
	    sumday = sumday + yearPin[i];
    end
    sumday = sumday + day;
end
print(sumday);


-- 输入三个整数x,y,z，请把这三个数由小到大输出
x = 14;y = 5;z = 16;
tab1={};
tab1[1]=x;tab1[2]=y;tab1[3]=z;
table.sort(tab1);
for k,v in ipairs(tab1)do
	print(k,v)
end

x = 14;y = 5;z = 16;
tab1={};
tab1.x=x;tab1.y=y;tab1.z=z;
for k,v in pairs(tab1)do
	print(k..": "..v)
end


-- ：用*号输出字母C的图案
str = "*";
print(string.rep(" ",4)..string.rep("* ",3));
print(string.rep(" ",2)..string.rep("* ",5));
print(string.rep("* ",2)..string.rep(" ",5)..string.rep(" *",2));
print(string.rep("* ",2));
print(string.rep("* ",2));
print(string.rep("* ",2));
print(string.rep("* ",2)..string.rep(" ",5)..string.rep(" *",2));
print(string.rep(" ",2)..string.rep("* ",5));
print(string.rep(" ",4)..string.rep("* ",3));


-- 8.输出9*9口诀
for i=1,9 do
	for j=i,1,-1 do
		io.write(string.format("%d",i).."*"..string.format("%d",j)..":= "..string.format("%02d",i*j).."  ");
	end
	io.write("\n")
end


-- 9.要求输出国际象棋棋盘

-- 10.打印楼梯，同时在楼梯上方打印两个笑脸

-- 11.古典问题（兔子生崽）：有一对兔子，从出生后第3个月起每个月都生一对兔子，
-- 小兔子长到第三个月后每个月又生一对兔子，假如兔子都不死，
-- 问每个月的兔子总数为多少？（输出前40个月即可）
-- 兔子的规律为数列1,1,2,3,5,8,13,21....，即下个月是上两个月之和（从第三个月开始)


-- 12.判断101到200之间的素数
-- 判断素数的方法：用一个数分别去除2到sqrt(这个数)，如果能被整除， 则表明此数不是素数，反之是素数
for i=101,200 do
	isShuShu = true;
	for j=2,math.sqrt(i)do
		if(i%j==0)then
			isShuShu=false;
			break;
		end
	end
	if(isShuShu == true)then
		io.write(i.." ");
	end
end
print();

-- 13.打印出所有的"水仙花数"，所谓"水仙花数"是指一个三位数，其各位数字立方和等于该数 本身。
-- 例如：153是一个"水仙花数"，因为153=1的三次方＋5的三次方＋3的三次方。
-- 程序分析：利用for循环控制100-999个数，每个数分解出个位，十位，百位。
for i=100,999 do
	bai = (i-i%100)/100;
	shi = ((i%100)-i%10)/10;
	ge = i%10;
	if(math.pow(bai,3)+math.pow(shi,3)+math.pow(ge,3)==i)then
		io.write(i.." ");
	end
end
print();

-- 14.将一个正整数分解质因数。例如：输入90,打印出90=2*3*3*5。
-- 程序分析：对n进行分解质因数，应先找到一个最小的质数k，然后按下述步骤完成：
-- (1)如果这个质数恰等于（小于的时候，继续执行循环）n，则说明分解质因数的过程已经结束，另外 打印出即可。
-- (2)但n能被k整除，则应打印出k的值，并用n除以k的商,作为新的正整数n.重复执行第二步。
-- (3)如果n不能被k整除，则用k+1作为k的值,重复执行第一步。
inputFenJie = 90;
kFenjie = 1;
io.write(inputFenJie.."=1");
while(kFenjie<inputFenJie)do
	for i=2,inputFenJie do
        if(inputFenJie%i == 0)then
        	inputFenJie = inputFenJie/i;
        	kFenjie =i;
        	io.write("*"..i);
        	break;
        end
    end
end
print();


-- 15.利用条件运算符的嵌套来完成此题：学习成绩>=90分的同学用A表示，60-89分之间的用B表示，60分以下的用C表示。
-- 程序分析：(a>b)?a:b这是条件运算符的基本例子
inputscore = 87;
strscore = (inputscore>60) and (inputscore>=90 and "A" or "B") or "C";
print(strscore);


-- // 16.输入两个正整数m和n，求其最大公约数和最小公倍数。
-- // （1）最小公倍数=输入的两个数之积除于它们的最大公约数，关键是求出最大公约数；
-- // （2）求最大公约数用辗转相除法（又名欧几里德算法）
-- // 1）证明：设c是a和b的最大公约数，记为c=gcd(a,b),a>=b,
-- // 令r=a mod b
-- // 设a=kc，b=jc，则k，j互素，否则c不是最大公约数
-- // 据上，r=a-mb=kc-mjc=(k-mj)c
-- // 可知r也是c的倍数，且k-mj与j互素，否则与前述k，j互素矛盾,
-- // 由此可知，b与r的最大公约数也是c，即gcd(a,b)=gcd(b,a mod b)，得证。
-- // 2）算法描述：
-- // 第一步：a ÷ b，令r为所得余数（0≤r 第二步：互换：置 a←b，b←r，并返回第一步。

-- 17.：输入一行字符，分别统计出其中英文字母、空格、数字和其它字符的个数
-- 程序分析：利用while语句,条件为输入的字符不为'\n'


-- // 24.有一分数序列：2/1，3/2，5/3，8/5，13/8，21/13...求出这个数列的前20项之和
-- // 程序分析：请抓住分子与分母的变化规律   32.660263


-- // 25.求1+2!+3!+...+20!的和。
-- // 程序分析：此程序只是把累加变成了累乘
print("----杨辉三角形----");
n=20
tab1={};
tab1[1]={};
tab1[1][1]=1;
tab1[2]={};
tab1[2][1]=1;
tab1[2][2]=1;
for i=3,n do
	tab1[i]={};
	tab1[i][1]=1;
	for j=2,i-1 do
		tab1[i][j]=tab1[i-1][j-1]+tab1[i-1][j];
		-- print(tab1[i][j]);
	end
	tab1[i][i]=1;
end
for i=1,n do
	io.write(string.rep(" ",n-i));
	for j=1,i do
		io.write(string.format("%5d",tab1[i][j]).." ");
	end
	print("");
end
		
-- print("----kongge----");
-- for i=1,10 do
-- 	print(string.rep(" ",math.floor((10+1-i)/2))..string.rep("*",i))
-- end

print("--alfjdslafja;sf------");
print(0x01cf)
print(463*1.17)


arr = {"Mila","Kbi","Kai","Dave","Steve","Ramzy","Gandalf","AabbbbbbC","AabbbbbbA","Fave","Kteve"};
table.sort(arr);
for k,v in ipairs(arr)do
	print(k,v)
end



str = "gdlocal";
function functest1()
	print(str);
	local str = "local";
	print(str);
end
functest1();

-- stringAA = [[" hdsalkfjdslkah kl, lkfjsdifojdsf,kgjaojdsoajfo
-- kfsdajf,l a;jfiodsjf,lfdjlafjdk";]]
-- retStringAA = string.gsub(stringAA,"\n"," ");
-- print(retStringAA);
-- file = io.open(os.getenv("HOME").."/Desktop/test1112.csv","a+");
-- file:write("Test");
-- file:write("SubTest");
-- file:write("SubSubTest".."\n");
-- for word in string.gmatch(retStringAA,"[%s%w]+,")do
-- 	file:write(word.."\n");
-- 	print(word)
-- end
-- file:close();

file = io.open(os.getenv("HOME").."/Desktop/test1112.csv","a+");
file1 = io.open(os.getenv("HOME").."/Desktop/test1112.csv","r");
stringAA = file1:read("*a");

print(stringAA)
if(string.len(stringAA)>1)then
	print("-------=============------------")
end
if(string.match(stringAA,"(%w+)")~=nil)then
	print("-------=======match======------------")
end
file1:close();
file:close();










