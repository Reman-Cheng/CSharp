-- ===Lua 函数===


--==函数定义
-- Lua 编程语言函数定义格式如下：
-- optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
--     function_body
--     return result_params_comma_separated
-- end

-- 解析：
-- optional_function_scope: 该参数是可选的制定函数是全局函数还是局部函数，未设置该参数默认为全局函数，如果你需要设置函数为局部函数需要使用关键字 local。

-- function_name: 指定函数名称。

-- argument1, argument2, argument3..., argumentn: 函数参数，多个参数以逗号隔开，函数也可以不带参数。

-- function_body: 函数体，函数中需要执行的代码语句块。

-- result_params_comma_separated: 函数返回值，Lua语言函数可以返回多个值，每个值以逗号隔开

function max(num1, num2)

   if (num1 > num2) then
      result = num1;
   else
      result = num2;
   end

   return result; 
end
-- 调用函数
print("两值比较最大值为 ",max(10,4))
print("两值比较最大值为 ",max(5,6))


-- 将函数作为参数传递给函数
myprint = function(param)
   print("这是打印函数 -   ##",param,"##")
end
myprint(10)

function add(num1,num2,functionPrint)
   result = num1 + num2
   -- 调用传递的函数参数
   functionPrint(result)
end
-- myprint 函数作为参数传递
add(2,5,myprint)


-- ===多返回值
-- Lua函数可以返回多个结果值，比如string.find，其返回匹配串"开始和结束的下标"
s, e = string.find("www.runoob.com", "runoob")
print(s, e)

-- Lua函数中，在return后列出要返回的值得列表即可返回多值
function maximum (a)
    local mi = 1             -- 最大值索引
    local m = a[mi]          -- 最大值
    for i,val in ipairs(a) do
       if val > m then
           mi = i
           m = val
       end
    end
    return m, mi
end

print(maximum({8,10,23,12,5}))

s,e,k=string.find("hello world","ll")
print(s,e,k)

-- ===可变参数
-- Lua 函数可以接受可变数目的参数，和 C 语言类似，在函数参数列表中使用三点 ... 表示函数有可变的参数
function add(...)  
local s = 0  
  for i, v in ipairs{...} do   --> {...} 表示一个由所有变长参数构成的数组  
    s = s + v  
  end  
  return s  
end  
print(add(3,4,5,6,7))  --->25

-- 我们可以将可变参数赋值给一个变量
function average(...)
   result = 0
   local arg={...}    --> arg 为一个表，局部变量
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. #arg .. " 个数")
   return result/#arg
end
print("平均值为",average(10,5,3,4,5,6))
print(table.unpack({10,20,30}))


-- 我们也可以通过 select("#",...) 来获取可变参数的数量
function average(...)
   result = 0
   local arg={...}
   for i,v in ipairs(arg) do
      result = result + v
   end
   result1=0
   average=result/#arg
   for i,v in ipairs(arg) do
   	result1=result1+(average-v)^2
   	end
   	stv=math.sqrt(result1)/#arg
   print("总共传入 " .. select("#",...) .. " 个数")
   return result/select("#",...),stv
end
average1,stv1=average(10,5,3,4,5,6)
print("平均值为",average1,"stv1值为",stv1)

-- 有时候我们可能需要几个固定参数加上可变参数，固定参数必须放在变长参数之前
function fwrite(fmt, ...)  ---> 固定的参数fmt
    return io.write(string.format(fmt, ...))     
end
fwrite("runoob\n")       --->fmt = "runoob", 没有变长参数。  
fwrite("%d%d\n", 1, 2)   --->fmt = "%d%d", 变长参数为 1 和 2

-- 通常在遍历变长参数的时候只需要使用 {…}，然而变长参数可能会包含一些 nil，那么就可以用 select 函数来访问变长参数了：select('#', …) 或者 select(n, …)

-- select('#', …) 返回可变参数的长度
-- select(n, …) 用于访问 n 到 select('#',…) 的参数
-- 调用select时，必须传入一个固定实参selector(选择开关)和一系列变长参数。如果selector为数字n,那么select返回它的第n个可变实参，否则只能为字符串"#",这样select会返回变长参数的总数。例子代码
do  
    function foo(...)  
        for i = 1, select('#', ...) do  -->获取参数总数
            local arg = select(i, ...); -->读取参数
            print("arg", arg);  
        end  
    end  
    foo(1, 2, 3, 4);
end










-- function allwords()
--  local line = io.read()
--  local pos = 1
--  return function ()
--    local s,e = string.find(line,"%w+",pos)
--    if s then
--      pos=e+1
--      return string.sub(line,s,e)
--      else
--        line=io.read()
--        pos =1
--    end
--  end
--  return nil
--  end
-- end

a={"one","two","three"}
for i,v in ipairs(a) do
  print(i,v)
end

local function iter(a,i)
  i=i+1
  local v = a[i]
  if v then
    return i,v
  end
end
  function ipairs(a)
    return iter,a,0
    -- body
  end

print("3"+"9")
print("3+9")
local tbl = {a="apple", b="pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print(key, val)
end


-- 遇到赋值语句Lua会先计算右边所有的值然后再执行赋值操作，所以我们可以这样进行交换变量的值：
-- a[i], a[j] = a[j], a[i]         -- swap 'a[i]' for 'a[i]'

local a = 0
repeat
  a=a+1
until a==10
print(a)


function max(num1,num2)
  if(num1>num2)then
    result=num1
  else
    result=num2
  end
  return result
end
print("max:",max(10,4))
print("max:",max(5,6))


function maximum (a)
    local mi = 1             -- 最大值索引
    local m = a[mi]          -- 最大值
    for i,val in ipairs(a) do
       if val > m then
           mi = i
           m = val
       end
    end
    return m, mi
end

print(maximum({8,10,23,12,5}))

function average(...)
   result = 0
   local arg={...}
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. #arg .. " 个数")
   return result/#arg
end

print("平均值为",average(10,5,3,4,5,6))


local a = 
[[iofajlf
"flkafjal"
fjaliehaf]]
print(a)

local a = "aaaa"
local b=string.gsub(a,"a","z",3);
print(b)
local b=string.gsub(b,"z","a",2);
print(b)

-- 第三个参数为开始索引的原始字符串的位置
local a,b=string.find("Hello Lua user", "Lua", 9)
print(a,b)

print(string.format("%9.5f",10/3))


local array = {}
for i= -2, 2 do
   array[i] = i *2
end
for i = -2,2 do
   print(array[i])
end

function iter(a,i)
  i=i+1
  local v = a[i]
  if v then
    return i,v
  end
end
function ipairs(a)
  return iter,a,0
end
for k,v in ipairs(array)do
  print(k.." "..v)
end








-- 迭代table元素的（pairs）、迭代数组元素的（ipairs）、迭代字符串中单词的（string.gmatch）等
-- 循环变量是循环体的局部变量；
-- 绝不应该对循环变量作任何赋值。



-- 需要创建如下talbe
-- revDays = {["Sunday"] = 1, ["Monday"] = 2, ["Tuesday"] = 3, ["Wednesday"] = 4, ["Thursday"] = 5, ["Friday"] = 6, ["Saturday"] = 7}

-- 则可以按如下实现
local days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
local revDays = {}
for k, v in ipairs(days) do
    revDays[v] = k
end
for k, v in pairs(revDays) do
    print(k,revDays[k])
end
print("------------=========")

-- Lua为面向对象式的调用也提供了一种特殊的语法---冒号操作符。
-- 冒号操作符使调用o.foo时将o隐含地作为函数第一个参数。
--  o.foo(o, x)      -- 另一种写法是 o::foo(x)


-- 默认实参的应用
--如果没传入参数就会用默认的 n=1
local count = 1
function incCount(n)
    n = n or 1
    count = count + n
    print(count)
end
incCount()


-- • 多重返回值
-- Lua允许函数返回多个结果。例如，用于字符串中定位一个模式的函数string.find。
-- 该函数若在字符串中找到了指定的模式，将返回匹配的起始字符和结尾字符的索引。

startIndex, endIndex = string.find("hello Lua users", "Lua")
print(startIndex, endIndex)        --> 7   9


 -- 查找数组中的最大元素，并返回该元素的位置：

    function maximum(a)
        local index = 1         -- 最大值的索引
        local max = a[index]    -- 最大值
        for i,val in ipairs(a) do
            if val > max then
                max = val; index = i
            end
        end
        return max, index
    end

    print(maximum{8, 10, 23, 12, 5})    --> 23   3


-- 请注意return语句后面的内容是不需要圆括号的。例如return (f(x))，将只返回一个值，而无关乎f返回了几个值


-- 特殊函数 --unpack。它接受一个数组作为参数，并从下标1开始返回该数组的所有元素：
-- 5.2之后，unpack被移到了table下面，于是直接unpack就会导致报错，新的调用应该为：table.unpack(arg)
print(table.unpack{10, 20, 30})
local a = {12,82,99,{12,11,55},3,{a=3,b=5}}
print(table.unpack(a))


function add( ... )
        local s = 0
        for i, v in ipairs({...}) do  -- 表达式{...}表示一个由所有变长参数构成的数组。
            s = s + v
        end
        return s
    end

    print(add(3, 4, 10, 25, 12))        --> 54



-- w = Window{ x=0, y=0, width=300, height=200, title="Lua", background="blue", border=true}
function Window(options)
        -- 检查必要的参数
        if type(options.title) ~= "string" then
            error("no tile")
        elseif type(options.width) ~= "number" then
            error("no width")
        end

        -- 其他参数都是可选的
        _Window(options.title,
                options.x or 0,            -- 默认值
                options.y or 0,            -- 默认值
                options.width, options.height,
                options.backgournd or "white",        -- 默认值
                options.border            -- 默认值为false(nil)
        )
    end


-- • 深入函数
a = {p = print}
a.p("Hello World")        --> Hello World
-- print = math.sin          --> 'print'现在引用了正弦函数
a.p(print(1))             --> 0.841470
sin = a.p                 --> 'sin'现在引用了print函数
sin(10, 20)               --> 10  20



-- table库提供了一个函数table.sort
network = {
        {name = "grauna", IP = "210.26.30.34"},
        {name = "arraial", IP = "210.26.30.23"},
        {name = "lua", IP = "210.26.23.12"},
        {name = "derain", IP = "210.26.23.20"}
    }
-- 像sort这样的函数，接受另一个函数作为实参的，称其是一个“高阶函数”。
-- 高阶函数是一种强大的编程机制，应用匿名函数来创建高阶函数所需的实参则可以带来更大的灵活性。
table.sort(network, function(a,b) return (a.name > b.name) end)    
for i, v in ipairs(network) do
    io.write(v["name"].." ")
end
print("\n".."------===----------------------")


-- • closure（闭合函数）
-- 若将一个函数写在另一个函数之内，那么这个位于内部的函数便可以访问外部函数中的局部变量，这项特征称之为“词法域”。
local names = {"peter","paul","mary"}
local grades = {mary=10,paul=7,peter=8}
table.sort(names,function(n1,n2)
  return grades[n1]>grades[n2]
end)
for i,v in pairs(grades)do
  print(i,v)
end
for i,v in pairs(names)do
  print(i,v)
end

function sortbygrade(names,grades)
  table.sort(names,function(n1,n2)
    return grades[n1]<grades[n2]
  end)
end
sortbygrade(names,grades)
print("------===------------===------")
for i,v in pairs(names)do
  print(i,v)
end

-- 第一类值
function newCounter()
  local i = 0
  return function()
    i=i+1 
    return i
  end
end
--c1 为函数的
c1 = newCounter()
print(c1())
c2 = newCounter()
print(c2())

--再次调用时i会保持运算后的数
print(c2())
print(c2())
print(c1())


-- • 非全局的函数
-- 存储在table的字段中和局部变量中
print("--===---feiquanjue---===--")
lib={}
lib.foo =function(x,y)
  return x+y
end
lib.goo =function(x,y)
  return x-y
end
print(lib.goo(5,6))

local g1 = function(x,y)
  return x-y
end
print(g1(3,6))

local function g2(x,y)
  return x-y
end
print(g2(1,6))


-- 当Lua编译到函数体中调用fact(n-1)的地方时，由于局部的fact尚未定义完毕，因此这句表达式其实是调用了一个全局的fact，
-- 而非此函数自身。为了解决这个问题，可以先定义一个局部变量，然后再定义函数本身：
local fact
fact = function(n)
    if n == 0 then return 1
    else return n * fact(n-1)
    end
end
print(fact(5))
-- 现在函数中的fact调用就表示了局部变量。
-- 即使在函数定义时，这个局部变量的值尚未完成定义，但之后在函数执行时，fact则肯定已经拥有了正确的值。
local function fact1(n)
    if n == 0 then return 1
    else return n * fact(n-1)
    end
end
print(fact1(5))
-- 别把第二个函数定义写为“local function f”。
-- 如果那样的话，Lua会创建一个全新的局部变量f，而将原来声明的f（函数g中所引用的那个）置于未定义的状态。


-- • 正确的尾调用
-- 当一个函数调用是另一个函数的最后一个动作时，该调用才算一条“尾调用”。
-- 当f调用完g之后就再无其他事情可做了
local function f(x) return g(x) end
-- 在Lua中，只有“return <func>(<args>)”这样的调用形式才算是一条“尾调用”。
-- 下面的调用就是一条“尾调用”： return x[i].foo(x[j] + a * b, i + j)

-- return g(x)+1    --要做一次加法
-- return x or g(x) --要调整为一个返回值
-- return (g(x))    --要调整为一个返回值

function foo(a,b,c,...)
  local sum = a+b
  return sum,c
end


local r1,r2 = foo(1,"1234","hello!")
print(r1,r2)


local a = {}
local b = {x = 1,["hello,"] = "world!"}
a["astring"] = "ni,hao!"
a[1] = 100
a["a table"] = b

for k,v in  pairs(a) do
    print(k,"=>",v);
end




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

    print("myCreate's name:",myCreate:GetName(),"myCreate's id:",myCreate.GetId(myCreate))

    myCreate:SetId(100)
    myCreate:SetName("Hello Kity")

    print("myCreate's name:",myCreate:GetName(),"myCreate's id:",myCreate:GetId())


local girl = {money = 200}
function girl.goToMarket(girl ,someMoney)
    girl.money = girl.money - someMoney
end
girl.goToMarket(girl ,100)
print(girl.money)

-- 引用参数self：
-- 参数self指向调用者自身(类似于c++里的this 指向当前类)
local girl = {money = 200}
function girl.goToMarket(self ,someMoney)
    self.money = self.money - someMoney
end
girl.goToMarket(girl, 100)
print(girl.money)


-- 冒号调用：
-- 冒号定义和冒号调用:
girl = {money = 200}
function girl:goToMarket(someMoney)
    self.money = self.money - someMoney
end
girl:goToMarket(100)
print(girl.money)