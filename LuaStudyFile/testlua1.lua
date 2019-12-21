print(2e+1)
print(2e-1)


-- for i=1,f(x) do
--     print(i)
-- end
 
-- for i=10,1,-1 do
--     print(i)
-- end


function add( ... )
	local s = 0
	for i,v in ipairs{...} do
		s=s+v
	end
	return s
end
print(add(3,4,5,6,7,8))


function average( ... )
	local result = 0
	for i,v in ipairs{...} do
		result = result+v
	end
	print("the number is:",#{...})
	print("总共传入 " .. select("#",...) .. " 个数")
	print("the average is:",result/#{...})
end

average(1,4,7)


print(string.upper("under"))
under = string.upper("under")
print(string.lower(under))
print(string.gsub("find the string number in the number","number","code",1))

str1 = "find the string in the number"
print(string.find("hello lua user lua","lua",1))
print(string.find("hello lua user lua","lua",8))

print(string.reverse("find the string in the number"))

print(string.format("the value is:%d",584,940))

print(string.char(44,66,88))
print(string.byte("BX",2))
print(string.byte("BX"))

print(string.len("abcd"))
print(string.rep("abcd ",3))

print("www.runoob.".."com")

print(string.gmatch("find the string in the number","%a+"))
arrayWord={}
local k1 = 0
for word in string.gmatch("find the string in the number","%a+")do
	print(word)
	k1=k1+1
	arrayWord[k1]=word
end
local len=#arrayWord
for k,v in pairs(arrayWord)do
	io.write(arrayWord[len].." ")
    len=len-1
end
print("\n")
print(string.match("I have 2 questions for you.","%d+ %a+"))

print(string.format("%d,%q",string.match("I have 2 questions for you.","(%d+) (%a+)")))

print(string.format("%E",2000))

print(string.format("%05d",17.00000))
print(string.format("%5d",17.00000))
print(string.format("%0.5d",17.00000))
print(string.format("%.5d",17.00000))
print(string.format("%5.5d",17.00000))
print(string.format("%0.5d",17.00000))


function square(iteratorMaxCount,currentNumber)
   if currentNumber<iteratorMaxCount
   then
      currentNumber = currentNumber+1
   return currentNumber, currentNumber*currentNumber
   end
end

for i,n in square,3,0
do
   print(i,n)
end


mytable= {}
mytable[1]="Lua"
mytable=nil

fruits = {"banana","orange","apple"}
print("lianjiehou: ",table.concat(fruits))
print("lianjiehou: ",table.concat(fruits, ", "))
print("lianjiehou: ",table.concat(fruits, ", ", 2, 3))

table.insert(fruits,"mango")
print("the 4 is:",fruits[4])
table.insert(fruits,2,"grapes")
print("the 5 is:",fruits[2])
table.remove(fruits)
for i,v in pairs(fruits)do
	print(i,v)
end
table.remove(fruits,4)
for i,v in pairs(fruits)do
	print(i,v)
end

print("----------+++++++++++--------------")
fruits ={"banana","orange","apple","grapes"}
for i,v in pairs(fruits)do
	print(i,v)
end
table.sort(fruits)
for i,v in pairs(fruits)do
	print(i,v)
end


function tablemax(t)
  local mn = nil
  for k,v in pairs(t)do
	if(mn==nil)then
		mn=v
	end
	if(mn<v)then
		mn=v
	end
	end
	return mn
end
tabl={[1]=1,[2]=2,[3]=3,[4]=4,[5]=5}
print("tablename:", tablemax(tabl))

local mod = require("module")
mod.func3()


-- (往往是一个函数或是table）就是"元方法"

mytable={}
mymetatable={}
mytable= setmetatable(mytable,mymetatable)
print(getmetatable(mytable))

mytable1 = setmetatable({key1 = "value1"}, {
  __index = function(mytable1, key)
    if key == "key2" then
      return "metatablevalue"
    else
      return nil
    end
  end
})
print(mytable1.key1,mytable1.key2,mytable1.key3)


mytable2 = setmetatable({key1 = "value1"},{__index = {key2 = "metatablevalue"}})
print(mytable2.key1,mytable2.key2)

-- __newindex 元方法用来对表更新，__index则用来对表访问
mymetatable = {}
mytable = setmetatable({key1="value1"},{__newindex = mymetatable})
print(mytable.key1)
mytable.newkey = "新值2"
print(mytable.newkey,mymetatable.newkey)
mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)


mytable = setmetatable({key1 = "value1"},{__newindex = function (mytable,key,value)
	rawset(mytable,key,"\""..value.."\"")
end})
mytable.key1 = "newkey"
mytable.key2 = 4
print(mytable.key1,mytable.key2)



-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大键值函数 table_maxn，即计算表的元素个数
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

-- 两表相加操作
mytable = setmetatable({ 1, 2, 3 }, {
  __add = function(mytable, newtable)
    for i = 1, table_maxn(newtable) do
      table.insert(mytable, table_maxn(mytable)+1,newtable[i])
    end
    return mytable
  end
})

secondtable = {4,5,6}

mytable = mytable + secondtable
for k,v in ipairs(mytable) do
    print(k,v)
end


-- 定义元方法__call
mytable = setmetatable({10}, {
  __call = function(mytable, newtable)
    sum = 0
    for i = 1, table_maxn(mytable) do
        sum = sum + mytable[i]
    end
    for i = 1, table_maxn(newtable) do
        sum = sum + newtable[i]
    end
    return sum
  end
})
newtable = {10,20,30}
print(mytable(newtable))


co = coroutine.create(
	function(i)
		print(i);
	end)
print(coroutine.status(co))
coroutine.resume(co,1)
print(coroutine.status(co))
print("----====----====----")

co = coroutine.wrap(
	function(i)
		print(i);
	end)
co(1)
print("----====----====----")


co2 = coroutine.create(
	function()
		for i=1,10 do
			print(i)
			if i==3 then
				print(coroutine.status(co2))
				print(coroutine.running())
			end
			coroutine.yield()
		end
	end)

coroutine.resume(co2)
coroutine.resume(co2)
coroutine.resume(co2)

print(coroutine.status(co2))
print(coroutine.running())
print("---------------------")


function foo(a)
	print("foo shuchu",a)
	return coroutine.yield(2*a)
end

co=coroutine.create(function (a,b)
	print("the first coroutine shuchu",a,b)
	local r = foo(a+1)
	print("the second coroutine shuchu",r)
	local r,s = coroutine.yield(a+b,a-b)
	print("the three coroutine shuchu",r,s)
	return b,"finish coroutine"
end)

print("main",coroutine.resume(co,1,10))
print("main",coroutine.resume(co,"r"))
print("main",coroutine.resume(co,"x","y"))
print("main",coroutine.resume(co,"x","y"))


local newProductor

function productor()
	local i = 0
	while i<=20 do
		i=i+1
		send(i)
   end
end

function consumer()
	local i = 0
	while i<=20 do
		i=i+1
		local i = receive()
		print(i)
	end
end

function receive()
	local status,value = coroutine.resume(newProductor)
	return value
end

function send(x)
	coroutine.yield(x)
end

newProductor = coroutine.create(productor)
consumer()


print(io.type("module.lua"))


file = io.open("module.lua","r")
io.input(file)
print(io.read("*a"))
io.close(file)


-- file = io.open("module.lua","a")
-- io.output(file)
-- io.write("-- test zhushi")
-- io.close(file)


-- file = io.open("module.lua","r")
-- print(file:read())
-- file:close()
-- file=io.open("module.lua","a")
-- file:write("--test")
-- file:close()


local function add(a,b)
	assert(type(a) =="number","a is not a number")
    assert(type(b) =="number","b is not a number")
return a+b
end
print(add(10,5))


local ab=pcall(function(i) print(i) end,33)
print(ab)

local ab=pcall(function(i) print(i) error("error..") end,33)
print(ab)

-- debug.debug：提供一个Lua提示符，让用户来检查错误的原因
-- debug.traceback：根据调用桟来构建一个扩展的错误消息

pcall(function(i) print(i) error("error..") end,function() print(debug.traceback()) end, 33)

function myfunction()
	n=n/nil
end

function myerrorandler(err)
	print("error:",err)
end

status = xpcall(myfunction,myerrorandler)
print(status)


function myfunc()
	print(debug.traceback("stack trace"))
	print(debug.getinfo(1))
	print("stack trace end")
	return 10
end
myfunc()
print(debug.getinfo(1))


function newCounter()
	local n = 0
	local k = 0
	return function()
		k = n
		n = n + 1
		return n
	end
end

counter = newCounter()
print(counter())
print(counter())

local i = 1
repeat
	name,val = debug.getupvalue(counter,i)
	if name then
		print("index",i,name,"=",val)
		if(name == "n")then
			debug.setupvalue(counter,2,10)
		end
		i=i+1
	end
until not name

print(counter())

myfruitstable = {"apple","orange","banana"}
print(collectgarbage("count"))
myfruitstable = nil
print(collectgarbage("count"))
print(collectgarbage("collect"))
print(collectgarbage("count"))



Account = {balance = 0}
function Account.withdraw(v)
	Account.balance = Account.balance - v
	return Account.balance
end
print(Account.withdraw(100.00))


Rectangle = {area = 0, length = 0, breadth = 0}

function Rectangle:new(o,length,breadth)
	o = o or {}
	setmetatable(o,self)
	self.__index=self
	self.length=length or 0
	self.breadth=breadth or 0
	self.area=length * breadth
	return o
end
function Rectangle:printArea()
	print("RectangleArea:",self.area)
end
Rectangle:new({},11,22)
Rectangle:printArea()


r=Rectangle:new(nil,10,20)
print(r.length)
r:printArea()



--shape jicheng paisheng
Shape = {area = 0}
function Shape:new(o,side)
	o = o or {}
	setmetatable(o,self)
	self.__index=self
	side=side or 0
	self.area = side*side
	return o
end

function Shape:printArea1()
	print("Area is:",self.area)
end

myshape = Shape:new(nil,10)
myshape:printArea1()

Square = Shape:new()
function Square:new(o,side)
	o = o or Shape:new(o,side)
	setmetatable(o,self)
	self.__index=self
	return o
end
function Square:printArea1()
	print("Square's Area is :",self.area)
end

mysquare = Square:new(nil,10)
mysquare:printArea1()

Rectangle = Shape:new()
function Rectangle:new(o,length,breadth)
	o = o or Shape:new(o)
	setmetatable(o,self)
	self.__index = self
	self.area = length*breadth
	return o
end

function Rectangle:printArea2( ... )
	print("Rectangle's Area is:",self.area)
end

myrectangle = Rectangle:new(nil,10,20)
myrectangle:printArea2()

i=10
while i<20 do
	i=i+1
	print("i:",i)
end

i=10
repeat
	i=i+1
	print("i:",i)
until i>=20

print("for..for")
for i=1,9 do
	for j=1,i do
		io.write(i.." * "..j.." =:"..string.format("%.2d",i*j).." ")
	end
    print("\n")
end
print("while..while")
i=0
while i<9 do
	i=i+1
	j=1
	while j<=i do
		io.write(i.." * "..j.." =:"..string.format("%.2d",i*j).." ")
        j=j+1
	end
	print("\n")	
end
print("repeat..repeat")
i=0
repeat
	i=i+1
	j=0
    repeat
    	j=j+1
    	io.write(i.." * "..j.." =:"..string.format("%.2d",i*j).." ")   
    until j>=i
    print("\n")
until i>=9
print("repeat..for")
i=0
repeat
	i=i+1
	for j=1,i do
    	io.write(i.." * "..j.." =:"..string.format("%.2d",i*j).." ")   
    end
    print("\n")
until i>=9


-- break语句将停止最内层循环的执行，并开始执行的外层的循环语句
i=10
repeat
	i=i+1
	print("i:",i)
	if i>=15 then
		break
	end
until i>=20

i=88
if (i<60)then
	print("bujige")
elseif(60<=i and i<80)then
	print("zhong")
elseif(80<=i and i<90)then
	print("liang")
else
	print("you")
end


function maxValue(num1,num2)
	if(num1>num2)then
		print("the maxValue is:",num1)
	else print("the maxValue is:",num2)
	end
end
maxValue(2,5)

function maxValueArray(...)
	local arg = {...}
	local maxValue = arg[1]
	for i,v in ipairs(arg)do
		if(v>arg[1])then
			maxValue = v
			maxi = i
		end
	end
	print("the maxValueArray is: "..maxValue..", in the "..maxi.." position")
	return maxValue,maxi
end
maxValueArray(18,29,5,7,-4)

function averageArray(...)
	local arg = {...}
	local len = #arg
	local sum = 0
	local stv = 0
	for i,v in ipairs(arg)do
		sum = sum + v
	end
	print("the average is:"..sum/len)
	for i,v in ipairs(arg)do
		stv = stv + (v-sum/len)^2
	end
	print("the stv is:"..math.sqrt(stv)/len)
end
averageArray(18,29,5,7,-4)

print([["lua string"]])


print(string.format("the value is %0.2d",4))
print(string.format("the value is %2d",4))
print(string.format("the value is %4.2f",4.4))
print(string.format("the value is %5.2f",4.4))
print(string.format("the value is %-5.2f",4.4))


print(string.char(33,66,77,88))
print(string.rep("I find it ",3))

-- ge shi hua shu chu
local string1 = "lua"
local string2 = "Tutorial"
local number1 = 10
local number2 = 20
print(string.format("basic xin xi",string1,string2))
local date,month,year = 2,1,2014
print(string.format("date xin xi %2d/%2d/%4d",date,month,year))
print(string.format("date xin xi %02d/%02d/%04d",date,month,year))
print(string.format("%.4f",1/3))
print(string.format("%0.4f",1/3))
print(string.format("%7.4f",1/3))
print(string.format("%07.4f",1/3))

array = {"Lua", "Tutorial"}
for key,value in ipairs(array) 
do
   print(key, value)
end

fruits = {"banana","orange","apple"}
-- 返回 table 连接后的字符串
print("连接后的字符串 ",table.concat(fruits,", "))

table.insert(fruits,"mango")
print("索引为 4 的元素为 ",fruits[4])
table.remove(fruits,4)
print("移除后最后一个元素为 ",fruits[3],fruits[4],fruits[5])


fruits = {"banana","orange","apple","grapes"}
print("排序前")
for k,v in ipairs(fruits) do
   print(k,v)
end
table.sort(fruits)
print("排序后")
for k,v in ipairs(fruits) do
   print(k,v)
end


require("module")
-- 会返回一个由模块常量或函数组成的 table，并且还会定义一个包含该 table 的全局变量
-- 即等同于 mod = require("module") 返回的是该模块中的table，及赋给该table名的变量
print(mod.constant)

local m = require("module")
print(m.constant)


other = {foo = 5}
tab = setmetatable({a=6},{__index = other})
print(tab.foo)

tab1 = setmetatable({key1="key1"},{__index=function(tab1,key)
	if (key == "key2")then
		return "key2"
	else
		return "no key"
	end
end})

print(tab1.key1,tab1.key2)

tab2 = setmetatable({key1 = "key1"},{__index={key2 = "mymetatable"}})
print(tab2.key1,tab2.key2)
tab2 = setmetatable({key1 = "key1"},{__index={key2 = "mymetatable"}})
print(tab2.key1,tab2["key2"])


mymetatable1={}
tab3 = setmetatable({key1 = "key1"},{__newindex = mymetatable1})
tab3.newkey = "newvalue"
print(tab3.key1,tab3.newkey,mymetatable1.newkey)
tab3.key1 = "key1 change"
print(tab3.key1,tab3.key1,mymetatable1.key1)


tab4 = setmetatable({key1 = "key1"},{__index = function(tab4,key,value)
	 rawset(tab4,key,"\""..value.."\"")
end})
tab4.key1 = "new value"
tab4.key2 = 4
print(tab4.key1,tab4.key2)


tab5 = setmetatable({1,66,5},{__add=function(tab5,matatab)
	   for i=1,#matatab do
	   	table.insert(tab5,#tab5+1,matatab[i])
	   end
	   return tab5
end})
matatab3 = {88,9,5}
mytable ={}
mytable = tab5 + matatab3
for i,v in pairs(mytable)do
	print(i,v)
end
print("---===---===---")
table.sort( mytable)
for i,v in pairs(mytable)do
	print(i,v)
end

print("---===--{1,55,67}--===---")
tab = setmetatable({1,55,67},{__add = function(tab,matatab)
	  for i =1,#matatab do
	  	tab[i] = tab[i]+matatab[i]
	  end
	  return tab
end})
matatab = {5,4,78}
tabadd = tab + matatab
for i,v in pairs(tabadd) do
	print(i,v)
end
print("---===--mytable--===---")
mytable = {1,55,67}
tab = setmetatable(mytable,{__add = function(tab,matatab)
	  for i =1,#matatab do
	  	tab[i] = tab[i]+matatab[i]
	  end
	  return tab
end})
matatab = {5,4,78}
tabadd = mytable + matatab
for i,v in pairs(tabadd) do
	print(i,v)
end

print("---===--cheng--===---")
mytable = {1,55,67}
tab = setmetatable(mytable,{__mul = function(tab,matatab)
	  for i =1,#matatab do
	  	tab[i] = tab[i]*matatab[i]
	  end
	  return tab
end})
matatab = {5,4,78}
tabadd = mytable * matatab
for i,v in pairs(tabadd) do
	print(i,v)
end

print("---===--chufa--===---")
mytable = {1,55,67}
tab = setmetatable(mytable,{__div = function(tab,matatab)
	  for i =1,#matatab do
	  	tab[i] = tab[i]/matatab[i]
	  end
	  return tab
end})
matatab = {5,4,78}
tabadd = mytable / matatab
for i,v in pairs(tabadd) do
	print(i,string.format("%.2f",v))
end

print("---===--jianfa--===---")
mytable = {1,55,67}
tab = setmetatable(mytable,{__sub = function(tab,matatab)
	  for i =1,#matatab do
	  	tab[i] = tab[i]-matatab[i]
	  end
	  return tab
end})
matatab = {5,4,78}
tabadd = mytable - matatab
for i,v in pairs(tabadd) do
	print(i,v)
end

print("---===--交集--===---")
mytable = {1,5,67}
tab = setmetatable(mytable,{__add = function(tab,matatab)
	mytab={}
	  for i =1,#mytable do
	  	 for j = 1,#matatab do
             if mytable[i]==matatab[j] then
             	-- for k=1,#mytable do
             		table.insert(mytab,mytable[i])
             	-- end
             end
	  	 end
	  end
	  return mytab
end})
matatab = {5,1,78}
tabadd = mytable + matatab
for i,v in pairs(tabadd) do
	print(i,v)
end

print("---===--并集--===---")
mytable = {1,5,67,99}
tab = setmetatable(mytable,{__add = function(tab,matatab)
	  for i =1,#mytable do
	  	 for j = 1,#matatab do
             if mytable[i]==matatab[j] then
             	    matatab[j]=nil
             end
	  	 end
	  end
      for k=1,#matatab do
      	table.insert(tab,#tab+1,matatab[k])
      end
	  return tab
end})
matatab = {5,1,78,6}
tabadd = mytable + matatab
table.sort( tabadd)
for i,v in pairs(tabadd) do
	print(i,v)
end


-- _call 元方法在 Lua 调用一个值时调用,只用传人一个值即可
print("------------__call-------------------------")
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end
-- 定义元方法__call
mytable = setmetatable({10}, {
  __call = function(mytable, newtable)
	sum = 0
	for i = 1, table_maxn(mytable) do
		sum = sum + mytable[i]
	end
    for i = 1, table_maxn(newtable) do
		sum = sum + newtable[i]
	end
	return sum
  end
})
newtable = {10,20,30}
print(mytable(newtable))

-- __tostring 元方法用于修改表的输出行为
print("------------__tostring-------------------------")
table1 = { 10, 20, 30 }
mytable = setmetatable(table1, {
  __tostring = function(mytable)
    sum = 0
    for k, v in pairs(mytable) do
        sum = sum + v
 end
    return "表所有元素的和为 " .. sum
  end
})
print(mytable)

print("----==一围矩阵转n维矩阵==----")
tab = {10,20,30,40,50,60,70,80,90}
mytab = {}
io.write("{\n")
for i =1,#tab,math.sqrt(#tab)do
	mytab[i]={}
	io.write("{")
	for j =1,math.sqrt(#tab)do
        mytab[i][j]=tab[i+j-1]
        io.write(mytab[i][j]..",")
    end
    io.write("}\n")
end
io.write("}")


print("----==一围矩阵转m*n维矩阵==----")
tab = {10,20,30,40,50,60,70,80,90,100}
function matrix(tab,m,n)
mytab = {}
io.write("{\n")
for i =1,m do
	mytab[i]={}
	io.write("{")
	for j =1,n do
        mytab[i][j]=tab[i+j-1]
        io.write(mytab[i][j]..",")
    end
    io.write("}\n")
end
io.write("}\n")
end
matrix(tab,2,5)

print("===----协同程序----===")
-- 协同程序内只能用匿名函数？
co1 = coroutine.create(
	function()
		print("first coroutine progrem")
		print(coroutine.status(co1))
	end
	)
print(coroutine.resume(co1))
print(coroutine.status(co1))


co2 = coroutine.create(
	function()
		for i=1,10 do
			print(i)
			if i==3 then
				print(coroutine.status(co2))
				print(coroutine.running())
			end
			print(coroutine.yield())
		end
	end)
coroutine.resume(co2)
coroutine.resume(co2)
coroutine.resume(co2)
print(coroutine.status(co2))
print(coroutine.running())

print("----====--resume-yield--====----")
corout = coroutine.create(function(a,b,c)
	 print(a,b,c)
end)
coroutine.resume(corout,4,7,9)


co = coroutine.create(function (a,b)
	 coroutine.yield(a+b,a-b)
end)
print(coroutine.resume(co,10,5))




print("====--fileopen--====")

-- 完全模式（complete model） 使用外部的文件句柄来实现
-- 它以一种面对对象的形式，将所有的文件操作定义为文件句柄的方法
filemodule = io.open("module.lua","r")
io.input(filemodule)
print(io.type(filemodule))
print(io.read())
io.close(filemodule)


filemodout = io.open("module.lua","a")
io.output(filemodout)
io.write("-- test.lua\n")
io.close(filemodout)


file = io.open("module.lua","r")
print(file:read())--"*a"
file:close()
file = io.open("module.lua","a")
file:write("--wangquantest.lua\n")
print(file:seek())
file:close()


for line in io.lines("module.lua")do
	print(line)
end

print("----====end -25====----")
file = io.open("module.lua", "r")
file:seek("end",-25)
print(file:read("*a"))
file:close()


-- pcall接收一个函数和要传递给函数的参数
print(pcall(function(i) print(i) end,33))
-- error 终止正在执行的函数，并返回message的内容作为错误信息
print(pcall(function(i) print(i) error("error...") end,33))

-- print(xpcall(function(i) print(i) error('error..') end,function()print(debug.traceback())end,33))

print(debug.getinfo(2))
-- print(debug.getfenv(tab))


-- 创建对象是为类的实例分配内存的过程。每个类都有属于自己的内存并共享公共数据
r = Rectangle:new(nil,10,20)
-- 为类renctangle创建一个名为r的对象

local function create1(id,name)
	local date = {name=name,id=id}
	local obj = {}
	function obj:setId(id)
		date.id = id
	end
	function obj:setName(name)
		date.name = name
	end
	function obj:getId()
		return date.id
	end
	function obj:getName()
		return date.name
	end
	return obj
end

obj = create1(11,"lucy")
print("the id:"..obj.getId().."the name:"..obj.getName())

local t = {}
local m = {a = "and",b = "Li Lei", c = "Han Meimei"}

setmetatable(t,{__index = m})  --表{ __index=m }作为表t的元表

for k,v in pairs(t) do  --穷举表t
    print("有值吗？")
    print(k,"=>",v)
end

print("-------------")
print(t.b, t.a, t.c)
m.b = "xiongxiong"
print(t.b,m.b)

local function add(...)
	assert(#t1 == #t2)
	local length = #t1
	for i=1,#t1 do
		t1[i] = t1[i] +t2[i]
    end
   return t1  
end
t1 = {3,58,9}
t2 = {55,87,5}
t1 = setmetatable(t1,{__add =add})
-- t2 = setmetatable(t2,{__add =add})

for k,v in pairs(t1)do
	print(k,v)
end
for k,v in pairs(t2)do
	print(k,v)
end

t1 = t1+t2
for i=1,#t1 do
	print(t1[i])
end


local Robot = { name = "Sam", id = 151 }
function Robot:New(extension)
    local t = setmetatable(extension or { }, self) 
    self.__index = self
    return t
end
t = Robot:New(nil)
for i,v in pairs(t)do
	print(i,v)
end
print(t.name,t.id)

















































































