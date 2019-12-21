#!/usr/local/bin/lua

-- Mac OS X 系统上安装
-- cd lua-5.3.0
-- sudo make macosx install

-- Lua 交互式编程模式可以通过命令 lua -i 或 lua 来启用：
-- lua -i
-- 退出 os.exit()

-- cd ........
-- chmod a+rx test.lua
-- ./test.lua

-- 执行
-- cd ........
-- $ lua HelloWorld.lua

-- Lua 提供了交互式编程模式。我们可以在命令行中输入程序并立即查看效果
-- 我们可以将 Lua 程序代码保持到一个以 lua 结尾的文件，并执行，该模式称为脚本式编程

-- 全局变量不需要声明，给一个变量赋值后即创建了这个全局变量，访问一个没有初始化的全局变量也不会出错，只不过得到的结果是：nil
print(v)
v=10
print(v)
-- 如果你想删除一个全局变量，只需要将变量赋值为nil
v=nil
print(v)


-- ===Lua中有8个基本类型分别为：nil、boolean、number、string、userdata(表示任意存储在变量中的C数据结构)、function、thread
-- (执行的独立线路，用于执行协同程序)和table(Lua 中的表（table）其实是一个"关联数组"，数组的索引可以是数字或者是字符串)
print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(type))               --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))            --> string
-- ===nil（空）
-- nil 类型表示一种没有任何有效值，它只有一个值 -- nil，例如打印一个没有赋值的变量，便会输出一个 nil 值：
print(type(m))
-- 对于全局变量和 table，nil 还有一个"删除"作用，给全局变量或者 table 表里的变量赋一个 nil 值，等同于把它们删掉
tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end

tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end

-- nil 作比较时应该加上双引号 "
v=nil
print(v=="nil")
print(v==nil)


-- ===boolean（布尔）
-- boolean 类型只有两个可选值：true（真） 和 false（假），Lua 把 false 和 nil 看作是"假"，其他的都为"真":
print(type(true))
print(type(false))
print(type(nil))
 
if false or nil then
    print("至少有一个是 true")
else
    print("false 和 nil 都为 false!")
end


-- ===number（数字）
-- Lua 默认只有一种 number 类型 -- double（双精度）类型（默认类型可以修改 luaconf.h 里的定义），以下几种写法都被看作是 number 类型：
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))

-- ====string（字符串）
-- 字符串由一对双引号或单引号来表示。也可以用 2 个方括号 "[[]]" 来表示"一块"字符串
string1 = "this is string1"
string2 = 'this is string2'

html = [[
<html>
<head></head>
<body>
    <a href="http://www.runoob.com/">菜鸟教程</a>
</body>
</html>
]]
print(html)

-- 在对一个数字字符串上进行算术操作时，Lua 会尝试将这个数字字符串转成一个数字:
print("2" + 6)
print("2" + "6")
print("2 + 6")
print("-2e2" * "6")
print("error"..1)
 
-- 使用 # 来计算字符串的长度，放在字符串前面
len = "www.runoob.com"
print(#len)
print(#"www.runoob.com")


-- ===table（表）
-- 在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。也可以在表里添加一些数据，直接初始化表
-- 不同于其他语言的数组把 0 作为数组的初始索引，在 Lua 里表的默认初始索引一般以 1 开始
local tbl1 = {}
local tbl2 = {"apple", "pear", "orange", "grape"}
for k, v in pairs(tbl2) do
    print(k .. " : " .. v)
end
-- Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字或者是字符串
a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end
-- 不同于其他语言的数组把 0 作为数组的初始索引，在 Lua 里表的默认初始索引一般以 1 开始
local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print("Key", key)
end
-- table 不会固定长度大小，有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil
a3 = {}
for i = 1, 10 do
    a3[i] = i
end
a3["key"] = "val"
print(a3["key"])
print(a3["none"])

-- ===function（函数）
-- 在 Lua 中，函数是被看作是"第一类值（First-Class Value）"，函数可以存在变量里:
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))

-- function 可以以匿名函数（anonymous function）的方式通过参数传递
function testFun(tab,fun)
    for k ,v in pairs(tab) do
        print(fun(k,v));
    end
end

tab={key1="val1",key2="val2"};
testFun(tab,
function(key,val)
    return key.."="..val;
end
);

-- ===thread（线程）
-- 在 Lua 里，最主要的线程是协同程序（coroutine）。它跟线程（thread）差不多，拥有自己独立的栈、局部变量和指令指针，可以跟其他协同程序共享全局变量和其他大部分东西
-- 线程跟协程的区别：线程可以同时多个运行，而协程任意时刻只能运行一个，并且处于运行状态的协程只有被挂起（suspend）时才会暂停


-- ===userdata（自定义类型）
-- userdata 是一种用户自定义数据，用于表示一种由应用程序或 C/C++ 语言库所创建的类型，可以将任意 C/C++ 的任意数据类型的数据（通常是 struct 和 指针）存储到 Lua 变量中调用




-- Lua提供了运行时的数字与字符串的自动转换
-- 1、在一个字符串上应用算术操作时，Lua会尝试将这个字符串转换成一个数字
-- 2、相反，在Lua期望一个字符串但却得到一个数字时，它也会将数字转换成字符串
-- 3、在Lua 5.1中，可以在字符串前放置操作符“#”来获取该字符串的长度
print("one line\n next line \n \"in quotes\",'in quotes'")
print('a backslash:\'\\\'')
print("a simpler way:'\\'")
print("10"+1)
print(10 .. 20)
-- 输出时会强制转换成字符串

-- tonumber    tostring
print(tonumber("10")==10)
print(tostring(10)=="10")

-- 字符串前放置操作符 # 来获取该字符串的长度
a="hello"
print(#a)
print(#"good\0bye")


-- ===• table
-- table类型实现了“关联数组”。“关联数组”是一种具有特殊索引方式的数组。
-- 不仅可以通过整数来索引它，还可以使用字符串或其他类型的值（除了nil）来索引它。


-- table没有固定的大小，可以动态地添加任意数量的元素到一个table中。

-- table是Lua中主要的（事实上也是仅有的）数据结构机制，具有强大的功能。

-- 在Lua中，table既不是“值”也不是“变量”，而是“对象”。

-- table的创建是通过“构造表达式”完成的，最简单的构造表达式就是{ }。

a = { }             -- 创建一个table，并将它的引用存储到a
k = "x"
a[k] = 10           -- 新条目，key = "x", value = 10
a[20] = "great"     -- 新条目，key = 20, value = "great"
print(a["x"])       -- 10
k = 20
print(a[k])         -- “great"
a["x"] = a["x"] + 1 -- 递增条目"x"
print(a["x"])       -- 11

-- table永远是“匿名的”，一个持有table的变量与table自身之间没有固定的关联性。

a = { }
a["x"] = 10
b = a               -- b与a引用了同一个table
print(b["x"])       -- 10
b["x"] = 20
print(a["x"])       -- 20
print(a["x"])
a = nil             -- 现在只有b还在引用table
b = nil             -- 再也没有对table的引用了
print("===================")
-- 当一个程序再也没有对一个table的引用时，Lua的垃圾收集器最终会删除该table，并复用它的内存。

-- 所有table都可以用不同类型的索引来访问value（值），当需要容纳新条目时，table会自动增长
a = { }
-- 创建1000个新条目
for i=1, 10 do a[i] = i*2 end
print(a[9])         -- 18
a["x"] = 10
print(a["x"])       -- 10
print(a["y"])       -- nil 该元素没有初始化
-- 可以将nil赋予table的某个元素来删除该元素。


-- Lua对于诸如a["name"]的写法提供了一种更简便的“语法糖（syntactic sugar）”，可以直接输入a.name。
print("===================")
a.x = 10            -- 等同于a["x"] = 10
print(a.x)          -- 等同于print(a["x"])
print(a.y)          -- 等同于print(a["y"])

-- 对于Lua来说，这两种形式是等价的，可供自由选择使用。
-- a.x                 -- 等同于a["x"]
-- a[x]                -- 以变量x的值来索引table

----------
a = { }
x = "y"
a[x] = 10           -- 将10放入字段“y”
print(a[x])         -- 10 字段“y”的值
print(a.x)          -- nil 字段“x”（未定义）的值
print(a.y)          -- 10 字段“y”的值


-- local a = {}
-- for i=1,10 do
--  a[i]=io.read()
-- end

local str="flaaaap"
print(string.match(str,"()aaa()"))


-- 当对索引的实际类型不是很确定时，可以明确地使用一个显式转换
i = 10; j = "10"; k = "+10"
a = { }
a[i] = "one value"
a[j] = "another value"
a[k] = "yet another value"
print(a[j])  --> another value
print(a[k]) --> yet another value
print(a[tonumber(j)]) --> one value
print(a[tonumber(k)]) --> one value




-- 包含类似于C语言中的转义序列
-- \a   响铃
-- \b   退格
-- \f   提供表格
-- \n   换行
-- \r   回车
-- \t   水平tab
-- \v   垂直tab
-- \\   反斜杠
-- \"   双引号
-- \'   单引号






