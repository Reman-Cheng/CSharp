-- ===Lua 循环


-- while 在条件为 true 时，让程序重复地执行某些语句。执行语句前会先检查条件是否为 true
-- for 重复执行指定语句，重复次数可在 for 语句中控制
-- repeat...until 重复执行循环，直到 指定的条件为真时为止
-- 可以在循环内嵌套一个或多个循环语句（while do ... end;for ... do ... end;repeat ... until;）
-- break 退出当前循环或语句，并开始脚本执行紧接着的语句。


-- Lua 编程语言中 while 循环语法：
a=10
while( a < 20 )
do
   print("a 的值为:", a)
   a = a+1
end

-- ===数值for循环

for i=1,10 do
    print(i)
end
for i=10,1,-1 do
    print(i)
end

function f(x)  
    print("function")  
    return x*2   
end  
for i=1,f(5) do print(i)  
end  

-- ===泛型for循环

a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end 

days = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}  
for i,v in ipairs(days) do  print(v) end   

-- Lua 编程语言中 repeat...until 循环语法格式:
--[ 变量定义 --]
a = 10
--[ 执行循环 --]
repeat
   print("a的值为:", a)
   a = a + 1
until( a > 15 )


-- ===Lua 循环嵌套
j =2
for i=2,10 do
   for j=2,(i/j) , 2 do
      if(not(i%j)) 
      then
         break 
      end
      if(j > (i/j))then
         print("i 的值为：",i)
      end
   end
end

-- ===Lua break 语句
--[ 定义变量 --]
a = 10
--[ while 循环 --]
while( a < 20 )
do
   print("a 的值为:", a)
   a=a+1
   if( a > 15)
   then
      --[ 使用 break 语句终止循环 --]
      break
   end
end


-- if 语句 由一个布尔表达式作为条件判断，其后紧跟其他语句组成
-- if 语句 可以与 else 语句搭配使用, 在 if 条件表达式为 false 时执行 else 语句代码
-- 可以在if 或 else if中使用一个或多个 if 或 else if 语句

-- ===Lua if 语句
--[ 定义变量 --]
a = 10;
--[ 使用 if 语句 --]
if( a < 20 )
then
   --[ if 条件为 true 时打印以下信息 --]
   print("a 小于 20")
end
print("a 的值为:", a)

-- ===if...else 语句
--[ 定义变量 --]
a = 100;
--[ 检查条件 --]
if( a < 20 )
then
   --[ if 条件为 true 时执行该语句块 --]
   print("a 小于 20" )
else
   --[ if 条件为 false 时执行该语句块 --]
   print("a 大于 20" )
end
print("a 的值为 :", a)

-- ===if...elseif...else 语句
-- if( 布尔表达式 1)
-- then
--    --[ 在布尔表达式 1 为 true 时执行该语句块 --]
-- elseif( 布尔表达式 2)
-- then
--    --[ 在布尔表达式 2 为 true 时执行该语句块 --]
-- elseif( 布尔表达式 3)
-- then
--    --[ 在布尔表达式 3 为 true 时执行该语句块 --]
-- else 
--    --[ 如果以上布尔表达式都不为 true 则执行该语句块 --]
-- end
--[ 定义变量 --]
a = 100
--[ 检查布尔条件 --]
if( a == 10 )
then
   --[ 如果条件为 true 打印以下信息 --]
   print("a 的值为 10" )
elseif( a == 20 )
then   
   --[ if else if 条件为 true 时打印以下信息 --]
   print("a 的值为 20" )
elseif( a == 30 )
then
   --[ if else if condition 条件为 true 时打印以下信息 --]
   print("a 的值为 30" )
else
   --[ 以上条件语句没有一个为 true 时打印以下信息 --]
   print("没有匹配 a 的值" )
end
print("a 的真实值为: ", a )

-- ===Lua if 嵌套语句语法格式如下
-- if( 布尔表达式 1)
-- then
--    --[ 布尔表达式 1 为 true 时执行该语句块 --]
--    if(布尔表达式 2)
--    then
--       --[ 布尔表达式 2 为 true 时执行该语句块 --]
--    end
-- end
--[ 定义变量 --]
a = 100;
b = 200;
--[ 检查条件 --]
if( a == 100 )
then
   --[ if 条件为 true 时执行以下 if 条件判断 --]
   if( b == 200 )
   then
      --[ if 条件为 true 时执行该语句块 --]
      print("a 的值为 100 b 的值为 200" )
   end
end
print("a 的值为 :", a )
print("b 的值为 :", b )







-- local a=1,b=4,op="+"
-- if op =="+" then
-- 	r=a+b
-- elseif op=="-" then
-- 	r=a-b
-- elseif op=="*" then
-- 	r=a*b
-- elseif op=="/" then
-- 	r=a/b
-- else
-- 	error("invalid operation")
-- end
-- print(r)


-- a={a,b,c,d}
-- local  i = 1
-- while a[i] do
-- 	print(a[i])
-- 	i=i+1
-- end


-- repeat
-- 	line = io.read()
-- until line ~= ""
-- print(line)


-- local  sqr = x/2;x=9
-- repeat
-- 	sqr =(sqr+x/sqr)/2
-- 	local error = math.abs(sqr^2 -x)
-- until error<x/10000
-- print(error)

for i=10,1,-1 do
	print(i)
end

a={[1]=1,[2]=-1,[3]=5,}
local found = nil
for i=1,#a do
if a[i]<0 then
	found=i
	break
end
end
print(found)

for i,v in ipairs(a) do
	print(v)
end

for k in pairs(a) do
	print(k)
end


days={"sunday","monday","tuesday","wednesday","thursday","friday","saturday"}
print(days[4])
revdays={}
for k,v in pairs(days) do
	revdays[v]=k
	print(v,k)
end
-- print(revdays)
print("============revdays============")
for k,v in pairs(revdays) do
	print(k,v)
end


local i = 1
while a[i] do
	if a[i]==-1 then
		break
	end
	i=i+1
end
print("============setmetatable============")
attribute = {health=100,attack=20,["power"] = 10}
function attribute:new(obj)
    obj = obj or {}
    setmetatable(obj,self)
    self.__index=self
    return obj
end

-- print(obj1.health)
function attribute.change(self,health,attack,power)
  self.health = health or self.health
  self.attack = attack or self.attack
  self.power = power or self.power
  return self
end

obj1 = attribute:new()
obj1 = attribute.change(obj1,1000,20,20)
for k,v in pairs(attribute)do
  print(obj1[k])
end

-- a=2
-- n=4
-- sum =a+aa+aaa+aaaa 
-- print("请输入a：")
-- local inputa = io.read()
-- print("请输入n：")
-- local inputn = io.read()
local inputa = "2"
local inputn = "5"
local stran = inputa
local strsum = tonumber(inputa)
for i=2,tonumber(inputn) do
    stran = stran.."+"..string.rep(inputa,i)
    -- strsum = strsum 
    local num = tonumber(inputa)
    for j=2,i do
      num = num + tonumber(inputa)*10^(j-1)
    end
    print(num)
    strsum = strsum + num
end
print(stran,strsum)
-- C# 结构（Struct）
local test = "finding"











