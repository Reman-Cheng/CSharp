-- ===Lua 变量
-- 变量在使用前，必须在代码中进行声明，即创建该变量。
-- 编译程序执行代码之前编译器需要知道如何给语句变量开辟存储区，用于存储变量的值。
-- Lua 变量有三种类型：全局变量、局部变量、表中的域。
-- Lua 中的变量全是全局变量，那怕是语句块或是函数里，除非用 local 显式声明为局部变量。
-- 局部变量的作用域为从声明位置开始到所在语句块结束。
-- 变量的默认值均为 nil	

a = 5               -- 全局变量
local b = 5         -- 局部变量

function joke()
    c = 5           -- 全局变量
    local d = 6     -- 局部变量
end

joke()
print(c,d)          --> 5 nil

do 
    local a = 6     -- 局部变量
    -- b = 6           -- 对局部变量重新赋值
    print(a,b);     --> 6 6
end

print(a,b)

print(var11)
function testvar()
	var11=19
	return 0
end
testvar()
print(var11)

-- ===赋值语句
-- 赋值是改变一个变量的值和改变表域的最基本的方法
a = "hello" .. "world"
-- t.n = t.n + 1
-- Lua可以对多个变量同时赋值，变量列表和值列表的各个元素用逗号分开，赋值语句右边的值会依次赋给左边的变量
a, b = 10, 2*10
-- 遇到赋值语句Lua会先计算右边所有的值然后再执行赋值操作，所以我们可以这样进行交换变量的值：
x, y = y, x                     -- swap 'x' for 'y'
-- a[i], a[j] = a[j], a[i]         -- swap 'a[i]' for 'a[j]'
-- 当变量个数和值的个数不一致时，Lua会一直以变量个数为基础采取以下策略：
-- a. 变量个数 > 值的个数             按变量个数补足nil
-- b. 变量个数 < 值的个数             多余的值会被忽略
a, b, c = 0, 1
print(a,b,c)             --> 0   1   nil
 
a, b = a+1, b+1, b+2     -- value of b+2 is ignored
print(a,b)               --> 1   2
 
a, b, c = 0
print(a,b,c)             --> 0   nil   nil
-- 上面最后一个例子是一个常见的错误情况，注意：如果要对多个变量赋值必须依次对每个变量赋值
a, b, c = 0, 0, 0
print(a,b,c)             --> 0   0   0
-- 多值赋值经常用来交换变量，或将函数调用返回给变量：
-- a, b = f()
-- f()返回两个值，第一个赋给a，第二个赋给b


-- ===索引
-- 对 table 的索引使用方括号 []。Lua 也提供了 . 操作

site = {}
site["key"] = "www.w3cschool.cc"
print(site["key"])
print(site.key)




a={x=10,y=20,z=30}
print(a)
print(4 or 5)
print(false or 5)
-- 对于and第一个为假就返回第一个否则第二个，or第一个为真就返回第一个否则第二个
w={x=0,y=0,label="console"}
x={math.sin(0),math.sin(1),math.sin(2)}
w[1]="another field"
x.f=w
print(w["x"])
print(w[1])
print(x.f[1])
print(x.f)


-- list = nil
-- for line in io.lines() do
-- 	list ={next=list,value=line}
-- end

-- local l = list
-- while l do
-- 	print(l.value)
-- 	l=l.next
-- end

polyline={color="blue",thickness=2,npoints=4,{x=0,y=0},{x=-10,y=9}}
print(polyline[1].x)
print(polyline[2].y)
a={[1]="red",[2]="green",[3]="blue",}
b={x=10,y=45;"one","two","three"}
print(a[2])
print(b[1])

-- a="hello".." world"
-- t.n=t.n+1

-- a,b=10,2*x
x,y=y,x
-- a[i],a[j]=a[j],a[i]

a,b,c=1,2
print(a,b,c)
a,b=a+1,b+1,b+2
print(a,b)
a,b,c=0
print(a,b,c)
a,b,c=0,0,0
print(a,b,c)


x=10
local i = 1
while i<=x do
	local x = i*2
	print(x)
	i=i+1
end
if i>20 then
	local x
	x=20
	print(x+2)
else
	print(x)
end
print(x)

local a,b,c = 1,10,0
do
  local a2 = 2*a
  local d = (b^2-4*a*c)^(1/2)
  x1=(-b+d)/a2
  x2=(-b-d)/a2
end
print(x1,x2)


local a,b = 1,10
if a<b then
	print(a)
	local a
	print(a)
end
print(a,b)



-- ipairs用于数组，pairs用于table,文件每行用io.lines ， 字符串中的单词用string.gmatch

print(4*3,9/8)
a=math.sin(3)+math.cos(10)
print(a)
print(os.date())


function add(a)
	-- body
	local sum = 0
	for i,v in ipairs(a) do
		sum =sum+v
	end
	return sum
end
-- print(add(1,2,5,6))

s,e = string.find("hello lua users","lua")
print(s,e)
strhell="hello lua users"
print("=================strrec==================")
-- strrec=strhell[s]
-- print(strrec)

-- function addsum(...)
-- 	local s = 0
-- 	for i,v in ipairs(...) do
-- 		s=s+v
-- 		end
-- 		return s
-- end
-- print(addsum(5,6,7,8,9))

function foo11( ... )
	local a,b,c = 1,5,7
end
function foo12( ... )
	print("calling foo12:",...)
	return foo11(...)
end
foo12(a,b,c)

function maximum(a)
	-- body
	local  mi = 1
	local  m = a[mi]
	for i, val in ipairs(a) do
		if val>m then
			mi=i;m=val
		end
	end
	return m,mi
end

print(maximum({8,10,23,12,5}))

function  fwrite(fmt,...)
	-- body
	return io.write(string.format(fmt,...))
end

-- fwrite()
fwrite("a")
fwrite("%d%d",4,5)
print("=========\n")

-- a={p=print}
-- a.p("hello world")
-- print=math.sin
-- a.p(print(1))
-- sin=a.p
-- sin(10,20)


-- arr13={10,20,30}
-- a,b,c=unpack(arr13)
-- print(a,b,c)

network={
	{name="grauna",ip="210.26.30.34"},
    {name="arraial",ip="210.26.30.23"},
    {name="lua",ip="210,26.23.12"},
    {name="derain",ip="210.26.23.20"},
}

recnetwork=table.sort(
	network,function (a,b)
	return
	(a.name>b.name)
	end)
-- print(network.name)
-- for i,v in pairs(recnetwork) do
-- 	print(recnetwork.i.name)
-- end

function  derivative(f,delta)
	-- body
	delta = delta or 1e-4
	return function (x)
	return(f(x+delta)-f(x))/delta
		-- body
	end
end

c=derivative(math.sin)
print(math.cos(10),c(10))


names = {"peter","paul","mary"}
grades={mary=10,paul=7,peter=8}
table.sort(names,function (n1,n2)
	return grades[n1]>grades[n2]
	-- body
end)


function sortbygrade(names,grades)
	-- body
	table.sort(naems,function (n1,n2)
		return grades[n1]>grades[n2]
		-- body
	end)
end



function newcounter()
	local i = 0
	return function ()
		i=i+1
		return i
	end
end

c1=newcounter()
print(c1())
print(c1())

c2=newcounter()
print(c2())
print(c1())
print(c2())



function  digitbutton(digit)
	return button{label = tostring(digit),
		action =function ()
			add_to_display(digit)
		end
	}
end


do
local  oldopen = io.open
  local access_ok = function (filename,mode)
  	
  	end
  	io.open =function (filename,mode)
  	if access_ok(filename,mode)then
  		return oldopen(filename,mode)
  		else
  			return nil,"access denied"
  		end
  	end
  end

-- san zhe xian tong

-- Lib={}
-- Lib.foo =function (x,y) return x+y end
-- Lib.goo =function (x,y) return x-y end

-- Lib={
-- 	foo =function (x,y) return x+y end,
-- 	goo =function (x,y) return x-y
-- 		-- body
-- 	end
-- }

Lib={}
function  Lib.foo(x,y) return x+y end
function  Lib.goo(x,y) return x-y end

print(Lib.foo(3,5))
print(Lib.goo(3,5))



-- function f(x)
-- 	return g(x)
-- end

-- function foo(n)
-- 	if n>0 then return foo(n-1)
-- end



-- function  room1()
-- 	local move = io.read()
-- 	if move == "south" then return room3()
-- 		elseif move == "east" then return room2()
-- 			else print("invalid move")
-- 				return room1()
-- end
-- end

-- function  room2()
-- 	local move = io.read()
-- 	if move == "south" then return room4()
-- 		elseif move == "west" then return room1()
-- 			else print("invalid move")
-- 				return room2()
-- end
-- end

-- function  room3()
-- 	local move = io.read()
-- 	if move == "north" then return room1()
-- 		elseif move == "east" then return room4()
-- 			else print("invalid move")
-- 				return room3()
-- end
-- end

-- function room4()
-- 	print("congratulation!")
-- end

-- room1()

-- 语法糖对于局部函数的定义
local function foo(canshu)
	--han shu ti
end
-- 和展开的形式
local foo
foo=function(canshu)
	-- han shu ti
end
-- 一样

local fact
fact=function(n)
	if n==0 then return 1
		else return n*fact(n-1)
	end
end

local function fact(n)
	if n==0 then return 1
		else return n*fact(n-1)
end
end

-- 尾调用 一个函数在调用一个函数之后就无其他事情可做，跳到另一个函数中






-- 表达式
-- a%b == a - floor(a/b)*b

local a = {};a.x=1;a.y=0
local b = {};b.x=1;b.y=0
print(a.x==b.x)

print("------------------")
print(4 and 5)        --> 5
print(nil and 13)     --> nil
print(false and 13)   --> false
print(4 or 5)         --> 4
print(false or 5)     --> 5

-- 还有一种习惯写法是“（a and b）or c”，这类似于C语言中的表达式a?b:c
-- max = ((x > y) and x) or y

-- 如果其任意一个操作数是数字的话，Lua会将这个数字转换成一个字符串：
print(0 .. 1)                --> 01

local days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
print(days[1])


-- -- 用table实现链表：
--     list = nil
--     for line in io.lines() do            -- 从标准输入读取每行的内容
--         list = {next=list, value=line}   -- 按相反的次序存储到一个链表中
--     end
--  -- 遍历该链表

--     local l = list
--     while l do
--         print(l.value)
--         l = l.next
--     end


-- 构造式{x=0, y=0}等价于{["x"]=0, ["y"]=0}
-- 构造式{"r", "g", "b"}等价于{[1]="r", [2]="g", [3]="b"}


-- 对于某些情况如果真的需要以0作为一个数组的起始索引的话，通过这种语法也可以轻松做到：
local days = {[0]="Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
print(days[0],days[1])







-- 语句
a = "hello" .. "world"
t = { n = 0 }
t.n = t.n + 1


x = 10                -- 全局变量
local i = 1           -- 程序块中的局部变量

while i <= x do
    local x = i*2     -- while循环体中的局部变量
    print(x)          --> 2, 4, 6, 8, ...
    i = i + 1
end

if i > 20 then
    local x           -- then中的局部变量
    x = 20
    print(x+2)        -- 如果测试成功会打印22
else
    print(x)          --> 10 （全局变量）
end

print(x)              --> 10 （全局变量）

local a,b = 1,5
-- if a < 0 then a = 0 end

-- if a < b then return a else return b end
local op = "+"
if op == "+" then
    r = a + b
elseif op == "-" then
    r = a - b
elseif op == "*" then
    r = a * b
elseif op == "/" then
    r = a / b
else
    error("invalid operation")
end


-- Lua不支持switch语句。
-- while
local a = {8,4,6,8,0,2}
 local i = 1
    while a[i] do
        print(a[i])
        i = i + 1
    end