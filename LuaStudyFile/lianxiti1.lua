-- 获得数组中最大值的例子

local arr = {1,2,3,4,5,5,11,5,8,9,1}
local m = 0
for i,v in ipairs(arr) do
	if v >m then
		m=v 
	end
end
print(m)
local max = math.max(arr)
print(max)
-- 一个简单的例子来实现数字n的几次方
local x,a = 29,2
local y = x^a 
print(y)


-- 定义一个函数，传入两个参数并相加，相减，相乘，相除，取余，返回他们的运行结果
function aculted(a,b)
	local add = a+b
	local res = a-b
	local sup = a*b
	local del = a/b
	local per = a%b
	io.write("相加 ",add," 相减 ",res," 相乘 ",sup," 相除 ",del," 取余 ",per)
end
aculted(10,5)


-- 定义一个函数利用循环让这个函数能够计算n的阶乘
local sum = 1
local n = 6
for i=1,n do
	sum=sum*i 
end
print('\n'..sum,"\n")



-- 斐波那契数列
local tab1 = {}
tab1[1]=1
tab1[2]=1
for i=3,20 do
    tab1[i]=tab1[i-1]+tab1[i-2]
end
for i,v in ipairs(tab1)do
	print(i,v)
end


-- 输出三角形的形状
local a = "*"
local n = 7
for i=1,n do
	print(string.rep(" ",n-i)..string.rep("* ",i))
end


-- 9*9乘法表
for i=1,9 do
	for j=1,i do
		io.write(i," * ",j," =:",string.format("%.2d",i*j),"  ")
end
print("\n")
end


-- 要求用户输入一个年份，判断并输出该年份是闰年还是平年
local year = 2019
if (year%100~=0 and year%4==0) or year%400==0 then
	print("zhe shi run nian",year)
else
	print("zhe bu shi run nian",year)
end


-- 要求用户输入两个整数，判断第一个整数是否是第二个整数的倍数。
local a,b = 10,5
if a%b==0 then
	print("a is b de bei shu")
else
	print("a is not b de bei shu")
end


-- 要求用户输入一个年份和一个月份，判断（要求使用嵌套的if…else和switch分别判断一次）该年该月有多少天
local i = {31,28,31,30,31,30,31,31,30,31,30,31}
local j = {31,29,31,30,31,30,31,31,30,31,30,31}
-- for k,v in ipairs(i) do
-- 	print(k,v)
-- 	print(i[k])
-- 	print(type(k))
-- 	end
function howday(year,month)
	if (year%100~=0 and year%4==0) or year%400==0 then
		print("zhe run nian month have ",j[month]," day")
	else
		print("zhe ping nian month have",i[month],"day")
	end
end
howday(2019,2)


-- 要求用户输入一个学生的分数（1~100），使用switch结构判断该分数属于什么等级（A、B、C、D、F）
local num = 50
if (num>=80) then
	print("dengji A")
elseif(60<=num and num<80) then
    print("dengji B")
elseif(40<=num and num<60) then
    print("dengji C")
elseif(20<=num and num<40) then
    print("dengji D")
else 
    print("dengji F")
end
print("\n")

-- 使用while循环求1~100以内所有奇数的和
local sum=0
for i=1,100 do	
	while i%2==1 do
		sum=sum+i
		break
	end
end
print(sum.."\n")


-- 使用while循环求式子2+22+222+2222+22222的和。p=p*10+2;
local i = 0
local sum = 0
local a = 0
while i<5 do
   a=a*10+2
   sum=sum+a
   i=i+1
end
print(sum.."\n")


-- 请编程验证一下“角谷猜想”：对任意的自然数，若是奇数，就对它乘以3加1；若是偶数就对它除以2；
-- 这样得到一个新数，再按上述奇数、偶数的计算规则进行计算，一直进行下去，最终将得到1。
local num = 85
while num~=1 do
	if (num%2==1)then
		num=num*3+1
	else
		num = num/2
	end
	print(num)
end



-- __index 元方法

-- 这是 metatable 最常用的键。

-- 当你通过键来访问 table 的时候，如果这个键没有值，那么Lua就会寻找该table的metatable（假定有metatable）中的__index 键。如果__index包含一个表格，Lua会在表格中查找相应的键。

-- Lua查找一个表元素时的规则，其实就是如下3个步骤:

-- 1.在表中查找，如果找到，返回该元素，找不到则继续
-- 2.判断该表是否有元表，如果没有元表，返回nil，有元表则继续。
-- 3.判断元表有没有__index方法，如果__index方法为nil，则返回nil；如果__index方法是一个表，则重复1、2、3；如果__index方法是一个函数，则返回该函数的返回值。
-- __newindex 元方法

-- __newindex 元方法用来对表更新，__index则用来对表访问 。

-- 当你给表的一个缺少的索引赋值，解释器就会查找__newindex 元方法：如果存在则调用这个函数而不进行赋值操作。

-- __call 元方法

-- __call 元方法在 Lua 调用一个值时调用。

-- __tostring 元方法

-- __tostring 元方法用于修改表的输出行为。




-- 将字符串中的大写字母转化成小写字母并输出
local x = "HELLO WORLD"
print(string.lower(x))


-- 输入两个随机数组（数组均由数字组成），然后合并成一个数组，升序输出
local a = {1,2,3,4,5,5,11,5,8,9,1}
local b = {6,88,5,4,7,5,11,5,8,9,16}
local arr = {}
for i in ipairs(a) do
	table.insert(arr,tonumber(a[i]))
end
for i in ipairs(b) do
	table.insert(arr,tonumber(b[i]))
end
table.sort(arr)
for i,v in ipairs(arr) do
	print(i,v)
end


-- 输入一个三位以内的数字，判断是几位数，要求输出位数和逆序输出
local num = 18
if (num/100)>0 then
    str = tostring(num)
    print("the num wei shu is 3. "..string.reverse(str))
elseif (num/100)<=0 and (num/10)>0 then
    str = tostring(num)
    print("the num wei shu is 2. "..string.reverse(str))
elseif (num/100)<=0 and (num/10)<=0 then
    str = tostring(num)
    print("the num wei shu is 1. "..string.reverse(str))
end




local value = {"yoyo",yoyo="yoyou"}
print(value[value[1]])
print(false==nil)
print((nil and false)==false)
print((nil or false)==false)
print((nil or false)==true)
print((nil and false)==true)
print(string.sub("123456",2,-2))



-- 随机四个10以内数，请将这四个数以次从大到小排序
local num = {}
for i=1,4 do
	num[i]=math.random(1,10)
	print(num[i])
end
local max = 0
for i,v in ipairs(num)do
	if v>max then
		max=v
	end
end
print(max)


-- 请将1-20的数字随机排序
print(math.random(1,20))
print(math.random(1,20))





--输入1-n，输出所有的排列组合
local n = 4
local y = "•"
local x = "●"
for i=1,n do
print(string.rep(" "..x,i))
end
for i=1,n do
print(string.rep(" "..y,i))
end


-- require和dofile的区别





-- 如果用cocosd-x的lua来做叶子飘落的效果，大体思路是





-- 请写出手机网游里面如何做到动态更新





-- 请写出适配android和ios多分辨率的解决方案






local x1 = false
if x1 == true or x1 == false then
	print("x1 type is a boolean")
end

--分别用-l和dofile运行程序
-- (x and y and (not z)) or ((not y)and x)



-- lua 字符串复制函数
-- 然后 lua 解释器执行这段代码实现字符串复制
function stringrep(s,n)
	local r = ""
	if n>0 then
        while n>1 do
        	if n%2~= 0 then r=r..s end
        	s=s..s
        	n=math.floor(n/2)
        end
        r=r..s
    end
    return r
end

print(stringrep(" *",3))

print(string.rep(" *",10))




require("module")
print(mod.constant)
mod.func3()

local a = {}
local b = {x=1,["hello"]="world!"}
a["astring"]="ni,hao!"
a[1]=100
a["a table"]=b
for k,v in pairs(a)do
	print(k,"=>",v);
end

-- 通过“.”或者“[]”运算符来访问表的成员。
-- 注意:表达式a.b等价于a[“b”],但不等价于a[b]

-- ==表项的键和值

-- 任何类型的变量,除了nil,都可以做为表项的键。从简单的数值、字符串到复杂的函数、表等等都可以;
-- 同样,任何类型的变量,除了nil,都可以作为表项的值。
-- 给一个表项的值赋nil意味着从表中删除这一项,比如令a.b= nil,则把表a中键为“b”的项删除。
-- 如果访问一个不存在的表项,其值也是nil,比如有c = a.b,但表a中没有键为“b”的项,则c等于nil。 


function create(name,id)
        local obj = {name = name,id = id}

        function obj:SetName(name)
            self.name = name 
        end

        function obj:GetName()
            return self.name
        end

        function obj:SetId(id)
            self.id = id
        end

        function obj:GetId()
            return self.id
        end
        return obj
    end

    local myCreate = create("sam",001)

    for k,v in pairs(myCreate) do
        print(k,"=>",v)
    end
    print("----====----====-----")
print("myCreate's name:",myCreate:GetName(),"myCreate's id:",myCreate:GetId())
print("myCreate's name:",myCreate.GetName(myCreate),"myCreate's id:",myCreate.GetId(myCreate))

-- :用来引用方法，并将对象作为第一参数传入放法中，.来调用table中的key或方法，要传入参数。

myCreate:SetId(100)
myCreate:SetName("Hello Kity")

print("myCreate's name:",myCreate:GetName(),"myCreate's id:",myCreate:GetId())
print("myCreate's name:",myCreate.GetName(myCreate),"myCreate's id:",myCreate.GetId(myCreate))
 print("----====----====-----")


--===简单继承
local function createFootballRobot(name ,id ,position)
        local obj = create(name ,id)
        obj.position = "right back"

        function obj:SetPosition(p)
            self.position = p
        end

        function obj:GetPosition() 
            return self.position
        end

        return obj
    end

local mycreateFootballRobot = createFootballRobot("Tom",1000,"广州")

print("mycreateFootballRobot's name:",mycreateFootballRobot:GetName(),"myCreate's id:",mycreateFootballRobot:GetId(),mycreateFootballRobot:GetPosition())
print("mycreateFootballRobot's name:",mycreateFootballRobot.GetName(mycreateFootballRobot),"myCreate's id:",mycreateFootballRobot:GetId(mycreateFootballRobot),mycreateFootballRobot.GetPosition(mycreateFootballRobot))

mycreateFootballRobot:SetName("麦迪")
mycreateFootballRobot:SetId(2000)
mycreateFootballRobot:SetPosition("北京")
print("mycreateFootballRobot's name:",mycreateFootballRobot:GetName(),"myCreate's id:",mycreateFootballRobot:GetId(),mycreateFootballRobot:GetPosition())
print("mycreateFootballRobot's name:",mycreateFootballRobot:GetName(mycreateFootballRobot),"myCreate's id:",mycreateFootballRobot.GetId(mycreateFootballRobot),mycreateFootballRobot.GetPosition(mycreateFootballRobot))



print("----====----====-----")
-- ===1.函数闭包
function createCountdownTimer(second)
	local ms = second*1000
	local function countDown()
		ms = ms -1
		return ms
	end
	return countDown
end
-- 反回countDown方法，并timer1=countDown，进行多次调用，并返回ms的值
local timer1 = createCountdownTimer(1)
for i=1,3 do
	print(timer1())
end


-- 1.2 关于函数闭包描述

-- 1.Upvalue
-- 一个函数所使用的定义在它的函数体之外的局部变量(external local variable)称为这个函数的upvalue。 在前面的代码中,函数countDown使用的定义在函数createCountdownTimer 中的局部变量ms就是countDown的upvalue,但ms对createCountdownTimer而 言只是一个局部变量,不是upvalue。 Upvalue是Lua不同于C/C++的特有属性,需要结合代码仔细体会。
-- 2.函数闭包
-- 一个函数和它所使用的所有upvalue构成了一个函数闭包。 
-- 3.Lua函数闭包与C函数的比较
-- Lua函数闭包使函数具有保持它自己的状态的能力,从这个意义上说,可以 与带静态局部变量的C函数相类比。但二者有显著的不同:对Lua来说,函数 是一种基本数据类型——代表一种(可执行)对象,可以有自己的状态;但 是对带静态局部变量的C函数来说,它并不是C的一种数据类型,更不会产生 什么对象实例,它只是一个静态地址的符号名称。

-- ===2. 基于对象的实现方式
local function create1(name ,id )
        local data = {name = name ,id = id}  --data为obj.SetName,obj.GetName,obj.SetId,obj.GetId的Upvalue
        local obj = {}  --把需要隐藏的成员放在一张表里,把该表作为成员函数的upvalue。

        function obj.SetName(name)
            data.name = name 
        end

        function obj.GetName() 
            return data.name
        end

        function obj.SetId(id)
            data.id = id 
        end

        function obj.GetId() 
            return data.id
        end

        return obj
    end
myCreate = create1("lucy",10)
-- myCreate:SetId(100)
-- myCreate:SetName("Hello Kity")
print("myCreate's name:",myCreate:GetName(),"myCreate's id:",myCreate:GetId())

-- 2.2  有关对象实现的描述

-- 实现方式:  把需要隐藏的成员放在一张表里,把该表作为成员函数的upvalue。

-- 局限性:  基于对象的实现不涉及继承及多态。但另一方面,脚本编程是否需要继承和多态要视情况而定。 

print("----====----====-----")
---===3.元表

-- 3.1  实例代码(1):
local t = {}
local m = {a="and",b="li lei",c="han meimei"}

setmetatable(t,{__index = m})

for k,v in pairs(t) do
	print("have value?")
	print(k,"=>",v)
end
print(t.b,t.a,t.c)

-- 3.2  实例代码(2):
local function add(t1,t2)
    --‘#’运算符取表长度
    assert(#t1 == #t2)
    local length = #t1
    for i = 1,length do
        t1[i] = t1[i] + t2[i]
    end
    return t1
end

--setmetatable返回被设置的表
t1 = setmetatable({1,2,3},{__add = add})
t2 = setmetatable({10,20,30},{__add = add})

for k,v in  pairs(t1) do
    print(k,"=>",v)
end

for k,v in  pairs(t2) do
    print(k,"=>",v)
end

print("---------两元表相加--------------")
t1 = t1 + t2
for i = 1 ,#t1 do
    print(t1[i])
end

--==3.3  有关元表的描述:

-- 定义 :
-- 元表本身只是一个普通的表,通过特定的方法(比如setmetatable)设置到某个对象上,进而影响这个对象的行为;
-- 一个对象有哪些行为受到元表影响以及这些行为按照何种方式受到影响是受Lua语言约束的。
-- 比如在前面的代码里,两个表对象的加法运算,如果没有元表的干预,就是一种错误;
-- 但是Lua规定了元表可以“重载”对象的加法运算符,因此若把定义了加法运算的元表设置到那两个表上,它们就可以做加法了。
-- 表是Lua最关键的概念之一,内容也很丰富,请参考Lua文档了解详情。


 local Robot = { name = "Sam", id = 001 }
    function Robot:New(extension)
        local t = setmetatable(extension or { }, self) 
        self.__index = self
        return t
    end

    function Robot:SetName(name)
        self.name = name 
    end

    function Robot:GetName() 
        return self.name
    end

    function Robot:SetId(id)
        self.id = id end

    function Robot:GetId() 
        return self.id
    end

    robot = Robot:New()
    print("robot's name:", robot:GetName()) 
    print("robot's id:", robot:GetId()) 
    print("-----------------")

    local FootballRobot = Robot:New({position = "right back"})
    function FootballRobot:SetPosition(p) 
        self.position = p
    end

    function FootballRobot:GetPosition()
        return self.position 
    end

    fr = FootballRobot:New()
    print("fr's position:", fr:GetPosition()) 
    print("fr's name:", fr:GetName()) 
    print("fr's id:", fr:GetId()) 
    print("-----------------")

    fr:SetName("Bob")
    print("fr's name:", fr:GetName()) 
    print("robot's name:", robot:GetName())


-- 5.包
-- 5.1 实例代码:
-- local pack = require "mypack"  --导入包［注：包的名字与定义包的文件的名字相同(除去文件名后缀,在前面的代码中,就是“mypack”)］

-- print(ver or "No ver defined!")
-- print(pack.ver)

-- pack.aFunInMyPack()

-- print(aFunInMyPack or "No aFunInMyPack defined!")
-- aFuncFromMyPack()




-- ==定义
-- 包是一种组织代码的方式

-- 实现方式
-- 一般在一个Lua文件内以module函数开始定义一个包。
-- module同时定义了一个新的包的函数环境,以使在此包中定义的全局变量都在这个环境中,而非使用包的函数的环境中。
-- 理解这一点非常关键。以前面的代码为例, “module(..., package.seeall)”的意思是定义一个包,
-- 包的名字与定义包的文件的名字相同(除去文件名后缀,在前面的代码中,就是“mypack”),
-- 并且在包的函数环境里可以访问使用包的函数环境(比如,包的实现使用了print,这个变量没有在包里定义,
-- 而是定义在使用包的外部环境中)。

-- 使用方式
-- 一般用require函数来导入一个包,要导入的包必须被置于包路径(packagepath)上。
-- 包路径可以通过package.path或者环境变量来设定。一般来说,当前工作路径总是在包路径中。


-- ==高阶话题
-- 1.迭代

local function enum(array)
	local index = 1
	return function ()
	local ret = array[index]
		index = index+1
		return ret
	end
end

local function foreach(array,action)
	for element in enum(array) do
		action(element)
	end
end

foreach({1,2,3},print)

--如前面代码所示:enum函数返回一个匿名的迭代函数,for语句每次调用该迭代函数都得到一个值(通过element变量引用),若该值为nil,则for循环结束

-- 2.协作线程
print("--==--==--==--==--==--==--")
--线程
    local function producer()
        return coroutine.create(
        function(salt)
            local t = {1,2,3}
            for i = 1,#t do
                salt = coroutine.yield(t[i] + salt)
            end
        end
        )
    end

    function consumer(prod)
        local salt = 10
        while true do
            local running ,product = coroutine.resume(prod, salt)
            -- print(coroutine.resume(prod,salt))
            salt = salt*salt
            if running then
                print(product or "END!")
            else
                break
            end
        end
    end

    consumer(producer())


-- ==创建协作线程
-- 通过coroutine.create可以创建一个协作线程,该函数接收一个函数类型的参数作为线程的执行体,返回一个线程对象。

-- ==启动线程
-- 通过coroutine.resume可以启动一个线程或者继续一个挂起的线程。
-- 该函数接收一个线程对象以及其他需要传递给该线程的参数。
-- 线程可以通过线程函数的参数或者coroutine.yield调用的返回值来获取这些参数。
-- 当线程初次执行时,resume传递的参数通过线程函数的参数传递给线程,线程从线程函数开始执行;
-- 当线程由挂起转为执行时,resume传递的参数以yield调用返回值的形式传递给线程,线程从yield调用后继续执行

-- ==线程放弃调度

-- 线程调用coroutine.yield暂停自己的执行,并把执行权返回给启动/继续它的线程;线程还可利用yield返回一些值给后者,
-- 这些值以resume调用的返回值的形式返回。 






-- assert(v[,mess age])                 

-- 相当于C的断言

-- v：当表达式v为nil或false将触发错误,

-- message：发生错误时返回的信息，默认为"assertion failed!"

 

-- collectgarbage (opt [, arg])

-- 是垃圾收集器的通用接口，用于操作垃圾收集器

-- opt：操作方法标志

-- "Stop": 停止垃圾收集器

-- "Restart": 重启垃圾收集器

-- "Collect": 执行一次全垃圾收集循环

-- "Count": 返回当前Lua中使用的内存量(以KB为单位)

-- "Step": 单步执行一个垃圾收集. 步长 "Size" 由参数arg指定　(大型的值需要多步才能完成)，如果要准确指定步长，需要多次实验以达最优效果。如果步长完成一次收集循环，将返回True

-- "Setpause": 设置 arg/100 的值作为暂定收集的时长

-- "Setstepmul": 设置 arg/100 的值，作为步长的增幅(即新步长＝旧步长*arg/100)

 

-- dofile (filename)

-- 打开并且执行一个lua块,当忽略参数filename时，将执行标准输入设备(stdin)的内容。返回所有块的返回值。当发生错误时，dofile将错误反射给调用者

-- 注：dofile不能在保护模式下运行
dofile("Adatebasic.lua")
print("--===--===--===--===--===--")

-- error (message [, level])

-- 终止正在执行的函数，并返回message的内容作为错误信息(error函数永远都不会返回)

-- 通常情况下，error会附加一些错误位置的信息到message头部.

-- Level参数指示获得错误的位置,

-- Level=1[默认]：为调用error位置(文件+行号)

-- Level=2：指出哪个调用error的函数的函数

-- Level=0:不添加错误位置信息

 

-- _G全局环境表(全局变量)

-- 记录全局环境的变量值的表 _G._G = _G
for k,v in pairs(_G)do
	print(k,v)
end
print("--===--===--===--===--===--")


-- getfenv(f)

-- 返回函数f的当前环境表

-- f可以为函数或调用栈的级别，级别1[默认]为当前的函数,级别0或其它值将返回全局环境_G
-- print(getfenv(print("fal;fa")))
 

-- getmetatable(object)

-- 返回指定对象的元表(若object的元表.__metatable项有值，则返回object的元表.__metatable的值)，当object没有元表时将返回nil

 

 

-- ipairs (t)

 

-- 返回三个值 迭代函数、表、0

-- 多用于穷举表的键名和键值对

-- 如：for i,v in ipairs(t) do   end

-- 每次循环将索引赋级i，键值赋给v

-- 注：本函数只能用于以数字索引访问的表如：t={"1","cash"}

 

-- load (func [, chunkname])

-- 装载一个块中的函数，每次调用func将返回一个连接前一结的字串，在块结尾处将返回nil

-- 当没有发生错误时，将返回一个编译完成的块作为函数,否则返回nil加上错误信息，此函数的环境为全局环境

-- chunkname用于错误和调试信息

 

 

-- loadfile ([filename])

-- 与load类似，但装载的是文件或当没有指定filename时装载标准输入(stdin)的内容

 

 

-- loadstring (string [, chunkname])

-- 与load类似，但装载的内容是一个字串

-- 如：assert(loadstring(s))()

 

 

-- next (table [, index])

-- 允许程序遍历表中的每一个字段，返回下一索引和该索引的值。

-- table：要遍历的表

-- index：要返回的索引的前一索中的号，当index为nil[]时，将返回第一个索引的值，当索引号为最后一个索引或表为空时将返回nil

-- 注：可以用next(t)来检测表是否为空(此函数只能用于以数字索引的表与ipairs相类似)

 

-- ipairs (t)

-- 返回三个值 next函数、表、0

-- 多用于穷举表的键名和键值对

-- 如：for n,v in pairs(t) do end

-- 每次循环将索引赋级i，键值赋给v

-- 注：本函数只能用于以键名索引访问的表如：t={id="1",name="cash"}

 

-- pcall (f, arg1, ···)

-- 在保护模式下调用函数(即发生的错误将不会反射给调用者)

-- 当调用函数成功能返回true,失败时将返回false加错误信息

 

 

-- print (···)

-- 简单的以tostring方式格式化输出参数的内容

 

 

-- rawequal (v1, v2)

-- 检测v1是否等于v2，此函数不会调用任何元表的方法

 

 

-- rawget (table, index)

-- 获取表中指定索引的值，此函数不会调用任何元表的方法，成功返回相应的值，当索引不存在时返回nil

-- 注：本函数只能用于以数字索引访问的表如：t={"1","cash"}
local x = {a="flka",b=1,c=a,2}
for i,v in pairs(x)do
	print(i,v)
end
print(rawget(x,"a"))
print(rawget(x,1))
print(rawget(x,a))
print("--===--===--===--===--")
-- rawset (table, index, value)

-- 设置表中指定索引的值，此函数不会调用任何元表的方法，此函数将返回table
rawset(x,"k","falkfj")
for i,v in pairs(x)do
	print(i,v)
end

 

-- select (index, ···)

-- 当index为数字将返回所有index大于index的参数:如：select(2,"a","b") 返回 "b"

-- 当index为"#"，则返回参数的总个数(不包括index)
local b = {1,2,5,76,8,a="llff",b=99,c={4,a="fjak"}}
print(select(2,"b","b")) 

 

-- setfenv (f, table)

-- 设置函数f的环境表为table

-- f可以为函数或调用栈的级别，级别1[默认]为当前的函数,级别0将设置当前线程的环境表

 

-- setmetatable (table, metatable)

-- 指定的table设置元表metatable，如果metatable为nil则取消table的元表，当metatable有__metatable字段时，将触发错误

-- 注：只能为LUA_TTABLE表类型指定元表

 

-- tonumber (e [, base])

-- 尝试将参数e转换为数字，当不能转换时返回nil

-- base(2~36)指出参数e当前使用的进制，默认为10进制，如tonumber(11,2)=3

 

-- tostirng(e)

-- 将参数e转换为字符串，此函数将会触发元表的__tostring事件

 

 

-- type(v)

-- 返回参数的类型名("nil"，"number", "string", "boolean", "table", "function", "thread", "userdata")

 

 

-- unpack (list [, i [, j]])

-- 返回指定表的索引的值,i为起始索引，j为结束索引

-- 注：本函数只能用于以数字索引访问的表,否则只会返回nil如：t={"1","cash"}
-- print(unpack(b,1,5))
 

-- _VERSION

-- 返回当前Lua的版本号"Lua 5.1".
print(_VERSION)
 

 

-- xpcall (f, err)

-- 与pcall类似，在保护模式下调用函数(即发生的错误将不会反射给调用者)

-- 但可指定一个新的错误处理函数句柄

-- 当调用函数成功能返回true,失败时将返回false加err返回的结果

 

-- ===Lua中的数学库

-- abs

-- 取绝对值

-- math.abs(-15)

-- 15

-- acos

-- 反余弦函数

-- math.acos(0.5)

-- 1.04719755

-- asin

-- 反正弦函数

-- math.asin(0.5)

-- 0.52359877

-- atan2

-- x / y的反正切值

-- math.atan2(90.0, 45.0)

-- 1.10714871

-- atan

-- 反正切函数

-- math.atan(0.5)

-- 0.463647609

-- ceil

-- 不小于x的最大整数

-- math.ceil(5.8)

-- 6

-- cosh

-- 双曲线余弦函数

-- math.cosh(0.5)

-- 1.276259652

-- cos

-- 余弦函数

-- math.cos(0.5)

-- 0.87758256

-- deg

-- 弧度转角度

-- math.deg(math.pi)

-- 180

-- exp

-- 计算以e为底x次方值

-- math.exp(2)

-- 2.718281828

-- floor

-- 不大于x的最大整数

-- math.floor(5.6)

-- 5

-- fmod （mod）

-- 取模运算

-- math.mod(14, 5)

-- 4

-- frexp

-- 把双精度数val分解为数字部分（尾数）和以2为底的指数n，即val=x*2n

-- math.frexp(10.0)

-- 0.625    4

-- ldexp

-- 计算value * 2的n次方

-- math.ldexp(10.0, 3)

-- 80 = 10 * (2 ^3)

-- log10

-- 计算以10为基数的对数

-- math.log10(100)

 

-- 2

-- log

-- 计算一个数字的自然对数

-- math.log(2.71)

-- 0.9969

-- max

-- 取得参数中最大值

-- math.max(2.71, 100, -98, 23)

-- 100

-- min

-- 取得参数中最小值

-- math.min(2.71, 100, -98, 23)

-- -98

-- modf

-- 把数分为整数和小数

-- math.modf(15.98)

-- 15    98

-- pow

-- 得到x的y次方

-- math.pow(2, 5)

-- 32

-- rad

-- 角度转弧度

-- math.rad(180)

-- 3.14159265358

-- random

-- 获取随机数

-- math.random(1, 100) math.random(100)

-- 获取1-100的随机数

-- randomseed

-- 设置随机数种子

-- math.randomseed(os.time())

-- 在使用math.random函数之前必须使用此函数设置随机数种子

-- sinh

-- 双曲线正弦函数

-- math.sinh(0.5)

-- 0.5210953

-- sin

-- 正弦函数

-- math.sin(math.rad(30))

-- 0.5

-- sqrt

-- 开平方函数

-- math.sqrt(16)

-- 4

-- tanh

-- 双曲线正切函数

-- math.tanh(0.5)

-- 0.46211715

-- tan

-- 正切函数

-- math.tan(0.5)

-- 0.5463024




--===Lua 如何输出树状结构的table
local function __tostring(value, indent, vmap)
    local str = ''
    indent = indent or ''
    vmap = vmap or {}

    --递归结束条件
    if (type(value) ~= 'table') then
        if (type(value) == 'string') then
            --字符串
            str = string.format("[[%s]]", value)
        else
            --整数
            str = tostring(value)
        end
    else
        if type(vmap) == 'table' then
            if vmap[value] then return '('..tostring(value)..')' end
            vmap[value] = true
        end

        local auxTable = {}     --保存元表KEY(非整数)
        local iauxTable = {}    --保存元表value
        local iiauxTable = {}   --保存数组(key为0)
        table.foreach(value, function(i, v)
            if type(i) == 'number' then
                if i == 0 then
                    table.insert(iiauxTable, i)
                else
                    table.insert(iauxTable, i)
                end
            elseif type(i) ~= 'table' then
                table.insert(auxTable, i)
            end
        end)
        table.sort(iauxTable)

        str = str..'{\n'
        local separator = ""
        local entry = "\n"
        local barray = true
        local kk,vv
        table.foreachi(iauxTable, function (i, k)
            if i == k and barray then
                entry = __tostring(value[k], indent..'  \t', vmap)
                str = str..separator..indent..'  \t'..entry
                separator = ", \n"
            else
                barray = false
                table.insert(iiauxTable, k)
            end
        end)
        table.sort(iiauxTable)

        table.foreachi (iiauxTable, function (i, fieldName)

            kk = tostring(fieldName)
            if type(fieldName) == "number" then 
                kk = '['..kk.."]"
            end 
            entry = kk .. " = " .. __tostring(value[fieldName],indent..'  \t',vmap)

            str = str..separator..indent..'  \t'..entry
            separator = ", \n"
        end)
        table.sort(auxTable)

        table.foreachi (auxTable, function (i, fieldName)

            kk = tostring(fieldName)
            if type(fieldName) == "number" then 
                kk = '['..kk.."]"
            end 
            vv = value[fieldName]
            entry = kk .. " = " .. __tostring(value[fieldName],indent..'  \t',vmap)

            str = str..separator..indent..'  \t'..entry
            separator = ", \n"
        end)

        str = str..'\n'..indent..'}'
    end

    return str
end

ccmlog = function(m,fmt,...)
    local args = {...}
    for k,arg in ipairs(args) do
        if type(arg) == 'table' 
            or type(arg) == 'boolean' 
            or type(arg) == 'function' 
            or type(arg) == 'userdata' then
            args[k] = __tostring(arg)
        end
    end

    args[#args+1] = "nil"
    args[#args+1] = "nil"
    args[#args+1] = "nil"
    local str = string.format("[%s]:"..fmt.." %s", m, unpack(args))
    print(str)

    local off = 1
    local p = CCLOGWARN 
    if m == 'error' then 
        p = CCLOGERROR 
    elseif m == 'warn' then 
        p = CCLOGWARN
    end
    while off <= #str do 
        local subStr = string.sub(str, off, off+1024)
        off = off + #subStr
        --p(subStr)
    end
end

--打印测试
reserved =  { [100] = { 300, 400}, 200, { 300, 500}, abc = "abc",[0] = {1,2,3,"abc"}}

-- ccmlog("d","d",reserved)


-- ===Lua中的元表与元方法
-- 我们称元表中的键为事件（event）称值为元方法（metamethod）前述例子中的事件是"add",元方法是执行加法的函数

-- __add(a, b) --加法
-- __sub(a, b) --减法
-- __mul(a, b) --乘法
-- __div(a, b) --除法
-- __mod(a, b) --取模
-- __pow(a, b) --乘幂
-- __unm(a) --相反数
-- __concat(a, b) --连接
-- __len(a) --长度
-- __eq(a, b) --相等
-- __lt(a, b) --小于
-- __le(a, b) --小于等于
-- __index(a, b) --索引查询
-- __newindex(a, b, c) --索引更新（PS：不懂的话，后面会有讲）
-- __call(a, ...) --执行方法调用
-- __tostring(a) --字符串输出
-- __metatable --保护元表


--===算术类的元方法
Set = {}
local mt = {} -- 集合的元表

-- 根据参数列表中的值创建一个新的集合
function Set.new(l)
    local set = {}
     setmetatable(set, mt)
    for _, v in pairs(l) do set[v] = true end
     return set
end

-- 并集操作
function Set.union(a, b)
	if getmetatable(a)~=mt or getmetatable(b)~=mt then
		error("metatable error.")
	end

    local retSet = Set.new{} -- 此处相当于Set.new({})
    for v in pairs(a) do retSet[v] = true end
    for v in pairs(b) do retSet[v] = true end
    return retSet
end

-- 交集操作
function Set.intersection(a, b)
    local retSet = Set.new{}
    for v in pairs(a) do retSet[v] = b[v] end
    return retSet
end

-- 打印集合的操作
function Set.toString(set)
     local tb = {}
     for e in pairs(set) do
          tb[#tb + 1] = e
     end
     return "{" .. table.concat(tb, ", ") .. "}"
end

function Set.print(s)
     print(Set.toString(s))
end
local set1 = Set.new({10, 20, 30,1})
local set2 = Set.new({1, 2})
print(getmetatable(set1))
print(getmetatable(set2))
print(assert(getmetatable(set1) == getmetatable(set2)))
mt.__add=Set.union
local set3 = set1 + set2
Set.print(set3)
local set4 = Set.intersection(set1,set2)
Set.print(set4)


--==如何保护我们的“奶酪”——元表
-- 使用getmetatable就可以很轻易的得到元表，使用setmetatable就可以很容易的修改元表，
-- 那这样做的风险是不是太大了，那么如何保护我们的元表不被篡改呢？

-- 当我们想要保护集合的元表，是用户既不能看也不能修改集合的元表，那么就需要使用metatable字段了；
-- 当设置了该字段时，getmetatable就会返回这个字段的值，而setmetatable则会引发一个错误；

function Set.new(l)
    local set = {}
     setmetatable(set, mt)
    for _, v in pairs(l) do set[v] = true end
     mt.__metatable = "You cannot get the metatable" -- 设置完我的元表以后，不让其他人再设置
     return set
end

local tb = Set.new({1, 2})
print(tb)

print(getmetatable(tb))
-- setmetatable(tb, {})
print("--===--===--===--===--")


--=== __index元方法
-- 当table没有这个字段，则会促使解释器去查找一个叫__index的元方法，接下来就就会调用对应的元方法，返回元方法返回的值
-- 如果没有这个元方法，那么就返回nil结果

Windows = {} -- 创建一个命名空间

-- 创建默认值表
Windows.default = {x = 0, y = 0, width = 100, height = 100, color = {r = 255, g = 255, b = 255}}

Windows.mt = {} -- 创建元表

-- 声明构造函数
function Windows.new(o)
     setmetatable(o, Windows.mt)
     return o
end

-- 定义__index元方法
Windows.mt.__index = function (table, key)
     return Windows.default[key]
end
-- 或者用Windows.mt.__index = Windows.default
local win = Windows.new({x = 10, y = 10})
print(win.x)              -- >10 访问自身已经拥有的值
print(win.width)          -- >100 访问default表中的值
print(win.color.r)        -- >255 访问default表中的值
win.z=189
print(win.z)


--===__newindex元方法
-- newindex用于更新table中的数据，而index用于查询table中的数据
-- 1.如果有了元表，就查找元表中是否有__newindex元方法；如果没有元表，就直接添加这个索引，然后对应的赋值；
-- 2.如果有这个__newindex元方法，Lua解释器就执行它，而不是执行赋值；
-- 3.如果这个__newindex对应的不是一个函数，而是一个table时，Lua解释器就在这个table中执行赋值，而不是对原来的table

-- table.concat(table, sep,  start, end)
test = {"Tom", "Mary", "Jam","Hey"}

print(table.concat(test, ":"))
print("*************")
print(table.concat(test, nil, 1, 2))
print("*************")
print(table.concat(test, "\n", 2, 3))


--===Lua 函数回调技巧
local a = {}
function b()
	print("hello world")
end
a["sell"]={callfunc=b}
a["sell"].callfunc()

-- 使用lua 自带的 unpack :
function unpackex(tbl, args)    
	local ret = {}    
	for _,v in ipairs(args) do        
		table.insert(ret, tbl[v])    
		end    
	return unpack(ret)
end
-- print(unpackex({one = {"one", "two", "three"}, two = "T" , three = "TH"},{"one", "two", "three"}))


--===Lua中的常用操作系统库
-- os.time ([table])
print(os.time())
print(os.time{year=1970, month=1, day=1,hour=8})
print(os.time{year=1970, month=1, day=1}) --若未定义“时，分，秒”,默认时间为正午（04:00:00）


-- os.date ([format [, time]])
print("--===--===--===--===--")
t = os.date("*t", os.time());
for i, v in pairs(t) do
      print(i,"->",v);
end
print(os.date("today is %A, in %B"))
print(os.date("%Y/%m/%d %H:%M:%S", os.time()))



--===Lua string库
-- 一、String库的常用函数：
print("--===--===--===--===--")
--返回字符串s的长度
local s = "HelloWorld"
print(string.len(s))  -->10

--重复n次字符串s的串
print(string.rep(s,2))  -->HelloWorldHelloWorld

--大写字母转换成小写
print(string.lower(s))  -->helloworld

--小写转换成大写
print(string.upper(s))  -->HELLOWORLD

--截取字符串
local s = "[in brackets]"
print(string.sub(s,2,-1))  -->in brackets]

--将每一个数字转换成字符
print(string.char(97))  -->a

--将每一个字符转换成数字
print(string.byte("abc"))
print(string.byte("abc", 2)) --> 98
print(string.byte("abc", -1)) --> 99

--注：使用负数索引访问字符串的最后一个字符

--对字符串进行格式化输出
PI = 3.14165120
print(string.format("pi = %.4f", PI))  -->pi = 3.1417
--注释：使用和C语言的printf函数几乎一模一样，你完全可以照C语言的printf来使用这个函数.


-- ===二、String库的模式匹配函数

-- 在string库中功能最强大的函数是：string.find（字符串查找），string.gsub（全局字符串替换），
-- and string.gfind（全局字符串查找）。这些函数都是基于模式匹配的。
-- 1.string.find 
local s = "hello world"
i,j = string.find(s,"hello")
print(i,"   ",j)  -->1      5
print(string.find(s, "kity"))  -->nil


-- string.find函数第三个参数是可选的：标示目标串中搜索的起始位置。
-- 当我们想查找目标串中所有匹配的子串的时候，这个选项非常有用。
local s = "\nare you ok!\n OK\n"
local t = {}
local i = 0
while true do
    i = string.find(s,"\n",i+1)
    if i == nil then break end
    table.insert(t,i)   
end
for k,v in pairs(t) do
    print(k,"->",v)  
end


--===Lua中的模块与module函数
-- 一个模块就是一个程序库，可以通过require来加载。然后便得到了一个全局变量，表示一个table。
-- 这个table就像是一个命名空间，其内容就是模块中导出的所有东西，比如函数和常量，一个符合规范的模块还应使require返回这个table。
game = require "game"
game.play()
game.quit()


--===Lua IO库
local t = io.write("sin (3) = ", math.sin(3), "\n")

file = io.open("testRead.txt","r")
for line in file:lines() do
	print(line)
end
file:close()

file = io.open("testRead.txt","a+")
file:write("\n world")
file:close()


--===理解Lua 语言中的点、冒号与self
-- 点号定义和点号调用:
girl = {money = 200}
function girl.goToMarket(girl ,someMoney)
    girl.money = girl.money - someMoney
end
girl.goToMarket(girl ,100)
print(girl.money)


-- 参数self指向调用者自身(类似于c++里的this 指向当前类)
girl = {money = 200}
function girl.goToMarket(self ,someMoney)
    self.money = self.money - someMoney
end
girl.goToMarket(girl, 100)
print(girl.money)


girl = {money = 200}
function girl:goToMarket(someMoney)
    self.money = self.money - someMoney
end
girl:goToMarket(100)
print(girl.money)

-- 冒号定义和冒号调用其实跟上面的效果一样，只是把第一个隐藏参数省略了，而该参数self指向调用者自身。

-- 总结：冒号只是起了省略第一个参数self的作用，该self指向调用者本身，并没有其他特殊的地方。


function allwords()
	file= io.open("testRead.txt","r")
        for line in file:lines() do    -- 当前行
        local pos = 1             -- 一行中的当前位置
        return function()         -- 迭代器函数
            while line do         -- 若为有效的行内容就进入循环
                local s, e = string.find(line, "%w+", pos)
                if s then         -- 是否找到一个单词
                    pos = e + 1   -- 该单词的下一个位置
                    return string.sub(line, s, e)    -- 返回该单词
                else
                       -- 没有找到单词，尝试下一行
                    pos = 1             -- 在第一个位置上重新开始
                end
            end
            return nil                  -- 没有其余行了，遍历结束
        end
       end

    end
 -- for word in allwords() do
 --        print(word)
 --    end






































































































































