#!/usr/local/bin/lua
-- require "module"
-- --mod 为module的table名
-- mod.func1()


module = require "module"
module.func1()
foo("string for the king")

local m = require "io"
m.write("hello world\n")


-- function require(name)
--         if not packag.loaded[name] then        -- 模块是否已加载？
--             local loader = findloader(name)
--             if loader == nil then
--                 error("unable to load module " .. name)
--             end
--             package.loaded[name] = true        -- 将模块标记为已加载
--             local res = loader(name)           -- 初始化模块
--             if res ~= nil then
--                 package.loaded[name] = res
--             end
--         end
--         return package.loaded[name]
--     end


com = require "complex"
c1 = com.new(1,2)
c2 = com.new(4,5)

add =com.add(c1,c2)
for k,v in pairs(add)do
	print(k,v)
end

sub =com.sub(c1,c2)
for k,v in pairs(sub)do
	print(k,v)
end

mul =com.mul(c1,c2)
for k,v in pairs(mul)do
	print(k,v)
end

div =com.div(c1,c2)
for k,v in pairs(div)do
	print(k,v)
end


Account = {balance = 0}
function Account.withdraw(v)
	Account.balance = Account.balance - v
end
Account.withdraw(100.00)
print(Account.balance)
print("--Account ~= nil--")
a=Account
for k,v in pairs(a)do
	print(k,v)
end
a.withdraw(200.00)
print(a.balance)
print("--Account = nil 就报错找不到Accout--")
-- a=Account
-- Account = nil
-- for k,v in pairs(a)do
-- 	print(k,v)
-- end
-- 调用的是Account的balance，而Accout已经为nil
-- a.withdraw(200.00)
-- print(a.balance)


--self 动作的“接受者”
function Account.withdraw(self, v)
    self.balance = self.balance - v
end

a1 = Account
Account = nil
-- a1.withdraw(a1,100)
a1:withdraw(100)
print(a1.balance)


 Account = {balance=0, 
           withdraw=function(self, v)
                        self.balance = self.balance - v
                    end
          }

function Account:deposit(v)
    self.balance = self.balance + v
end

Account.deposit(Account, 200.00)
print(Account.balance)
Account:withdraw(50.00)
print(Account.balance)
Account:deposit(102.00)
print(Account.balance)


-- 对象继承类的一些属性方法等
setmetatable(a,{__index = b})

function Account:new(obj)
	obj = obj or {}
	--obj 继承了 self 的属性和方法
	setmetatable(obj,self)
	self.__index = self
	return obj
end

a=Account:new({balance = 0})
a:deposit(100.00)
print(a.balance)


Account = {}
function Account:new(obj)
	 obj = obj or {}
	 setmetatable(obj,self)
	 self.__index = self
	 return obj
end

function Account:deposit(val)
	 self.balance = self.balance - val
	 print(self.balance)
end

function Account:withdraw(val)
	 if val>self.balance then error "insufficient funds"end
	 self.balance = self.balance - val
	 print(self.balance)
end

SpecialAccount = Account:new()
s = SpecialAccount:new({limit = 1000.00})
-- s:deposit(100.00)

function SpecialAccount:withdraw(v)
	 if v-self.balance >= self:getLimit() then
	 	error "insufficient funds"
	 end
	 self.balance = self.balance - v
end
function SpecialAccount:getLimit()
	 return self.limit or 0
end




local function search(k,plist)
	 for i=1,#plist do
	 	local v = plist[i][k]
	 	if v then return v end
	 end
end

function createClass( ... )
	 local c = {}
	 local parents = {...}

	 setmetatable(c,{__index = function(t,k)
	 	 return search(k,parents)
	 end})

	 c.__index = c

	 function c:new(o)
	 	o = o or {}
	 	setmetatable(o,c)
	 	return o
	 end
	 return c
end

Named = {}
function Named:getname()
	 return self.name
end
function Named:setname(n)
	 self.name = n
end

NamedAccount = createClass(Account,Named)

account = NamedAccount:new(Account,Named)
-- print(account:getname())


a = {}
b = {__mode = "kk"}
setmetatable(a,b)
key = {}
a[key] = 1
key = {}
a[key]=2
a[3]=6
collectgarbage()
a[3]=nil
collectgarbage()
for k,v in pairs(a)do 
	print(v)
end


local results = {}
setmetatable(results,{__mode = 'kv'})
function mem_loadstring(s)
	 local res = results[s]
	 if res == nil then
	 	res = assert(loadstring(s))
	 	results[s] = res
	 end
	 return res
end
--弱引用能解决耗费内存问题，能自动删除哪些在执行未使用的编译结果

local result = {}
setmetatable(result,{__mode = 'v'})
function createRGB(r,g,b)
	 local key = r.."-"..g.."-"..b
	 local color = result[key]
	 if color == nil then
	 	color = {red=r,green=g,blue=b}
	 	result[key]=color
	 end
	 return color
end

createRGB(13,56,88)
for k,v in pairs(result)do
	print(k,v)
end


local defaults = {}
setmetatable(defaults,{__mode = 'k'})
local mt = {__index=function(t) return defaults[t] end}
function setDefault(t, d)
    defaults[t] = d
    setmetatable(t, mt)
end


local metas = {}
setmetatable(metas, {__mode = 'v'})
function setDefault(t, d)
    local mt = metas[d]
    if mt == nil then
        mt = {__index = function() return d end}
        metas[d] = mt             -- 备忘录
    end
    setmetatable(t, mt)
end

math.pi = 3.14
print(math.sin(math.pi/6))


math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,7)))
print(math.random())


t={}
for line in io.lines("complex.lua")do
	table.insert(t,line)
end
print(#t)
for k,v in pairs(t)do
	print(k,v)
end


-- table.insert(t, x)等价于压入操作，table.remove(s)等价于弹出操作
-- table.insert(t,1,x)会在结构的另一端（也就是起始处）插入一个新元素，而table.remove(t,1)会从这一端删除元素


lines = {luaH_set = 10,luaH_aet = 24,luaH_cresent = 48,luaH_bre = 49,luaH_esent = 45,}
a = {}
taba = {a="string",b="number",c="char",d="table",e="metatable"}
for n in pairs(lines)do a[#a+1]=n end
table.sort(a)
-- for i,n in ipairs(taba)do print(n) end
for i,n in pairs(a)do print(i,n) end


function pairsByKeys(t,f)
	 local a = {}
	 for n in pairs(t)do a[#a+1]=n end
	 table.sort( a,f)

	 --迭代的方法，有要返回的参数传给name和line
	 local i = 0
	 return function()
	 	 i= i + 1
	 	 return a[i],t[a[i]]
	 end
end

for name,line in pairsByKeys(lines) do
	print(name,line)
end


function rconcat(l)
	 if type(l) ~= "table" then return l end
	 local res = {}
	 for i=1,#l do
	 	res[i] = rconcat(l[i])
	 end
	 return table.concat(res)
end
print(rconcat{{"a", {" nice"}}, " and", {{" long"}, {" list"}}})


a = {"TuIgnsdfjla","IONfodsfIJJK","OIOJfaklsf"}
table.sort(a, function(a,b)
	 return string.lower(a)>string.lower(b)
end)
for k,v in pairs(a) do print(k,v) end

s = "sting"
print(s:sub(1,4))
sprint=string.sub(s,2,-2)
print(sprint)

print(os.date("%Y/%m/%d %H:%M:%S"))
-- %.4f表示一个浮点数的小数点后有4位数字。
-- %02d表示一个十进制数字至少有两个数字，如不足两个数字，则用0补足；
-- %2d则表示用空格来补足


-- word = {}
-- for w in string.gmatch(s,"%a+")do
-- 	wrosd[%word+1] =w
-- end


function search2(modname,path)
	 modname = string.gsub(modname,"%.","/")
	 for c in string.gmatch(path,"[^;]+")do
	 	local fname = string.gsub(c,"?",modname)
	 	local f = io.open(fname)
	 	if f then
	 		f:close()
	 		return fname
	 	end
	 end
	 return nil
end


i ,j = string.gsub("hello , up-down","%A",".")
print(i,j)


-- 一个字符集前加一个‘^’，就可以得到这个字符集的补集
text = "940F()( )(  )"
for w in string.gmatch(text,"[^0-7]")do
	print(w)
end
print("----====[%(%s*%)]====其中之一----")
for w in string.gmatch(text,"[%(%s*%)]")do
	print(w)
end
print("----====%(%s*%)====组合一起的匹配----")
for w in string.gmatch(text,"%(%s*%)")do
	print(w)
end
--替换，还是会有int x;
test = "int x; /* x */ int y; /* y */"
print(string.gsub(test, "/%*.*%*/", "<COMMENT>"))
--贪婪匹配
test = "int x; /* x */ int y; /* y */"
print(string.gsub(test, "/%*.-%*/", "<COMMENT>"))

test = "int x +14，-5，6; /* x */ int y; /* y */"
for w in string.gmatch(test, "[+-]?%d+") do
	print(w)
end

test = "2"
print(string.find(s,"^[+-]?%d+$"))


s = "a (enclosed (in) parentheses) line"
-- 模式“%b()”可匹配以‘(’开始，并以‘)’结束的子串
print(string.gsub(s, "%b()", ""))        --> a line


pair = "name = Anna"
key, value = string.match(pair, "(%a+)%s*=%s(%a+)")
print(key, value)

date = "today is 06/03/2019"
d,m,y = string.match(date,"(%d+)/(%d+)/(%d+)")
print(d,m,y)


s = [[then he said: "it's all right"!]]
q,quoted = string.match(s,"([\"'])(.-)%1")
print(q,quoted)


p = "%[(=*)%[(.-)%]%1%]"
s = "a = [=[[[ something ]] ]==] ]=]; print(a)"
print(string.match(s, p))


local test_cache = {}

local function set_cache(key)
	test_cache[key] = key or {}
end 

local function get_cache(key)
	return test_cache[key]
end

local function print_cache(cache)
	if cache == nil then
		cache = test_cache
	end

	for key,val in pairs(cache) do
		print(key,val)
	end

end

local function test()
	local test_msg = {"hello","world","word"}
	local val
	for key,val in pairs(test_msg) do
		set_cache(val)
		val = get_cache(val)
	    print("val = "..val)
	end   
end
test()
print_cache()


function unescape(s)
	 s = string.gsub(s,"+","")
	 s = string.gsub(s,"%%(%x%x)",function (h)
	 	 return string.char(tonumber(h,16))
	 end)
	 return s
end
print(unescape("a%5Ef+%eD+c"))
print(string.byte("^"))
print(tonumber("5E",16))


print(string.match("hello", "()ll()")) 
print(string.find("hello","()ll()"))


test = [[char s[] = "a /* here"; /* a tricky string */]]
print(string.gsub(test, "/%*.-%*/", "<COMMENT>"))
date = "lfjas:*flkjf#\nfl;aflj:jfl&\njfldsjfl^%"
pattern = string.rep(string.match(date,"[^\n]"),70).."[^\n]*"
print(pattern)


-- 与大小写无关的查找
function nocase(s)
    s = string.gsub(s, "%a", function(c)
        return "[" .. string.lower(c) .. string.upper(c) .. "]"
    end)
    return s
end

print(nocase("Hi there!"))

print([===[[[I'm a 
	"long",
	long
	str]]]===])

function foo()
	return 30,50
end
x,y = foo(),20
print(x,y)
--先判断foo()给x，20给y，然后30和50只有一个给x


print(table.unpack{10,20,30,40})
a={"hello","ll"}
print(string.find(table.unpack(a)))

function add(num, ... )
	local s = 0
	for i,v in ipairs({...}) do
		s = s + v
	end
	return num,s
end
print(add(9,1,2,3,4))

print(getmetatable(a))

window = {}
window.mt = {}
window.prototype = {x=0,y=0,width=100,height=100}
function window.new(t)
	 setmetatable(t,window.mt)
	 return t
end

window.mt.__index = function(table,key)
	 return window.prototype[key]
	 --[] yu . que bie?
end

w = window.new({x=10,y=20})
print(w.height)


window = {}
window.mt = {}
window.mt.__newindex = function(table,key,value)
     print("update of element"..tostring(key)..tostring(value))
     rawset(table,key,value)
     	table[key]=value
end
function window.new(t)
	 setmetatable(t,window.mt)
	 return t
end
w = window.new({x=10,y=20})
w.a = 10
print(w.a)

-- 封装
People = {age=18}
function People:new()
	local p = {}
	setmetatable(p,self)
	self.__index = self
	return p
end
function People:growup( ... )
	 self.age = self.age + 1
	 print(self.age)
end
p1 = People:new()
p1:growup()
p2 = People:new()
p2:growup()

-- 继承
Man = People:new()
function Man:growup( ... )
	self.age = self.age + 1
	print("man's growup:"..self.age)
end
man1 = Man:new()
man1:growup()


-- 多态
-- lua不支持函数的多态，由于lua动态类型的特性，本身能够支持指针的多态
person = People:new()
person:growup()
person = Man:new()
person:growup()


-- 行数，单词数，字符数
local BUFSIZE = 2^13            -- 8K
    local f = io.input("module.lua")      -- 打开输入文件
    local cc, lc, wc = 0, 0, 0      -- 字符、行、单词的计数
    while true do
       local lines, rest = f:read(BUFSIZE, "*line")
       if not lines then break end
       if rest then lines = lines .. rest .. "\n" end
       cc = cc + #lines
       -- 统计块中的单词数
       local _, t = string.gsub(lines, "%S+", "")
       wc = wc + t
       -- 统计块中的换行字符数量
       _, t = string.gsub(lines, "\n", "\n")
       lc = lc + t
    end
    print(lc, wc, cc)


function testa()

	 return true
end
if testa()~=true then
	print("nil to the test")
end


--必为10，1，-1,第三个参数默认值一直是1，不加入第三个参数无法从大到小排列
for i=10,1,-1 do
	print(i)
end


a = 10

while( a < 20 )
do
   print("value of a:", a)
   a=a+1
   if( a > 15)
   then
      break
   end
   print("the true of break")
end
-- 在循环内遇到 break 语句时，循环将立即结束
print("the true break out circul")


-- 我们可以将函数赋值给一个变量，也可以将函数作为参数传递给另外一个函数
myprint = function (param)
   print("This is my print function -   ##",param,"##")
end

function add(num1,num2,functionPrint)
   result = num1 + num2
   functionPrint(result)
end
myprint(10)
add(2,5,myprint)

string1 = "string1 is lua"
print(string.find(string1,"is",2,13))
--起点  终点


fruits = {"banana","orange","apple","grapes"}
table.sort( fruits)
for i,v in pairs(fruits) do
	print(i,v)
end


mymath3 = require("mymath2")
mymath3.add(10,20)


mytable = setmetatable({key1 = "value1"},{__index = { key2 = "metatablevalue"}})
print(mytable.key1,mytable.key2)


-- 用 rawset 函数在相同的表（主表）中更新键值，而不再是将新的键添加到另外的表中
-- mytable = setmetatable({key1 = "value1"},{__newindex = function(mytable,key,value)
-- 	  rawset(mytable,key,"\""..value.."\"")
-- end})
mytable = setmetatable({key1 = "value1"},{__newindex = function(mytable,key,value)
	rawset(mytable,key,"\""..value.."\"") end})
mytable.key1 = "new value"
mytable.key2 = 4
print(mytable.key1,mytable.key2)


mytable = setmetatable({1,2,3},{
	__add = function(mytable,newtable)
		for i,v in ipairs(newtable) do
			table.insert(mytable,#mytable+1,newtable[i])
		end
		return mytable
	end
	})
secondtable = {4,6,8}
mytable1 = mytable + secondtable
for k,v in ipairs(mytable1) do
	print(k,v)
end


file = io.open("testlua3.lua","r")
io.input(file)
print(io.read())
io.close()


local function add12(a,b)
-- 若其值为 1(默认值)，返回的错误的位置是 error 函数被调用的位置,即返回/Users/swqt/Desktop/obj-c/lua xuexidaima/lua/testlua4.lua:699: a is not a number
-- stack traceback:
-- 	[C]: in function 'error'
-- 	/Users/swqt/Desktop/obj-c/lua xuexidaima/lua/testlua4.lua:698: in local 'add12'
-- 	/Users/swqt/Desktop/obj-c/lua xuexidaima/lua/testlua4.lua:701: in main chunk
	 -- error("a is not a number",1)
	 return a+b
end
-- 若为 2, 返回的错误位置为调用 error 函数的函数被调用的位置
-- /Users/swqt/Desktop/obj-c/lua xuexidaima/lua/testlua4.lua:712: a is not a number
-- stack traceback:
-- 	[C]: in function 'error'
-- 	/Users/swqt/Desktop/obj-c/lua xuexidaima/lua/testlua4.lua:698: in local 'add12'
-- 	/Users/swqt/Desktop/obj-c/lua xuexidaima/lua/testlua4.lua:701: in main chunk
print(add12(10,1))


-- getfenv(mytable)
-- print(gethook(co))


Rectangle = {area = 0, length = 0, breadth = 0}

-- 继承类的方法 new
function Rectangle:new (o,length,breadth)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.length = length or 0
  self.breadth = breadth or 0
  self.area = length*breadth;
  return o
end
r = Rectangle:new(nil,10,20)
--创建对象时只是加入了类为方法，pringArea还不是类的方法
-- r:printArea()
-- 继承类的方法 printArea
function Rectangle:printArea ()
  print("The area of Rectangle is ",self.area)
end
--r的元表中有pringArea方法，调用元表中的方法传人table(r)
r:printArea()


Shape = {area = 0}
function Shape:new(o,side)
	 o = o or {}
	 setmetatable(o,self)
	 self.__index = self
	 side = side or 0
	 self.area = side * side
	 return o
end

function Shape:printArea()
	 print("the area is :"..self.area)
end
shape1 = Shape:new({},10)
-- 承认不勇敢  你能不能别离开，很多爱不能重来  我应该释怀
shape1:printArea()
-- 在街头徘徊  下雨时为你撑伞，对你的爱成阻碍  祝福你愉快

Square = Shape:new()
-- 窗外的天气  像你心忐忑不定，如果这是结局  我希望你
function Square:new(o,side)
	-- 是真的满意  (希望你能听我)，你  就是我的小星星
	 o = o or Shape:new(o,side)
	 -- 挂  在那天上放光明，我已经决定要爱你  就不会轻易放弃
	 setmetatable(o,self)
	 -- 海  上流浪的许愿瓶，每  个心愿都是为你
	 self.__index = self
	 return o
	 -- 就算不能够在一起  我还是为你担心，把  悲伤写成协奏曲
end
function Square:printArea()
	-- 在  角落里为你弹琴，就算你可能听不清  也代表我的心意
	print("the square area is :"..self.area)
end
-- 爱  不一定要很甜蜜，说  山盟海誓的言语
square1 = Square:new({},13)
-- 只要那幸福在心底  哪怕我一人演戏
square1:printArea()


































































































