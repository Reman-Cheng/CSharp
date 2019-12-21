Set = {}
local mt = {}
function Set.new(l)
	local  set = {}
	setmetatable(set,mt)
	for _,v in pairs(l) do
		set[v] = true end
	return set
end

function Set.union(a, b)
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

-- local set1 = Set.new({10, 20, 30})
-- local set2 = Set.new({1, 2})
-- print(getmetatable(set1))
-- print(getmetatable(set2))
-- assert(getmetatable(set1) == getmetatable(set2))

mt.__add = Set.union

local set1 = Set.new({10, 20, 30})
local set2 = Set.new({1, 2})
local set3 = set1 + set2
-- Set.print(set3)

Windows = {} -- 创建一个命名空间
Windows.default = {x = 0, y = 0, width = 100, height = 100, color = {r = 255, g = 255, b = 255}}
Windows.mt = {} -- 创建元表
function Windows.new(o)
     setmetatable(o, Windows.mt)
     return o
end

-- 定义__index元方法
Windows.mt.__index = function (table, key)
     return Windows.default[key]
end

local win = Windows.new({x = 10, y = 10})
-- print(win.x)               -- >10 访问自身已经拥有的值
-- print(win.width)          -- >100 访问default表中的值
-- print(win.color.r)          -- >255 访问default表中的值



local a = {}
function b( ... )
	print("hello world")

end
a["sell"] = {callfunc =b}
a["sell"].callfunc()


function unpackex(tbl,args)
	  local ret = {}
	  for _,v in ipairs(args)do
	  	table.insert(ret,tbl[v])
	  end
	  return unpack(ret)
end
-- print(unpackex({one = {"one", "two", "three"}, two = "T" , three = "TH"},{"one", "two", "three"}))

local s = "hello world"
i,j = string.find(s,"hello")
print(i,j)
print(string.sub(s,1,5))

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

file = io.open("testRead.txt", "r")
for line in file:lines() do
    print(line)
end
file:close()

--写操作
file = io.open("testRead.txt","a+")
file:write("\nhello")
file:close()


file = io.open("testRead.txt","r")
for line in file:lines()do
	print(line)
end
file:close()
file = io. open("testRead.txt","a+")
file:write("\nnihao")

-- self指向待用调用者

file = io.open("testRead.txt", "r")
for line in file:lines() do
    print(line)
end
file:close()

--写操作
file = io.open("testRead.txt","a+")
file:write("\nhello")
file:close()file = io.open("testRead.txt", "r")
for line in file:lines() do
    print(line)
end
-- file:close()

--[[--写操作
file = io.open("testRead.txt","a+")
file:write("\nhello")
file:close()

-- self指向调用者
]]


a = {}
for i = 1,100 do
    a[i] = 0
end
print("The length of array 'a' is " .. #a)

squares = {1, 4, 9, 16, 25}
print("The length of array 'a' is " .. #squares)
-- 在Lua中习惯上数组的下表从1开始，Lua的标准库与此习惯保持一致


list = nil
for i = 1, 10 do
    list = { next = list ,value = i}
end

local l = list
while l do 
    print(l.value)
    l = l.next
end


print("----====lua shenjun start====----")
print(type(nil))
print(5e+12)
-- print(1..5) 错误,会把第一个点误认为数字的小数点
print(1 ..5)

a={a="then"}
print(a.a,a["a"])

print(table.unpack{10,20,60,{78}})


function unpack(t, i)
    i = i or 1
    if t[i] then
        return t[i], unpack(t, i+1)
    end
end

function add( ... )
    local s = 0
    for i, v in ipairs( {...} ) do  -- 表达式{...}表示一个由所有变长参数构成的数组。
        s = s + v
    end
    print(select("#",...))
    print(select(3,...))
    return s
end

print(add(3, 4, 10, 25, 12))


a={p = print}
a.p("hello right")

-- local oldopen = io.open
-- local access_ok = function(filename,mmode)
	
-- end
--  io.opne == function (filename)
--  	if access_ok
--  end
-- end


function room1()
        local move = io.read()
        if move == "south" then return room3()
        elseif move == "east" then return room2()
        else 
            print("invalid move")
            return room1()            -- stay in the same room
        end
    end

    function room2()
        local move = io.read()
        if move == "south" then return room4()
        elseif move == "west" then return room1()
        else 
            print("invalid move")
            return room2()            -- stay in the same room
        end
    end

    function room3()
        local move = io.read()
        if move == "north" then return room1()
        elseif move == "east" then return room4()
        else 
            print("invalid move")
            return room3()            -- stay in the same room
        end
    end

    function room4()
        print("congratulations!")
    end

-- room1("south")

a= {"one","two","three"}
for i,v in ipairs(a)do
	print(i,v)
end


co = coroutine.create(function()
	 for i=1,10 do
	 	print("co",i)
	 	coroutine.yield()
	 end
end)
for i=1,10 do
    coroutine.resume(co)
end
print(coroutine.resume(co))


function permgen(a,n)
	 n = n or #a
	 if n<=1 then
	 	printResult(a)
	 else
	 	for i=1,n do
	 		a[n],a[i] = a[i],a[n]
	 		permgen(a,n-1)
	 		a[n],a[i] = a[i],a[n]
	 	end
	 end
end
function printResult(a)
	for i=1,#a do
		io.write(a[i]," ")
	end
	io.write("\n")	
end
permgen({1,2,3,4})


a = 'a "problematic"\\string'
print(string.format("%q", a))



function serialize(o)
	 if type(o) == "number" then
	 	io.write(o)
	 elseif type(o) == "string" then
	 	io.write(string.format("%q",o))
	 elseif type(o) == "table" then
	 	io.write("{\n")
	 	for k,v in pairs(o) do
	 		io.write(" "..k.."=")
	 		-- io.write(" [\""..tostring(k).."\"] = ")
	 		serialize(v)
	 		io.write(",\n")
	 	end
	 	io.write("}\n")
	 else
	 	error("donnot know what is")
	 end
end
serialize({a=23,b="lua",{c=5,d="open"}})
-- serialize{a=23,b="lua",{c=5,d="open"}}
-- 两种调用方法相同


function basicSerialize(o)
	 if type(o) == "number" then
	 	return tostring(o)
	 else
	 	return string.format("%q",o)
	 end
end

function save(name,value,saved)
	saved = saved or {}
	io.write(name," = ")
	if type(value) == "number" or type(value) == "string" then
		io.write(basicSerialize(value),"\n")
	elseif type(value) == "table" then
		if saved[value] then
			io.write(saved[value],"\n")
		else
			saved[value] = name
			io.write("{}\n")
			for k,v in pairs(value) do
				k=basicSerialize(k)
				local fname = string.format("%s[%s]",name,k)
				save(fname,v,saved)
			end
		end
	else
		error("cannot save a"..type(value))
	end
end

-- 字符串程序库为所有的字符串都设置了一个元表，而其他类型在默认情况中都没有元表。
print(getmetatable("hello tostring"))

Set={}
function Set.new(l)
	local set = {}
	setmetatable(set,mt)
	for _,v in ipairs(l)do
		set[v] = true
	end
	return set
end
-- Set.new()
s1 = Set.new({10,20,30,406,40})
s2 = Set.new({10,20,30})
print(getmetatable(s1))
print(getmetatable(s2))


Window = {}
Window.prototype = {x=0,y=0,width=100,height=100}
Window.mt = {}
function Window.new(o)
	setmetatable(o,Window.mt)
	return o
end

Window.mt.__index = function(table,key)
	return Window.prototype[key]
end

w=Window.new({x=10,y=20})
print(w.width)


function setDefault(t,d)
	local mt = {__index = function()
		return d
	end}
	setmetatable(t,mt)
end

tab = {x = 10,y = 20}
print(tab.x,tab.z)
setDefault(tab,0)
print(tab.x,tab.z)

for n in pairs(_G)do io.write(n.." ")end
print("\n")
for k,v in pairs(io)do print(k,v)end

value = _G["type"]
print(value)
value = _G.io.read
print(value)


setmetatable(_G, {
        __newindex = function(_, n)
            error("attemp to write to undeclared variable " .. n, 2)
        end,
        __index = function(_, n)
            error("attempt to read undeclared variable " .. n, 2)
        end
    })

print(a14)















































































