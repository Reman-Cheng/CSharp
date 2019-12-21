print(os.date("!%Y%m%d%H%M%S"))

rtRecv = "(5kj77). Revision"
local _,a,version = string.find(rtRecv or " ", "%((%w*)%). Revision")
print(_,a,version)
local rec1 = string.match(rtRecv,"%((%w*)%). Revision")
print(rec1)
print(rtRecv:sub(1,4))


page = [[
<html>
</html>
]]
print(page)

page1 = --[=[
<html>
[===[
左右[[]]的等号要相同
]===]
</html>
]=]
-- 左右[=[ ]=]的等号要相同
print(page1)

io.open("testlua1.lua")
-- print(io.read("testlua1.lua"))
-- tonumber  tostring
a={}
a[20]="great"
a.b=68
a["but"]="fornt"
for i,v in pairs(a)do
	print(type(i),i,v)
end

b=a
print(a,b)
a=nil
print(a,b)
b=nil
print(a,b)


for i=1,10,2 do
	print(i)
end


print("----====位于return和break之后的语句都无法执行到====----")
print(os.date("%Y/%m/%d %H:%M:%S"))

print(table.unpack({10,20,30}))

for i=1,select("#",1,2,3,nil,5)do
	local arg = select(tostring(i),1,2,3,nil,5)
	print(arg)
end


arg = {old="temp.lua",new="temp1.lua"}
function rename(arg)
	return os.rename(arg.old,arg.new)
end
--能用可以改变文件名
rename(arg)


print("----====深入函数 函数名为持有某个函数的变量====----")
network={
	{name = "grauna",ip = "34"},
	{name = "arraial",ip = "23"},
	{name = "lua",ip = "12"},
	{name = "derain",ip = "20"}
}
table.sort( network, function (a,b)
	return #(a.name)>#(b.name)
end )
for i,v in pairs(network) do
	print(v.name)
end


function derivative(f,delta)
	delta = delta or 1e-4
	return function (x)
		return (f(x+delta))-f(x)/delta
	end
end


names = {"peter","paul","mary"}
grades = {peter=8,paul = 7,mary = 10}
function sortbygrade(names)
	table.sort(names,function(a,b)
		--a和b为传人参数names的各个值
		return a>b
	end)
end
sortbygrade(names,grades)
for i,v in ipairs(names)do
	print(i,v)
end


print("----====数字for和范型for====----")
tab1 = {66,4,5,6,88,97}
function values(t)
	local i = 0
	return function ()
		i = i + 1
		return t[i]
	end
end
-- t={}
-- table.insert(t,values(tab1))
-- for i,v in ipairs(t)do
-- 	print(i,v)
-- end

for i=1,#tab1 do
	k=values(tab1)
print(k)
end
iter = values(tab1)
--第一层iter为一个function  所有要再次调用iter()给其赋值为x
while true do
	local x = iter()
	if x == nil then break end
	print(x)
end

for em in values(tab1)do
	print(em)
end


print("----====pairs ipairs string.gmatch io.lines====----")
function allwords1( )
	local line = "string find in the function lua can do everything"
	local pos = 1
	return function ( )
		while line do
			local s,e = string.find(line,"%w+",pos)
			if s then
				pos = e+1
				return string.sub(line,s,e)
			end
			return nil
		end
	end
end
for word in allwords1() do
	print(word)
end


local function iter1(a,i)
	i=i+1
	local v = a[i]
	if v then
		return i,v
	end
end

function ipa(a)
	return iter1,a,0
end
a={"string",67,88,4,"finding"}
for i,v,m,n in ipa(a)do
	print(i,v,m,n)
end
print("----====iter2====----")
local function iter2(a,i)
	i=i
	return function()
	i=i+1
	local v = a[i]
	if v then
	   return i,v
	end
	end
end
for i,v in iter2(a,0)do
	print(i,v)
end

tab2 = {key="keyboard",mouse="mouse",b=55,d="find"}
for i,v in next,tab2 do
	print(i,v)
end


function allwords2( )
	local state ={line = "string to do anything for you",pos=1}
	return function ( )
		while state.line do
			local s,e = string.find(state.line,"%w+",state.pos)
			if s then
				state.pos = e+1
				return string.sub(state.line,s,e)
			end
			return nil
		end
	end
end
for word in allwords2() do
	print(word)
end


function allwords3(f)
	for line in io.lines("module.lua")do
		for word in string.gmatch(line,"%w+")do
			f(word)
		end
	end
end
allwords3(print)


-- dofile("testlua1.lua")
-- fstr = loadstring("i=i+1")
-- i=0
-- fstr()
-- print(i)
-- fstr()
-- print(i)

i=32
local i = 0
-- f = assert(loadstring("i=i+1;print(i)"))
g = function()
	i=i+1
	print(i)
end
-- f()
g()


a="string1"
m,n =assert(type(a)=="string","the type is not string")
print(m,n)

print(assert(io.open("temp1.lua","r")))

print("----====协调程序====----")
co = coroutine.create(function( )
	print("hi")
end)
print(co)
coroutine.resume(co)
print(coroutine.status(co))


co = coroutine.create(function ( )
	 for i=1,10 do
	 	print("co",i)
	 	coroutine.yield()
	 end
end)
for i=1,10 do
	coroutine.resume(co)
end
print(coroutine.resume(co))
print(coroutine.resume(co))


co = coroutine.create(function (a,b,c)
	 print("co",a,b,c)
end)
coroutine.resume(co,1,23,67)

print("----====所有传递给resume的额外参数都将视为协调程序的主函数的参数====----")
co = coroutine.create(function (a,b)
	 m,n = coroutine.yield(a+b,a-b)
end)
print(coroutine.resume(co,30,10))
print(m,n)
print(coroutine.resume(co,20,5))
print(m,n)


print("----====生产者与消费者====----")
function receive(pro)
	local states,values = coroutine.resume(pro)
	return values
end
function send(x)
	coroutine.yield(x)
end
function producer2()
	return coroutine.create(function()
		x=0
		while x<=10 do
			local x = x + 1
			send(x)
		end
	end)
end
function filter(prod)
	return coroutine.create(function( )
		for line =1,math.huge do
			local x = receive(prod)
			x= string.format("%5d%s",line,x)
			send(x)
		end
	end)
end
function consumer(prod )
	for i=1,10 do
		x=receive(prod)
		io.write(x,"\n")
	end
end

consumer(filter(producer2()))


function permgen(a,n)
	n = n or #a
	if n<=1 then
		coroutine.yield(a)
	else
		for i=1,n do
			a[n],a[i] = a[i],a[n]
			permgen(a,n-1)
			a[i],a[n] = a[n],a[i]
		end
	end
end

function printResult(a)
	for i=1,#a do
		io.write(a[i]," ")
	end
	io.write("\n")
end

-- permgen({1,2,3,4},4)

function permutation(a)
	local co = coroutine.create(function ()
		permgen(a)
	end)
	return function ()
		local code,res = coroutine.resume(co)
		return res,code
	end
end
for p,m in permutation({"a","b","c","d"})do
	printResult(p,m)
end

-- require "socket"
function fwrite( fmt,... )
	return io.write(string.format(fmt,...))
end
function writeheader()
	io.write([[
		<html>
		<head><title>Projects using Lua</title></head>
		<body bgcolor="#FFFFFF">
		here are brief descriotions of some projects around the
		world that use <a href="home.html">Lua</a>
		<br>
		]])
end

function mult(a,rowindex,k)
    local row = a[rowindex]
    for i,v in pairs(row) do
    	row[i] = v * k
    end
end


list = {next = list,value = v}
local l = list
while l do
	print(l.value)
    l = l.next
end

print("----====队列的实现====----")
List = {}
function List.new( )
	return {first = 0,last = -1}
end

function List.pushfirst(list,value)
	local first = list.first -1
	list.first = first
	list[first] = value
end
function List.pushlast(list,value)
	local last = list.last + 1
	list.last = last
	list[last] = value
end

function List.popfirst(list)
	local first = list.first
	if first > list.last then error("list is empty") end
	local value = list[first]
	list[first] = nil
	list.first = first + 1
	return value
end
function List.poplast(list)
	local last = list.last
	if list.first > last then error("list is empty") end
	local value = list[last]
	list[last] = nil
	list.last = last - 1
	return value
end
list1 = List.new()
List.pushfirst(list1,3)
List.pushfirst(list1,35)
for i,v in pairs(list1)do
	print(i,v)
end


print("----====集合与无序组====----")
reserved = {
	["while"] = true,["end"] = true,["function"] = true,["lcoal"] = true
}
-- for w in allwords()do
-- 	if not reserved[w] then
-- 		print("the w is not need")
-- 	end
-- 	print(w)
-- end

function set1(list)
	local set = {}
	for _,l in ipairs(list) do
		set[l] =true 
	end
	return set
end
reserved = set1{"while","end","function","local"}
for i,v in pairs(reserved) do
	print(i,v)
end

function insertbag(bag,element)
	bag[element] = (bag[element] or 0) + 1
end
function removebag(bag,element)
	local count = bag[element]
	bag[element] = (count and count > 1) and count-1 or nil
end


print("----====字符串缓冲====----")
local t = {}
for line in io.lines("module.lua")do
	t[#t+1]=line.."\n"
end
--可以插入第二个参数，插入字符串分隔符
-- local s=table.concat(t,"\n")
local s=table.concat(t)
print(s)

function addString(stack,s)
	stack[#stack+1] = s
	for i=#stack-1,1,-1 do
		if #stack[i]>#stack[i+1] then
			break
		end
		stack[i] = stack[i]..stack[i+1]
		stack[i+1]=nil
	end
end


print("----====图====----")
local function name2node(graph,name)
	  if not graph.name then
	  	--jie dian bu cun zai
	  	graph.name = {name=name,adj={}}
	  end
	  return graph.name
end
function readgraph()
	 local graph = {}
	 for line in io.lines("mymath2.lua") do
	 	-- 切分行中的两个名称
	 	local namefrom,nameto = string.match(line,"(%S+)%s+(%S+)")
	 	-- print(namefrom,nameto)
	 	--查找相应的结点
        local from = name2node(graph,namefrom)
        local to = name2node(graph,nameto)
	 	--将to添加到from到领接集合
	 	from.adj[to] = true
	 end
	 return graph
end
function findpath(curr,to,path,visited)
	path = path or {}
	visited = visited or {}
	if visited[curr] then
		return nil
	end
	visited[curr] =true
	path[#path+1] = curr
	if curr == to then
		return path
	end
	for node in pairs(curr.adj)do
		local p = findpath(node,to,path,visited)
		if p then return p end
	end
	path[#path]=nil
end
function printpath(path)
	for i=1,#path do
		print(path[i].name)
	end
end
g=readgraph()
a=name2node(g,"a")
b=name2node(g,"b")
p=findpath(a,b)
if p then printpath(p) end
-- ab={}
-- for line in io.lines("mymath2.lua") do
-- 	 	-- 切分行中的两个名称
-- 	 	local namefrom,nameto = string.match(line,"(%S+)%s+(%S+)")
-- 	 	print(namefrom,nameto)
--         ab.namefrom={namefrom=namefrom,adj={}}
-- end
-- for i,v in pairs(ab)do
-- 	print(i,v)
-- end


print("----====数据文件串行化====----")
-- Entry={author = "don",
-- title = "liter",
-- publisher = "csli",
-- year = 1992
-- }
-- local authors = {}
-- function Entry(b)
-- 	 authors[b.author] = true end
-- Entry(Entry)
-- 	 for name in pairs(authors)do print(name) end
function serialize(o)
	if type(o) == "number" then
		io.write(o)
	elseif type(o) == "string" then
		io.write(string.format("%q",o))
	elseif type(o) == "table" then
		io.write("{\n")
	for k,v in pairs(o) do
		io.write(" ",k," = ")
		serialize(v)
	    io.write(",\n")
	end
	io.write("}\n")
    else
    	error("cannot serialize a"..type(o))
    end
end
tabtest1 = {key="key",string="finding",{a=10,b="str",{c=11}}}
serialize(tabtest1)


function basicserialize(o)
	if type(o) == "number" then
		return tostring(o)
	elseif type(o) == "string" then
		return string.format("%q",o)
    end
end
function savetab(name,value,saved)
	saved = saved or {}
	io.write(name," = ")
	if type(value) == "number" or type(value) == "string" then
		io.write(basicserialize(value),"\n")
	elseif type(value) == "table" then
		if saved[value] then
			io.write(saved[value],"\n")
		else
			saved[value] = name
			io.write("{}\n")
			for k,v in pairs(value) do
				k= basicserialize(k)
				local fname = string.format("%s[%s]",name,k)
				savetab(fname,v,saved)
			end
		end
	else
		error("cannot save a"..type(value))
	end
end
a={x=1,y=2,{3,4,5,4}}
a[2]=a
a.z=a[1]
savetab("atab",a)

a={{"one","two"},4}
b={k=a[1]}
print("----==a==----")
savetab("a",a)
print("----==b==----")
savetab("b",b)


print("----====metatable====----")
t={}
t1={}
setmetatable(t,t1)
print(assert(getmetatable(t)==t1))

setmetatable(t,t)
print(assert(getmetatable(t)==t))

taba = getmetatable("hill")
for i,v in pairs(taba) do
	print(i,v)
	for m,n in pairs(v)do
		print(m,n)
	end
end
print(getmetatable(10))

print("----====算术运算====----")
Set = {}
local mt = {}
function Set.new(l)
	local set = {}
	setmetatable(set,mt)
	for _,v in ipairs(l) do
		set[v]=true
	end
	return set
end
function Set.union(a,b)
	local res = Set.new({})
	for k in pairs(a) do
		res[k]=true 
	end
	for k in pairs(b) do
		res[k]=true
	end
	return res
end
function Set.intersection(a,b)
	local res = Set.new({})
	for k in pairs(b) do
		res[k]=a[k]
	end
	return res
end
function Set.tostring(set)
	local l = {}
	for e in pairs(set) do
		l[#l+1]=e
	end
	return "{"..table.concat(l,",").."}"
end
function Set.print(s)
	print(Set.tostring(s))
end



s1 = Set.new({10,20,30,40})
s2 = Set.new({5,10,50,60,20})
for i,v in pairs(s1)do
	print(i,v)
end
print(getmetatable(s1))
print(getmetatable(s2))
mt.__add = Set.union
s3 = s2+s1
for i,v in pairs(s3)do
	print(i,v)
end
--并集
Set.print(s3)

mt.__mul = Set.intersection
s3 = s1 * s2
Set.print(s3)


print("----====table访问的元方法====----")
Tab = {}
Tab.protype = {x=0,y=0,width=100,height=106}
Tab.mt={__index=function(tabr,key)
     for i,v in pairs(tabr) do
     	print(i,v)
     end
	return Tab.protype[key]
end}
function Tab.new(obj)
	setmetatable(obj,Tab.mt)
	return obj
end
t = Tab.new({x=10})
print(t.y,t.width,t.height)


function setdefault(t,d)
	local mt = {__index=function()
		return d
	end}
	setmetatable(t,mt)
end
tab={x=10,y=20}
print(tab.x,tab.z)
setdefault(tab,0)
print(tab.x,tab.z)


local key = {}
local mt = {__index = function(t)
	return t[key]
end}
function setdefault1(t,d)
	t[key]=d
	setmetatable(t,mt)
end
setdefault1(tab,1)
print(tab.x,tab.z)

print("----====跟踪table的访问====----")
t={}
local _t = t
t={}
local mt = {
	__index = function(t,k)
		print("*access to element "..tostring(k))
		return _t[k]
	end,

	__newindex = function (t,k,v)
		print("*update of element "..tostring(k).." to "..tostring(v))
		_t[k]=v
	end
}
setmetatable(t,mt)
t[2]="hello"
print(t[2])


local index = {}
local mt = {
	__index = function(t,k)
		print("*access to element "..tostring(k))
		return t[index][k]
	end,
	__newindex = function(t,k,v)
		print("*update of element "..tostring(k).." to "..tostring(v))
		t[index][k]=v
	end
}
function track(t)
	local proxy = {}
	proxy[index] = t
	setmetatable(proxy,mt)
	return proxy
end
t=track(t)
t[3]="string1"
print(t[3])


for n in pairs(_G)do print(n) end
print("----==用来检测出应用全局变量_G中不存在的变量==----")
-- setmetatable(_G,{
-- 	__newindex = function(_,n)
-- 		error("attempt to write to undeclared variable"..n,2)
-- 	end,
-- 	__index = function(_,n)
-- 		error("attempt to read undeclared variable"..n,2)
-- 	end
-- 	})
-- print(aaa)

print("----====模块与包====----")
require "module"
mod.func1()
m=require "module"
m.func1()
require "module"
local f=mod.func1
f()


local m1= require "io"
m1.write("hello world!\n")

function require1(name)
	if not package.loaded[name] then
		local loader = findloader(name)
		if loader == nil then
			error("unable to load module"..name)
		end
		package.loaded[name] = true
		local res = loader(name)
		if res~=nil then
			package.loaded[name] = res
		end
	end
	return package.loaded[name]
end

print(package.path)

-- package.path = string.gsub(package.path,";"," ")
-- print(package.path)
-- local _,_,str = string.find(package.path,"([%a%d%/%?%.]+)%s")
-- print(str)
local i = 1
for word in string.gmatch(package.path,"([%a%d%/%?%.]+)%;") do
	print("("..i..")"..word)
	i=i+1
end

-- local mod1 = require "module"
-- local M1 = {}
-- _G[mod1] = M1
-- package.loaded[mod1] = M1
-- setmetatable(M1,{__index = _G})
-- setfenv(1,M)


print("----====面向对象编程====----")
account = {balance = 0,limit = 1000}
function account.withdraw(v)
	account.balance = account.balance - v
end
account.withdraw(10)
print(account.balance)

a=account
-- account = nil
print(a.balance)
function a.withdraw(self,v)
	self.balance = self.balance - v
end
a.withdraw(a,100)
print(a.balance)
for i,v in pairs(a) do
	print(i,v)
end

ab=a
ab.withdraw(ab,200)
print(ab.balance)
function ab:withdraw(v)
	self.balance = self.balance - v
end

a2=ab
a2:withdraw(200)
for i,v in pairs(a2) do
	print(i,v)
end


function account:new(obj)
	obj = obj or {}
	setmetatable(obj,self)
	self.__index = self
	return obj
end
function account:deposit(v)
	 self.balance = self.balance + v
end
atest = account:new()
atest:deposit(100)
for i,v in pairs(atest) do
	print(i,v)
end
b = account:new()
print(b.balance)


specialaccount = account:new({limit = 1000})
s = specialaccount:new()
s:deposit(100)
print(s.balance)
function specialaccount:withdraw(v)
	-- if v-self.balance>=self.getLimit() then
	-- 	error "insufficient funds"
	-- end
	self.balance = self.balance - v
end
function specialaccount:getLimit()
	return self.limit or 0
end
-- function s:getLimit(s)
-- 	return self.balance*0.1
-- end
s:withdraw(200)
print("----====print(s)====----")
for i,v in pairs(s) do
	print(i,v)
end



local function search(k,plist)
	for i=1,#plist do
		local v = plist[i][k]
		if v then return v end
	end
end
function createClass(...)
	local c = {}
	local parents = {...}
	setmetatable(c,parents)
	return c
end
c = {}
setmetatable(c,{__index = function(t,k)
	return search(k,parents)
end})
c.__index = c
function c:new(o)
	o=o or {}
	setmetatable(o,c)
	return o
end

Named = {}
function Named:getname( )
	return self.name
end
function Named:setname(n)
	self.name = n
end
NamedAccount = createClass(Account,Named)
-- Account = NamedAccount:new({name = "Paul"})
-- print(Account:getname())

print("----====私密性====----")
function newAccount(initbalance)
	local self = {balance =initbalance,limit = 10000.00}
	local withdraw = function(v)
		self.balance = self.balance - v
	end
	local deposit = function(v)
		self.balance = self.balance + v
	end
	local extra = function()
		if self.balance>self.limit then
			return self.balance*0.1
		else
			return 0
		end
	end
	local getbalance = function()
		return self.balance + extra()
	end
	--withdraw,deposit,getbalance都return了可以被外部用户访问，而extra没return无法被外部用户访问
	return {withdraw = withdraw,deposit = deposit,getbalance=getbalance
    -- extra = extra
    }
end
acc1 = newAccount(20000)
acc1.withdraw(40)
-- print(acc1.extra())
print(acc1.getbalance())

print("----====single-method====----")
function newobject(value)
	return function(action,v)
		if action == "get" then return value
		elseif action == "set" then value = v
		else error("invalid action")
		end
	end
end
d=newobject(0)
print(d("get"))
d("set",10)
print(d("get"))

print("----====弱引用table====----")
a={}
b={__mode="k"}
setmetatable(a,b)
key={}
a[key]=1
key={}
a[key]=2
collectgarbage()
for k,v in pairs(a) do
	print(v)
end
c={__mode="k"}
c["key"]=10
collectgarbage()
for k,v in pairs(c) do
	print(k,v)
end


local results = {}
setmetatable(results,{__mode = "kv"})
function men_loadstring(s)
	local res = results[s]
	if res == nil then
		res = assert(loadstring(s))
		results[s] = res
	end
	return res
end

local result = {}
setmetatable(result,{__mode = "v"})
function createRGB(r,g,b)
	local key = r.."-"..g.."-"..b
	local color = result[key]
	if color == nil then
		color = {red = r,green = g,blue = b}
		result[key] = color
	end
	return color
end

for i,v in pairs(createRGB(4,7,9))do
	print(i,v)
end
for i,v in pairs(result)do
	print(i,v)
end
for i,v in pairs(createRGB(6,8,10))do
	print(i,v)
end
for i,v in pairs(result)do
	print(i,v)
end


local default = {}
setmetatable(default,{__mode="k"})
local  mt = {__index = function(t)
	return default[t] 
end}
function setDefault(t,d)
	default[t] = d
	setmetatable(t,mt)
end

local metas = {}
setmetatable(metas,{__mode = "v"})
function setdefault(t,d)
	local mt = metas[d]
	if mt == nil then
		mt = {__index = function()
			return d end}
		metas[d] = mt
	end
	setmetatable(t,mt)
end


print("----====数学库====----")
print(math.acos(0.5))
math.sin = function(x)
	return math.sin(math.rad(x))
end
-- print(math.sin(2/math.pi))

print("----====table库====----")
print("--==插入与删除==--")

t={}
for line in io.lines("module.lua")do
	table.insert(t,line)
end
print(#t)
table.remove(t,line)
print(#t)
t1 = {4,5,8,9}
table.insert(t1,1,2)
table.insert(t1,10)
for i,v in ipairs(t1)do
	print(i,v)
end
table.remove(t1)
table.remove(t1,3)
for i,v in ipairs(t1)do
	print(i,v)
end

print("----====排序====----")
line2 = {10,24,48}
table.sort(line2,function(a,b)
	return a>b
end)
for i,v in ipairs(line2)do
	print(i,v)
end

lines = {luaset = 11,luaget = 25,luapresent =49}
for n in pairs(lines) do
	a[#a+1] = n
end
table.sort(a,function(a,b)
	return #a>#b
end)
for i,v in ipairs(a)do
	print(i,v)
end

function pairBykeys(t,f)
	local a = {}
	for n in pairs(t) do
		a[#a+1] = n 
	end
	table.sort( a,sortfunc)
	local i = 0
	return function()
		i = i + 1
		return a[i],t[a[i]]
	end
end
function sortfunc(a,b)
	return a,b
end
for name ,line in pairBykeys(lines)do
	print(name,line)
end

print("----====连接====----")
function rconcat(l)
	if type(l) ~= "table" then return l end
	local res = {}
	for i=1,#l do
		res[i] = rconcat(l[i])
	end
	return table.concat(res)
end
print(rconcat{{"a",{" nice"}}," and",{{" long"},{" list"}}})



print("----====字符串库====----")
table.sort(a,function(a,b)
	return string.lower(a)<string.lower(b)
end)
str = "findingtheduck"
print(str:sub(1,5))
print(str:sub(7,-1))
print(str:sub(2,-2))

print(string.char(97))
print(string.byte("abc",2))
print(string.byte("abc",2,-1))
print(str:byte(1,-1))

-- print(string.char(table.unpack(str)))
print(string.format("pi = %09.4f",math.pi))
tag,title = "hi","a title"
print(string.format("<%s>%s</%s>",tag,title,tag))


print("----====模式匹配函数====----")
-- find match gsub sub gmatch
s1 = "hello world"
i,j = string.find(s1,"hello")
print(i,j)
print(string.sub(s1,i,j))

local tt = {}
local i = 0
while true do
	i = string.find(s1,"\n",i+1)
	if i == nil then break end
	tt[#tt+1] = i
end

date = "today is 17/07/1990"
print(string.match(date,"%d+/%d+/%d+"))

print(string.gsub("all lii","l","x",2))

print(select(2,string.gsub(date," "," ")))

str1="string fing in the function is good"
words={}
for w in string.gmatch(str1,"%a+")do
	words[#words+1]=w
end
for i,v in ipairs(words)do
	print(i,v)
end

function searchreq(modname,path)
	 modname = string.gsub(modname,"%.","/")
	 for c in string.gmatch(path,"[^;]+") do
	 	local fname = string.gsub(c,"?",modname)
	 	local f = io.open(fname)
	 	if f then
	 		f:close()
	 		return fname
	 	end
	 end
	 return nil
end


print("----====模式====----")
print(string.gsub("hello, up-down!","%A","."))
-- % 作为转义符
print(string.gsub("one,and two; and three","%a+","word"))
-- 用'^'来表示补集 如[^\n]表示除换行符以外的其他字符
test = "int x; /* x */ int y; /* y */"
print(string.gsub(test,"/%*.*%*/","<comment>"))
test = "int x; /* x */ int y; /* y */"
print(string.gsub(test,"/%*.-%*/","<comment>"))

s="89"
print(string.find(s,"^%d"))
s="a(enclosed (in} parentheses)line"
print(string.gsub(s,"%b(}",""))

pair = "name = Anna"
key,value = string.match(pair,"(%a+)%s*=%s*(%a+)")
print(key,value)

s=[[then he said: "it's all right"!]]
q,quotedpart = string.match(s,"([\"'])(.-)%1")
print(quotedpart)
-- %1表示与左边对应位置的数量相等的匹配如([\"'])
p = "%[(=*)%[(.-)%]%1%]"
s = "a = [=[[[ something ]] ]==] ]=]; print(a)"
print(string.match(s,p))

print(string.gsub("hello Lua!","%a","%0-%0"))
s="\\command{some text}"
print(string.gsub(s,"\\(%a+){(.-)}","<%1>%2</%1>"))
s="the \\quote{task} is to \\em{change} that."
print(string.gsub(s,"the \\(%a+){(.-)} is to \\(%a+){(.-)} that.","<%1>%2</%1><%3>%4</%3>"))

--在table G中查找捕获到name和status并用变量内容替换它
function expand(s)
	--第二个参数引号中的都会被替换
	return string.gsub(s,"$(%w+)",_G)
end
name = "Lua";status = "great"
print(expand("$name is $status,isn't it?"))

function expand1(s)
	return string.gsub(s,"(%w+)",_G)
end
name = "Lua";status = "great"
print(expand1("name is status,isn't it?"))


function expand2(s)
	return (string.gsub(s,"$(%w+)",function(n)
		return tostring(_G[n])
	end))
end
print(expand2("print = $print; a = $a"))


function toxml(s)
	--两个匹配大项可以成为参数传人方法中去
	s=string.gsub(s,"\\(%a+)(%b{})",function(tag,body)
		body = string.sub(body,2,-2)
		body = toxml(body)
		return string.format("<%s>%s</%s>",tag,body,tag)
	end)
	return s
end
print(toxml("\\title{The \\bold{big} example}"))


print("----====URL编码====----")
--进行解码
function unescape(s)
	s = string.gsub(s,"+"," ")
	s = string.gsub(s,"%%(%x%x)",function(h)
		return string.char(tonumber(h,16))
		end)
	return s
end
print(unescape("a%2Bb+%3D+c"))
--进行编码
function escape(s)
	s = string.gsub(s,"[&=+%%%c]",function(c)
		--X 形成大写的16进制字母 x 形成小写的16进制字母
		return string.format("%%%02X",string.byte(c))
		end)
	s = string.gsub(s," ","+")
	return s
end
-- print(escape("a+b = c"))
function encode(t)
	local b = {}
	for k,v in pairs(t) do
		b[#b+1] =(escape(k).."="..escape(v))
	end
	return table.concat(b,"&")
end
t={name = "a1",query = "a+b = c",q = "yes or no"}
print(encode(t))

print("----====tab扩展====----")
--捕获它在目标字符串中的位置
print(string.match("hello","()ll()"))
--空捕获
function expandTabs(s,tab)
	tab = tab or 8
	local corr = 0
	s = string.gsub(s,"()\t",function(p)
		local sp = tab - (p - 1 + corr)%tab
		corr = corr - 1 + sp
		return string.rep(" ",sp)
	end)
	return s
end
function unpandTabs(s,tab)
	tab = tab or  8
	s = expandTabs(s)
	local pat = string.rep(".",tab)
	s = string.gsub(s,pat,"%0\1")
	s = string.gsub(s," +\1","\t")
	s = string.gsub(s,"\1","")
	return s
end

function code(s)
	return string.gsub(s,"\\(.)",function(x)
		return string.format("\\%03d",string.byte(x))
	end)
end
function decode(s)
	return string.gsub(s,"\\(%d%d%d)",function(d)
		return "\\"..string.char(d)
	end)
end



print("----====I/O库====----")
local lines = {}
for line in io.lines("module.lua") do
	lines[#lines+1] = line
end
table.sort(lines)
for _,l in ipairs(lines) do
	io.write(l,"\n")
end


print("----====readall====----")
f = io.open("module.lua","r")
-- print(f:read("*all"))
f = f:read("*all")
f = string.gsub(f,"([\128-\255=])",function(c)
	return string.format("=%02X",string.byte(c))
end)
io.write(f)


str1 = "function 开始测试"
for w in string.gmatch(str1,"([\128-\255])") do
	io.write(w)
end
print("\n")


--打开文件检查错误典型做法
-- local f = assert(io.open("nonexistentfile","r"))
-- print(f)

local f = assert(io.open("module.lua","r"))
local t = f:read("*all")
f:close()


local BUFSIZE = 2^13
local f = io.input("module.lua")
local cc,lc,wc = 0,0,0
while true do
	local lines,rest = f:read(BUFSIZE,"*line")
    if not lines then break end
    if rest then lines = line..rest.."\n" end
    cc=cc+#lines
    local _,t = string.gsub(lines,"%S+","")
    wc = wc + t
    _,t = string.gsub(lines,"\n","\n")
    lc = lc + t
end
print(lc,wc,cc)


--在二进制文件中找到所有字符串
local f = assert(io.open("luac.out.lua","rb"))
local data = f:read("*all")
local validchars = "[%w%p%s]"
local pattern = string.rep(validchars,6).."+%z"
for w in string.gmatch(data,pattern) do
	print(w)
end


-- local f = assert(io.open("luac.out.lua","rb"))
-- local block = 16
-- while true do
-- local bytes = f:read(block)
-- if not bytes then break end
-- for _,b in ipairs(string.byte(bytes,1,-1)) do
-- 	io.write(string.format("%02X",b))
-- end
-- io.write(string.rep("  ",block - string.len(bytes)))
-- io.write(" ",string.gsub(bytes,"%c","."),"\n")
-- end


str1 = "§"
str2 = "∞"
str4 = "|"
str3 = "∆"
n=5
for i=1,n do
	if i%2 == 1 then
		io.write(string.rep(" ",n-i)..string.rep("☯︎".." ",i)..string.rep("♚".." ",15)..string.rep("  ❄︎",5).."\n")
    end
    if i%2 == 0 then
    	io.write(string.rep(" ",n-i)..string.rep("☯︎".." ",i)..string.rep("♛".." ",15)..string.rep("  ❆",5).."\n")
    end
end
io.write(str1..string.rep(" ",29)..str1..string.rep(str2,7)..str1..string.rep("  ❄︎",5).."\n")
io.write(str1..string.rep(" ",29)..str1..string.rep(str2,7)..str1..string.rep("  ❆",5).."\n")
io.write(str1..string.rep(" ",3)..string.rep("≈",5)..string.rep(" ",13)..string.rep("≈",5)..string.rep(" ",3)..str1..string.rep(str2,7)..str1..string.rep("  ❄︎",5).."\n")
io.write(str1..string.rep(" ",3).."§♡∆♡§"..string.rep(" ",13).."§♡∇♡§"..string.rep(" ",3)..str1..string.rep(str2,7)..str1..string.rep("  ❆",5).."\n")
io.write(str1..string.rep(" ",3)..string.rep("≈",5)..string.rep(" ",13)..string.rep("≈",5)..string.rep(" ",3)..str1..string.rep(str2,7)..str1..string.rep("  ❄︎",5).."\n")
io.write(str1..string.rep(" ",11)..string.rep("∞",7)..string.rep(" ",11)..str1..string.rep(str2,7)..str1..string.rep("  ❆",5).."\n")
io.write(str1..string.rep(" ",11).."§"..string.rep(" $",2).." §"..string.rep(" ",11)..str1..string.rep(str2,7)..str1..string.rep("  ❄︎",5).."\n")
io.write(str1..string.rep(" ",11).."§"..string.rep(" $",2).." §"..string.rep(" ",11)..str1..string.rep(str2,7)..str1..string.rep("  ❆",5).."\n")
io.write(str1..string.rep(" ",11).."§"..string.rep(" $",2).." §"..string.rep(" ",11)..str1..string.rep(str2,7)..str1..string.rep("  ❄︎",5).."\n")
io.write(string.rep("≈",30)..str1..string.rep(str2,7)..str1..string.rep("  ❆",5).."\n")
print("฿₫")
print("♧♡♢♚♛☯︎⚤")
print("❄︎※❅❆ℑ∰𝓐𝓑𝓒𝓛𝓙𝓨𝓧𝓣𝓛𝓜𝓦𝕶𝕼𝔚")

-- os.remove("temp1.lua")
os.rename("temp.lua","temp1.lua")


print(os.time({year=1970,month=1,day=1,hour=9}))
tab=os.date("*t",906000490)
for i,v in pairs(tab) do
	print(i,v)
end


local x = os.clock()
local s = 0
for i=1,100000 do s=s+i end
print(string.format("elapsed time: %.2f\n",os.clock()))

--os.exit
print(os.getenv("HOME"))

--os.execute运行一条系统命令
function creatDir(dirname)
	os.execute("mkdir "..dirname)
end
creatDir("temp.lua")

print(os.setlocale("ISO-8859-1","collate"))
--collate 控制字符串字母顺序  ctype控制单个字符类型及大小写转换
--monetary 不影响lua程序  numeric控制如何格式化数字
--time 控制格式化日期和时间  all所有功能

print(os.setlocale("pt_BR"))
s = "return ("..tostring(3.4)..")"
print(s)


print("----====调试库====----")
print("----debug.getinfo(函数或栈层，指定希望获取信息)----")
-- "n" name和namewhat
-- "f" func
-- "S" source short_src what linedefined lastlinedefined
-- "l" currentline
-- "L" activelines
-- "u" nups

function traceback()
	for level = 1,math.huge do
		local info = debug.getinfo(level,"searchreq")
		if not info then break end
		if info.what == "C" then
			print(level,"C function")
		else
			print(string.format("[%s]:%d",info.short_src,info.currentline))
		end
	end
end
-- traceback()

print("----debug.getlocal(函数栈层，变量的索引)----")
function foo(a,b)
	local x
	do local c = a-b end
	local a=1
	while true do
		local name,value = debug.getlocal(1,a)
		if not name then break end
		print(name,value)
		a = a + 1
	end
end
foo(10,20)

print("----debug.getupvalue(closure，变量索引)----")
print("----debug.setupvalue(closure，变量索引,新值)----")
function getvarvalue(name)
	local value,found
	for i=1,math.huge do
		local n,v = debug.getlocal(2,i)
		if not n then break end
		if n== name then
			value = v
			found = true
		end
	end
	if found then return value end
	local func = debug.getinfo(2,"f").func
	for i=1,math.huge do
		local n,v = debug.getupvalue(func,i)
		if not n then break end
		if n== name then return v end
	end
	return getfenv(func)[name]
end

-- getvarvalue(str)
co = coroutine.create(function( )
	local x = 10
	coroutine.yield()
	error("some error")
end)
coroutine.resume(co)
-- print(debug.traceback(co))
print(coroutine.resume(co))
print(debug.getlocal(co,1,1))


print("----debug.sethook(钩子函数，字符串需要监控的事件，多久获得一次count事件)----")
debug.sethook(print,"1")

function trace(event,line)
	local s = debug.getinfo(2).short_src
	print(s..":"..line)
end
debug.sethook(trace,"1")

print("----====剖析器====----")
local counters = {}
local names = {}
local function hook()
	local f = debug.getinfo(2,"f").func
	if counters[f] == nil then
		counters[f] = 1
		names[f] = debug.getinfo(2,"Sn")
	else
		counters[f] = counters[f] + 1
	end
end
local f = assert(loadfile("module.lua"))
debug.sethook(hook,"c")
f()
debug.sethook()
function getname(func)
	local n = names[func]
	if n.what == "C" then
		return n.name
	end
	local lc = string.format("[%s]:%s",n.short_src,n.linedefined)
	if n.namewhat ~= "" then
		return string.format("%s (%s)",lc,n.name)
	else
		return lc
	end
end
for func,count in pairs(counters) do
	print(getname(func),count)
end


print("--==----====C API概述====----==--")
-- АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя
for i,v in pairs(counters)do
	print(i,v)
end
-- C API概述 是能使C与lua交互的函数


print("----====扩展应用程序====----")


print("----====从Lua调用C====----")






























































