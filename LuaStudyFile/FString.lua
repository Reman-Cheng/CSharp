--===Lua 字符串===--

-- 字符串或串(String)是由数字、字母、下划线组成的一串字符。

-- Lua 语言中字符串可以使用以下三种方式来表示：
-- 单引号间的一串字符。
-- 双引号间的一串字符。
-- [[和]]间的一串字符。
-- 以上三种方式的字符串实例如下：
string1 = "Lua"
print("\"字符串 1 是\"",string1)
string2 = 'runoob.com'
print("字符串 2 是",string2)
string3 = [["Lua 教程"]]
print("字符串 3 是",string3)

print(string.upper("argument"))
-- 1.字符串全部转为大写字母
print(string.lower("ARGUMENT"))
-- 2.字符串全部转为小写字母

-- 3.string.gsub(mainString,findString,replaceString,num)
-- 在字符串中替换,mainString为要替换的字符串， findString 为被替换的字符，replaceString 要替换的字符，num 替换次数
a,b=string.gsub("aaaa","a","z",3)
print("====a====",a,"====b====",b)
-- 4.string.find (str, substr, [init, [end]])
-- 在一个指定的目标字符串中搜索指定的内容(第三个参数为索引),返回其具体位置。不存在则返回 nil
print(string.find("Hello Lua user", "Lua", 1))
print(string.sub("Hello Lua user",2,6))
-- 5.string.reverse(arg)
-- 字符串反转740
print(string.reverse("Lua"))

-- 6.string.format(...)
-- 返回一个类似printf的格式化字符串
-- 可以用到"4",输出时会转换成number的4
print(string.format("the value is:%d",4))

-- 7.string.char(arg) 和 string.byte(arg[,int])
-- char 将整型数字转成字符并连接， byte 转换字符为整数值(可以指定某个字符，默认第一个字符)。
print(string.char(97,98,99,100))
print(string.byte("ABCD",4))
print(string.byte("ABCD"))

-- 8.string.len(arg)
-- 计算字符串长度
print(string.len("abc"))

-- 9.string.rep(string, n)
-- 返回字符串string的n个拷贝
print(string.rep("abcd",2))

-- 10 ..
-- 链接两个字符串
print("www.runoob".."com")
print("www.runtohome"..".com");
-- 11. string.gmatch(str, pattern)
-- 回一个迭代器函数，每一次调用这个函数，
-- 返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。如果参数 pattern 描述的字符串没有找到，迭代函数返回nil
for word in string.gmatch("Hello Lua user", "%a+") do print(word) end

-- 12. string.match(str, pattern, init)
-- string.match()只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认为1。 
-- 在成功配对时, 函数将返回配对表达式中的所有捕获结果; 
-- 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil。
print("------------------------------------------")
print(string.match("I have 2 questions for you.", "%d+ %a+"))
print(string.match("I have 2 questions for you気持ちがいい#@¥.", ".+"))
print(string.format("%d, %q", string.match("I have 2 questions for you.", "(%d+) (%a+)")))


-- ==字符串大小写转换
string1 = "Lua";
print(string.upper(string1))
print(string.lower(string1))

-- ==字符串查找与反转
string = "Lua Tutorial"
-- 查找字符串
print(string.find(string,"Tutorial"))
reversedString = string.reverse(string)
print("新字符串为",reversedString)


-- ==字符串格式化
-- Lua 提供了 string.format() 函数来生成具有特定格式的字符串, 函数的第一个参数是格式 , 之后是对应格式中每个代号的各种数据
-- %c - 接受一个数字, 并将其转化为ASCII码表中对应的字符
-- %d, %i - 接受一个数字并将其转化为有符号的整数格式
-- %o - 接受一个数字并将其转化为八进制数格式
-- %u - 接受一个数字并将其转化为无符号整数格式
-- %x - 接受一个数字并将其转化为十六进制数格式, 使用小写字母
-- %X - 接受一个数字并将其转化为十六进制数格式, 使用大写字母
-- %e - 接受一个数字并将其转化为科学记数法格式, 使用小写字母e
-- %E - 接受一个数字并将其转化为科学记数法格式, 使用大写字母E
-- %f - 接受一个数字并将其转化为浮点数格式
-- %g(%G) - 接受一个数字并将其转化为%e(%E, 对应%G)及%f中较短的一种格式
-- %q - 接受一个字符串并将其转化为可安全被Lua编译器读入的格式
-- %s - 接受一个字符串并按照给定的参数格式化该字符串

-- 为进一步细化格式, 可以在%号后添加参数. 参数将以如下的顺序读入:
-- (1) 符号: 一个+号表示其后的数字转义符将让正数显示正号. 默认情况下只有负数显示符号.
-- (2) 占位符: 一个0, 在后面指定了字串宽度时占位用. 不填时的默认占位符是空格.
-- (3) 对齐标识: 在指定了字串宽度时, 默认为右对齐, 增加-号可以改为左对齐.
-- (4) 宽度数值
-- (5) 小数位数/字串裁切: 在宽度数值后增加的小数部分n, 若后接f(浮点数转义符, 
-- 	如%6.3f)则设定该浮点数的小数只保留n位, 若后接s(字符串转义符, 如%5.3s)则设定该字符串只显示前n位.

string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20
-- 基本字符串格式化
print(string.format("基本格式化 %s %s",string1,string2))
-- 日期格式化
date = 2; month = 1; year = 2014
print(string.format("日期格式化 %02d/%02d/%03d", date, month, year))
-- 十进制格式化
print(string.format("%0.4f",1/3))

string.format("%c", 83)            
string.format("%+d", 17.0)              
string.format("%05d", 17)               
string.format("%o", 17)                 
-- string.format("%u", 3.14)               
string.format("%x", 13)                 
string.format("%X", 13)                 
string.format("%e", 1000)               
string.format("%E", 1000)               
string.format("%6.3f", 13)             
-- string.format("%q", "One\nTwo")                                             　
string.format("%s", "monkey")           
string.format("%10s", "monkey")         
string.format("%5.3s", "monkey")        


-- ==字符与整数相互转换
-- 字符转换
-- 转换第一个字符
print(string.byte("Lua"))
-- 转换第三个字符
print(string.byte("Lua",3))
-- 转换末尾第一个字符
print(string.byte("Lua",-1))
-- 第二个字符
print(string.byte("Lua",2))
-- 转换末尾第二个字符
print(string.byte("Lua",-2))
-- 整数 ASCII 码转换为字符
print(string.char(97))


-- ==其他常用函数
-- 以下实例演示了其他字符串操作，如计算字符串长度，字符串连接，字符串复制等：
string1 = "www."
string2 = "runoob"
string3 = ".com"
-- 使用 .. 进行字符串连接
print("连接字符串",string1..string2..string3)
-- 字符串长度
print("字符串长度 ",string.len(string2))
-- 字符串复制 2 次
repeatedString = string.rep(string2,2)
print(repeatedString)


-- ===匹配模式
-- 它用于模式匹配函数 string.find, string.gmatch, string.gsub, string.match。
-- 你还可以在模式串中使用字符类。
-- 字符类指可以匹配一个特定字符集合内任何字符的模式项。
-- 比如，字符类%d匹配任意数字。所以你可以使用模式串 '%d%d/%d%d/%d%d%d%d' 搜索 dd/mm/yyyy 格式的日期
s = "Deadline is 30/05/1999, firm"
date = "%d%d/%d%d/%d%d%d%d"
print(string.sub(s, string.find(s, date)))
print(string.gsub("hello, up-down!", "%A", "."))


-- 单个字符(除 ^$()%.[]*+-? 外): 与该字符自身配对
-- .(点): 与任何字符配对
-- %a: 与任何字母配对
-- %c: 与任何控制符配对(例如\n)
-- %d: 与任何数字配对
-- %l: 与任何小写字母配对
-- %p: 与任何标点(punctuation)配对
-- %s: 与空白字符配对
-- %u: 与任何大写字母配对
-- %w: 与任何字母/数字配对
-- %x: 与任何十六进制数配对
-- %z: 与任何代表0的字符配对
-- %x(此处x是非字母非数字字符): 与字符x配对. 主要用来处理表达式中有功能的字符(^$()%.[]*+-?)的配对问题, 例如%%与%配对
-- [数个字符类]: 与任何[]中包含的字符类配对. 例如[%w_]与任何字母/数字, 或下划线符号(_)配对
-- [^数个字符类]: 与任何不包含在[]中的字符类配对. 例如[^%s]与任何非空白字符配对
-- 当上述的字符类用大写书写时, 表示与非此字符类的任何字符配对. 例如, %S表示与任何非空白字符配对.例如，'%A'非字母的字符
-- '%' 用作特殊字符的转义字符，因此 '%.' 匹配点；'%%' 匹配字符 '%'。转义字符 '%'不仅可以用来转义特殊字符，还可以用于所有的非字母的字符


-- #!/usr/local/bin/lua
-- names={"peter","paul","mary"}
-- grades={mary=10,paul=5,peter=8}
-- table.sort( names,function(n1,n2) return grades[n1]>grades[n2] end )
-- function sortbygrade(names,grades)
-- 	table.sort( names,function(n1,n2) return grades[n1]>grades[n2] end )
-- end


for word in string.gmatch("Hello Lua user", "%a+") do print(word) end

for word in string.gmatch("Hello 120 Lua user", "%d+") do print(word) end


function add(...)  
local s = 0  
  for i, v in ipairs(...) do   --> {...} 表示一个由所有变长参数构成的数组  
    s = s + v  
  end  
  return s  
end  
print(add({3,4,5,6,7}))  --->25 传入的参数必须为table型


function dofile(filename)
	local f = assert(loadfile(filename))
	-- loadfile只编译代码不执行原文件代码
	return f()
end

-- dofile("/Users/swqt/Desktop/obj-c/lua xuexidaima/luasecond.lua")

-- dofile("/Users/swqt/Desktop/obj-c/lua xuexidaima/test.lua")


-- i=32
-- local i = 0
-- f = assert(loadstring(i=i+1;print(i)))
-- g=function ()
-- 	i=i+1;print(i)
-- end
-- f()
-- g()
-- loadstring 从字符串中读取代码


-- print "enter your expression:"
-- local l = io.read()
-- local func = assert(loadstring("return"..l))
-- print("the value of your expression is"..func())

-- print(loadstring("i  i"))

-- local file,msg
-- repeat
-- 	print "enter a file name:"
--     local name = io.read("20181224.lua")
--     if not name then return end
--     file,msg=io.open(name,"r")
--     if not file then print(msg) end
--     until file
-- file=assert(io.opne(name,"r"))



-- 1	string.upper(argument)	返回参数的大写表示。
-- 2	string.lower(argument)	返回参数的小写表示。
-- 3	string.gsub(mainString,findString,replaceString)	返回用replaceString替换findString后字符串。
-- 4	string.find(mainString,findString, optionalStartIndex,optionalEndIndex)	返回mainString中findString的起始索引和结束索引找到字符串，如果未找到则返回nil。
-- 5	string.reverse(arg)	将传递的字符串arg反转后的字符串。
-- 6	string.format(...)	返回格式化字符串。
-- 7	string.char(arg) 和 string.byte(arg)	返回输入参数的内部数字和字符表示。
-- 8	string.len(arg)	返回传递字符串arg的长度。
-- 9	string.rep(string, n))	通过重复相同的字符串n次返回一个字符串。
-- 10	..	此运算符连接两个字符串。

print(string.format("%.4f",1/3))
print(string.char(97))




-- 数学库
 local sin,asin= math.sin, math.asin
local deg, rad = math.deg, math.rad
math.sin = function(x) return sin(rad(x)) end
math.asin = function(x) return deg(asin(x)) end
print(sin(1/3))

-- 如果在调用它时不提供任何参数，它将返回一个在区间[0,1)内均匀分布的伪随机实数。
-- 如果提供了一个整数n作为参数，它将返回一个在区间[1, n]内的伪随机整数。
-- 最后一种方式是在调用它时提供两个整数参数m和n,这样会得到一个在区间[m, n]内的伪随机整数。
print(math.random())
print(math.random(6))
print(math.random(10,20))

print(os.time())

function showtime()
	local numsec = os.time()
    local sec =math.floor(numsec%(60))
    local min =math.floor(numsec%(60*60)/60)
    local day =math.floor(numsec%(60*60*24)/60*60)
end
showtime()
print(numsec,sec,min,day)







-- 字符串库

-- 大小写转换
	print("=====-------========")
	local msg = "flainRin"
    print(string.upper(msg))
    print(string.lower(msg))
    print(msg:upper())
    print(msg:lower())

    -- 重复字符串
    print(string.rep(msg, 2))
    print(msg:rep(2))

    -- 截取子串
    print(string.sub(msg, 3, -1)) -- -1表示最后1位字符 -2代表倒数第2个字符

    a = "[Hello World!]"
    a = a:sub(2, -2)  -- 字符串是不可变的
    print(a) -- 表示去掉第1个和最后1个字符

    -- 字符与asc码转换
    print(string.char(97))        --> a
    i = 99;print(string.char(i, i+1, i+2))    --> cde
    print(string.byte("abc"))        --> 97
    print(string.byte("abc", 2))        --> 98
    print(string.byte("abc", -1))        --> 99

    -- 格式化字符串
    print(string.format("%s, %d", "===", i))

    -- 查找子串
    i, j = string.find(a, "Hello")  -- i,j分别为找到的起始索引与结束索引，没找到返回nil
    print(a:sub(i, j))

    -- 匹配查找
    data = "Today is 1/29/2018"
    -- print(data:match("%d+/%d+/%d+"))

    -- 替换字符串
    print(data:gsub("Today", "YesToday"))  -- 返回值: 替换后的字符串 替换的次数

    count = select(2, data:gsub(" ", " ")) -- 统计字符串中空格的个数
    print(count)

    -- string.gmatch 会返回一个函数，通过这个函数可以遍历到所有出现指定模式的地方
    words = {}
    for w in string.gmatch(data, "%a+") do
        words[#words+1] = w
    end
    print("words : #", #words)
    for i,v in pairs(words)do
    	print(i,v)
    end


-- 函数string.format是用于格式化字符串的利器
print(string.format("pi = %.4f", math.pi))        --> pi = 3.1416
    d = 5; m = 11; y = 1990
    print(string.format("%02d/%02d/%04d", d, m, y))        --> 05/11/1990
    tag, title = "h1", "a title"
    print(string.format("<%s>%s<%s>", tag, title, tag))        --> <h1>a title<h1>




-- 基础字符串函数
-- 对一个字符串数组进行排序，并且不区分大小写
print("========--------==========")
local a = {"fjalf","flfalf","jfkjfjfkjsldf"}
table.sort( a, function(a,b)
	return string.lower(a)<string.lower(b)
end)
for i,v in pairs(a)do
	print(i,v)
end

-- 模式匹配（pattern-matching）函数
-- 字符串库中最强大的函数是find、match、gsub（global substitution，全局替换）
-- 和gmatch（global match，全局匹配），它们都是基于“模式（pattern）”的。


--  ● string.find函数
-- string.find函数用于在一个给定的目标字符串中搜索一个模式
 s = "hello world"
    i, j = string.find(s, "hello")
    print(i, j)            --> 1 5
    print(string.sub(s, i, j))    --> hello
    print(string.find(s, "world"))    --> 7 11
    i, j = string.find(s, "l")
    print(i, j)            --> 3 3
    print(string.find(s, "llll"))        --> nil


-- ● string.match函数
-- string.match返回的是目标字符串中与模式相匹配的那部分子串，而非该模式所在的位置
print(string.match("hello world","l"))

-- 使用变量模式
date = "Today is 17/7/1990"
d = string.match(date, "%d+/%d+/%d+")
print(d)        --> 17/7/1990

-- ● string.gsub函数
-- string.gsub有3个参数：目标字符串、模式和替换字符串
-- 它的基本用法是将目标字符串中所有出现模式的地方替换为替换字符串（最后一个参数）：

s = string.gsub("Lua is cute", "cute", "great")
print(s)            --> Lua s great
s = string.gsub("all lii", "l", "x")
print(s)            --> axx xii
s = string.gsub("Lua is great", "Sol", "Son")
print(s)            --> Lua is great
-- 另外还有可选的第四个参数，可以限制替换的次数：
s=string.gsub("all lii","i","x",1)
print(s)
s=string.gsub("all lii","i","x",2)
print(s)
-- 函数string.gsub还有另一个结果，即实际替换的次数。例如，以下代码就是一种统计字符串中空格数量的简单方法：

local str = "lua is great"
local count = select(1, string.gsub(str, " ", " "))
print(count)
local count = select(2, string.gsub(str, " ", " "))
print(count)


-- ● string.gmatch函数
-- string.gmatch会返回一个函数，通过这个函数可以遍历到一个字符串中所有出现指定模式的地方。
-- 例如，以下示例找出了给定字符串s中所有的单词：
words={}
local s = "lua is a language"
for w in string.gmatch(s, "%a+") do
    words[#words + 1] = w
end
for i,v in ipairs(words)do
	print(i,v)
end


function search(modname, path)
    modname = string.gsub(modname, "%.", "/")
    for c in string.gmatch(path, "[^;]+") do
        local fname = string.gsub(c, "?", modname)
        local f = io.open(fname)
        if f then
            f:close()
            return fname
        end
    end
    return nil        -- 未找到
end


 -- 模式
local s = "Deadline is 30/05/1999, firm"
local date = "%d%d/%d%d/%d%d%d%d"
print(string.find(s,date))
local a = string.sub(s,string.find(s,date))
print(a)

-- .	所有字符
-- %a	字母
-- %c	控制字符
-- %d	数字
-- %l	小写字母
-- %p	标点符号
-- %s	空白字符
-- %u	大写字母
-- %w	字母和数字字符
-- %x	十六进制数字
-- %z	内部表示为0的字符
-- 字符集“[%w_]”表示同时匹配字母、数字和下划线；
-- 字符集“[01]”表示匹配二进制数字；
-- 字符集“[%[%]]”表示匹配方括号本身
-- []框起来表示其中的一个
-- +	重复1次或多次
-- *	重复0次或多次
-- -	也是重复0次或多次
-- ?	可选部分（出现0或1次）
-- %b   用于匹配成对的字符

-- 这些分类的大写形式表示它们的补集，例如，“%A”表示所有非字母字符：
 print(string.gsub("hello, up-down!", "%A", "."))
-- 打印出的“4”不是结果字符串的一部分，而是gsub的第二个结果，即替换的次数
local str1 = "afjieifajflasgjalAIOPPJL"
local novow=select(2,string.gsub(str1,"[AEIOUaeiou]"," "))
print(str1)
print(novow)

print(string.gsub("one,and two; and three","%a+","word"))
print(string.gsub("one,and two; and three","%a","word"))
print(string.match("the number 1299 is even","%d+"))
print(string.match("the number 1299 is even","%d*"))
print(string.match("the number 1299 is even","%d-"))
print(string.match("the number 1299 is even","%d?"))

local s = "a (enclosed (in) parentheses) line"
print(string.gsub(s,"%b()",""))

local a=require("module")
print(a.constant)
a.func3()
-- 捕获（capture）
-- 对于具有捕获的模式，函数string.match会将所有捕获到的值作为单独的结果返回。
-- 即它会将目标字符串切成多个捕获到的部分：
pari="name=anna"
key,value=string.match(pari,"(%a+)%s*=%s*(%a+)")
print(key,value)

date="Today is 15/1/2019"
d,m,y=string.match(date,"(%d+)/(%d+)/(%d+)")
print(d,m,y)

-- 在一个字符串中寻找一个由单引号或双引号括起来的子串。
-- 那么可以用这样的模式“["'].-["']”，它表示一个引号后面是任意内容及另外一个引号。
-- 但是，这种模式在处理像“it's all right”这样的字符串时就出现问题。
local s = [[the he said:"it's all right"!]]
q,quotedpart = string.match(s,"([\"'])(.-)%1")
print(q,quotedpart)

-- 第一个捕获是引号字符本身，第二个捕获是引号中的内容，即与“.-”相匹配的子串
-- %[(=*)%[(.-)%]%1%]
p = "%[(=*)%[(.-)%]%1%]"
s = "a = [=[[[ something ]] ]==] ]=]; print(a)"
print(string.match(s, p))        --> =    [[ something ]]   ]==]

-- “%0”表示整个匹配，并且替换字符串中的“%”必须被转义为“%%”
print(string.gsub("hello Lua!", "%a", "%0-%0"))
--> h-he-el-ll-lo-o L-Lu-ua-a!
print(string.gsub("hello Lua", "(.)(.)", "%2%1"))
--> ehll ouLa
-- local s = "the \quote{task} is to \em{change} that."
-- local s12 = string.gsub(s, "\\(%a+){(.-)}", "<%1>%2</%1>")
-- print(s12)


-- 替换
function expand(s)
        return (string.gsub(s, "$(%w+)", _G))
    end

    name = "Lua"; status = "great"
    print(expand("$name is $status, isn't it?"))
    --> Lua is great, isn't it?
-- 对每处与“$(%w+)”相匹配的地方
print(expand("$othername is $status,isn't is?"))

 function expand1(s)
        return (string.gsub(s, "$(%w+)", function(n)
            return tostring(_G[n])
        end))
    end

    print(expand1("print = $print; a = $a"))
    --> print = function: 0x8050ce0; a = nil

function toxml(s)
        s = string.gsub(s, "\\(%a+)(%b{})", function(tag, body)
            body = string.sub(body, 2, -2)          -- 删除花括号
            body = toxml(body)                      -- 处理嵌套的命令
            return string.format("<%s>%s<%s>", tag, body, tag)
            end)
        return s
    end

    print(toxml("\\title{The \\bold{big} example}"))
    --> <title>The <bold>big</bold> example</title>


-- ● URL 编码
function unescape(s)
        s = string.gsub(s, "+", " ")
        s = string.gsub(s, "%%(%x%x)", function(h)
            return string.char(tonumber(h, 16))
        end)
        return s
    end
print(unescape("a%2Bb+%eD+c"))

cgi={}
function decode(s)
	for name,value in string.gmatch(s,"([^&=])=([^&=]+")do
		name=unescape(name)
		value=unescape(value)
		cgi[name]=value
	end
end
print("======-------==========----------------")







test = {"Tom", "Mary", "Jam","Hey"}
print(table.concat(test, ":"))
print("*************")
print(table.concat(test, nil, 1, 2))
print("*************")
print(table.concat(test, "\n", 2, 3))
-- print(table.maxn(test))

print(os.time{year=1970,month=1,day=1,hour=8})
print(os.time{year=1970, month=1, day=1})

-- os.date ([format [, time]])
-- 功能：返回一个按format格式化日期、时间的字串或表
-- %a 一星期中天数的简称（wed)
-- %A 一星期中天数的全称 (wednesday)
-- %b 月份的简称(sep)
-- %B 月份的全称(september)
-- %c 日期和时间(09/16/98 23:48:10)
-- %d 一个月中的第几天(16)[0~31]
-- %H 24小时制中的小时数(23)[0~23]
-- %i 12小时制中的小时数(11)[1~12]
-- %j 一年中的第几天(259)[01~366]
-- %M 分钟数(48)[00~59]
-- %m 月份数(09)[01~12]
-- %P 上午或下午am pm
-- %S 秒数[00~59]
-- %w 一个星期中的第几天(3)[0~6=星期天～星期六]
-- %W 一个年中的第几星期 0~52
-- %x 日期(09/16/98)
-- %X 时间(23:48:10)
-- %y 两位数的年份(90)[00~99]
-- %Y 完整的年份(2009)
-- %% 字符串‘%’
print(os.date("today is %A,in %B,%H,%M,%S"))
print(os.date("%X", 906000490))

t=os.date("*t",os.time())
for i,v in pairs(t) do
    print(i,"->",v)
end
local a = os.date("%x")
print(a)
local b = os.date("%X")
print(b)
print(os.date("%m/%d/%Y", 906000490))



-- Lua string库

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

-- string库中所有的字符索引从前往后是1,2,...;从后往前是-1,-2,...

-- string库中所有的function都不会直接操作字符串，而是返回一个结果。

-- 在string库中功能最强大的函数是：string.find（字符串查找），string.gsub（全局字符串替换），and string.gfind（全局字符串查找）。
-- 这些函数都是基于模式匹配的。

local s = "hello world"
i,j =string.find(s,"hello")
print(i," ",j)
print(string.find(s,"kity"))

-- string.find函数第三个参数是可选的：标示目标串中搜索的起始位置。当我们想查找目标串中所有匹配的子串的时候，这个选项非常有用。
local s = "\nare you ok!\n ok\n"
local t = {}
local i = 0
while true do
    i=string.find(s,"\n",i+1)
    if i==nil then break end
    table.insert(t,i)
end

for k,v in pairs(t) do
    print(k,"->",v)
end

-- require "mod"
-- mod.foo()
-- local m2 = require "mod2"
-- local f = mod2.foo
-- f()
