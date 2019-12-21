--===Lua 元表(Metatable)===--


-- 在 Lua table 中我们可以访问对应的key来得到value值，但是却无法对两个 table 进行操作。
-- 因此 Lua 提供了元表(Metatable)，允许我们改变table的行为，每个行为关联了对应的元方法。
-- 例如，使用元表我们可以定义Lua如何计算两个table的相加操作a+b。
-- 当Lua试图对两个表进行相加时，先检查两者之一是否有元表，之后检查是否有一个叫"__add"的字段，若找到，则调用对应的值。"__add"等即时字段，其对应的值（往往是一个函数或是table）就是"元方法"。
-- 有两个很重要的函数来处理元表：

-- setmetatable(table,metatable): 对指定table设置元表(metatable)，如果元表(metatable)中存在__metatable键值，setmetatable会失败 。
-- getmetatable(table): 返回对象的元表(metatable)。此方法用于获取表的元表。


mytable = {}                          -- 普通表 
mymetatable = {}                      -- 元表
setmetatable(mytable,mymetatable)     -- 把 mymetatable 设为 mytable 的元表 

mytable = setmetatable({},{})
getmetatable(mytable)


--==__index 元方法

-- 这是 metatable 最常用的键。
-- 当你通过键来访问 table 的时候，如果这个键没有值，那么Lua就会寻找该table的metatable（假定有metatable）中的__index 键。如果__index包含一个表格，Lua会在表格中查找相应的键。
-- 我们可以在使用 lua 命令进入交互模式查看：
other = {foo=3}
t=setmetatable({},{__index=other})
print(t.foo,t.bar)

-- 如果__index包含一个函数的话，Lua就会调用那个函数，table和键会作为参数传递给函数。
-- __index 元方法查看表中元素是否存在，如果不存在，返回结果为 nil；如果存在则由 __index 返回结果。

mytable = setmetatable({key1 = "value1"},{__index =function (mytable,key)
	if key == "key2" then
	  return "metatable"
	else
		return nil
    end
end})
print(mytable.key1,mytable.key2)


-- mytable 表赋值为 {key1 = "value1"}。
-- mytable 设置了元表，元方法为 __index。
-- 在mytable表中查找 key1，如果找到，返回该元素，找不到则继续。
-- 在mytable表中查找 key2，如果找到，返回 metatablevalue，找不到则继续。
-- 判断元表有没有__index方法，如果__index方法是一个函数，则调用该函数。
-- 元方法中查看是否传入 "key2" 键的参数（mytable.key2已设置），如果传入 "key2" 参数返回 "metatablevalue"，否则返回 mytable 对应的键值。


-- mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
-- print(mytable.key1,mytable.key2)


-- __newindex 元方法用来对表更新，__index则用来对表访问 
mytable = {} 
mymetatable = {} 
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

print(mytable.key1,mytable.newkey)

mytable.newkey = "新值2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)
print("----------------")
for i,v in pairs(mytable)do
	print(i,v)
	end
-- 以上实例中表设置了元方法 __newindex，在对新索引键（newkey）赋值时（mytable.newkey = "新值2"），
-- 会调用元方法，而不进行赋值。而如果对已存在的索引键（key1），则会进行赋值，而不调用元方法 __newindex。


--==__newindex 元方法
-- __newindex 添加到metatable时，
-- 如果表中没有键，则新键的行为将由元方法定义。 下面给出了当主表中没有索引时设置metatable索引的简单示例。
mymetatable={}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })
print(mytable.key1)

mytable.newkey = "new value 2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "new  value 1"
print(mytable.key1,mymetatable.newkey1)

-- 在上面的程序中看到，如果主表中存在一个键，它只会更新它。 
-- 当维护中的键不可用时，它会将该键添加到metatable中。
-- 使用rawset函数更新同一个表的另一个示例如下所示 -

mytable=setmetatable({key1="value1"},{
	__newindex=function (mytable,key,value)
		rawset(mytable,key,"\""..value.."\"")
	end
	})
mytable.key1="new value"
mytable.key2=4
print(mytable.key1,mytable.key2)




-- rawset设置值而不使用元表的__newindex。 类似地，有一个rawget可以在不使用__index的情况下获取值。
-- 向表中添加运算符行为
function table.maxn(a)
	return #a
end

mytable = setmetatable({ 1, 2, 3 }, {
   __add = function(mytable, newtable)

      for i = 1, table.maxn(newtable) do
         table.insert(mytable, table.maxn(mytable)+1,newtable[i])
      end
      return mytable
   end
})

secondtable = {4,5,6}
mytable = mytable + secondtable

for k,v in ipairs(mytable) do
   print(k,v)
end


--==为表添加操作符
-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大值函数 table_maxn
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


-- __add键包含在元表中以添加运算符 + 的行为。键表和相应的操作符如下所示。
-- 编号	模式	描述
-- 1	__add	改变运算符+的行为
-- 2	__sub	改变运算符-的行为
-- 3	__mul	改变运算符*的行为
-- 4	__div	改变运算符/的行为
-- 5	__mod	改变运算符%的行为
-- 6	__unm	改变运算符-的行为
-- 7	__concat改变运算符..的行为
-- 8	__eq	改变运算符==的行为
-- 9	__lt	改变运算符<的行为
-- 10	__le	改变运算符<=的行为


--==__call 元方法
-- __call 元方法在 Lua 调用一个值时调用
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
-- 定义元方法__call 调用一个值时调用 更像一种方法
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


--==__tostring 元方法
-- __tostring 元方法用于修改表的输出行为
mytable = setmetatable({ 10, 20, 30 }, {
  __tostring = function(mytable)
    sum = 0
    for k, v in pairs(mytable) do
        sum = sum + v
 end
    return "表所有元素的和为 " .. sum
  end
})
print(mytable)


mytable = setmetatable({10}, {
   __call = function(mytable, newtable)
   sum = 0

      for i = 1, table.maxn(mytable) do
         sum = sum + mytable[i]
      end

      for i = 1, table.maxn(newtable) do
         sum = sum + newtable[i]
      end

      return sum
   end
})

newtable = {10,20,30}
print(mytable(newtable))


mytable = setmetatable({ 10, 20, 30 }, {
   __tostring = function(mytable)
   sum = 0

      for k, v in pairs(mytable) do
         sum = sum + v
      end

      return "The sum of values in the table is " .. sum
   end
})
print(mytable)






print("==================metatable,meatmethod===========================")

-- 当Lua试图对两个表进行相加时，先检查两者之一是否有元表，之后检查是否有一个叫"__add"的字段，若找到，则调用对应的值。"__add"等即时字段，其对应的值（往往是一个函数或是table）就是"元方法"。

t={}
print(getmetatable(t))
t1={}
setmetatable(t,t1)
assert(getmetatable(t)==t1)
print(getmetatable("hi"))
print(getmetatable(10))


set={}

function set.new(l)
	local set = {}
	setmetatable(set,mt)
	for _,v in ipairs(l) do
		set[v]=true
		end
		return set
end
function set.union(a,b)
	local res = set.new()
	if getmetatable(a)~=mt or getmetatable(b)~=mt then
		error("attempt to 'add' a set with a non-set value",2)
		end
	for k in pairs(a) do res[k]=true end
	for k in pairs(b) do res[k]=true end
	return res
end
function set.intersection(a,b)
	local res = set.new()
	for k in pairs(a) do res[k]=b[k] end
	return res
end
function set.tostring(set)
	local l = {}
	for e in pairs(set)do
		l[#l+1]=e
	end
	return "{"..table.concat(l,", ").."}"
end
function set.print(s)
	print(set.tostring(s))
end
local mt = {}

s1=set.new{10,20,30,50}
s2=set.new{30,1}
print(getmetatable(s1))
print(getmetatable(s2))
mt.__add=set.union
-- s3=s1+s2
-- set.print(s3)
mt.__mul=set.intersection
-- set.print((s1+s2)*s1)

-- s=set.new(1,2,3)
-- s=s+8

mt.__le=function(a,b)
	for k in pairs(a) do 
		if not b[k]then return false end
		end
		return true
end
mt.__lt=function (a,b)
    return a<=b and not (b<=a)
end
mt.__eq=function (a,b)
	return a<=b and b<=a
end
-- print(s1<=s2)
-- print(s1<s2)
-- setmetatable(table,metatable): 对指定table设置元表(metatable)，如果元表(metatable)中存在__metatable键值，setmetatable会失败 。
-- getmetatable(table): 返回对象的元表(metatable)。
mytable = {}                          -- 普通表 
mymetatable = {}                      -- 元表
setmetatable(mytable,mymetatable)     -- 把 mymetatable 设为 mytable 的元表 

-- setmetatable(table,metatable): 对指定table设置元表(metatable)，如果元表(metatable)中存在__metatable键值，setmetatable会失败 。

window={}
window.prototype = {x=0,y=0,width=100,heigth=100}
window.mt={x=2,y=1,width=5,heigth=10,z="sfjlafj"}
--声明构造函数
function window.new(o)

	setmetatable(o,window.mt)
	return o
end
-- window.mt.__index = function(table,key)
-- 	return window.prototype[key]
-- end
window.mt.__index = window.prototype --window.prototype["width"]
-- 两种声明相同

w=window.new{x=3,width=6}
print(w.x,w.y,w.width,w.heigth)

z=setmetatable(window.prototype,window.mt)
print(z.x,z.y,z.width,z.heigth)

local key = {}
function setDefaulttablevalue(t,d,key)
	local mt = {__index=function (t) return t[key] end}
		t[key]=d
		setmetatable(t,mt)
end
tab={x=10,y=20}
print(tab.x,tab.z)
setDefaulttablevalue(tab,0,66)
print(tab.x,tab.z)



-- for n in pairs(_G)do print(n) end
-- value = loadstring("return"..varname)()
-- print(type(_G.print))

valuesome=_G["add"]
print(valuesome)
for i,v in pairs(_G) do print(i,v)end
_G["sum12"]=sum12
print(_G["sum12"])



function getfield(f)
	local v=_G
	for w in string.gmatch(f,"[%w_]+") do
		v=v[w]
	end
	return v
end

function setfield(f,v)
	local t = _G
	for w,d in string.gmatch(f,"([%w_]+)(%.?)") do
		if d=="." then
			t[w]=t[w]or{}
			t=t[w]
		else
			t[w]=v
		end
	end
end
setfield("t.x.y","123456789")
print(t.x.y)
print(getfield("t.x.y"))


-- setmetatable(_G,{
-- 	__newindex = function (_,n)
-- 		error("attempt to write to underclared variable"..n,2)
-- 	end,
-- 	__index = function (_,n)
-- 		error("attempt to read underclared variable"..n,2)
-- 	end,
-- 	})
-- print(a)


-- function declare(name,initval)
-- 	rawset(_G,name,initval or false)
-- end

-- __newindex = function(t,n,v)
-- 	local w = debug.getinfo(2,"S").what
-- 	if w ~="main" and w ~="C" then
-- 		error("attempt to write to underclared variable"..n,2)
-- 		end
-- 	rawset(t,n,v)
-- end

-- local declaredNames = {}
-- setmetatable(_G,{
-- 	__newindex = function(t,n,v)
-- 	local w = debug.getinfo(2,"S").what
-- 	if w ~="main" and w ~="C" then
-- 		error("attempt to write to underclared variable"..n,2)
-- 		end
-- 	rawset(t,n,v)
--     end,

-- 	__index = function (_,n)
-- 	    if not declaredNames[n] then
-- 		error("attempt to read underclared variable"..n,2)
-- 		else
-- 			return nil
-- 	    end
-- 	end,
-- 	})


-- a=l
-- setfenv(l,{})
-- print(a)




function  derivative(f,delta)
	delta = delta or 1e-4
	return function (x)
	return(f(x+delta)-f(x))/delta
	end
end
function fun1(x)
	return x*x
end
c=derivative(fun1)
print(string.format("%-3.4s",c(10)))


-- a=1
-- setfenv(1,{g=_G})--改变当前的环境
-- g.print(a)
-- g.print(g.a)




-- a={}
-- for i=1,100 do
-- 	a[i]=i
-- 	print(a[i])
-- end
-- print(#a)

-- b={}
-- for i=-5,5 do
-- 	a[i]=i
-- 	print(a[i])
-- 	end
-- 	print(#b) -- chang du hui wei 0

-- squares = {3,2,5,9,6,uu,55}
-- for i=1,#squares do 
-- 	print(squares[i])
-- 	end



-- mt={}
-- for i=1,10 do
-- 	mt[i]={}
-- 	for j=1,10 do
-- 		mt[i][j]=j
-- 		print(mt[i][j])
-- 		end
-- 	end



-- metatable and meatmethod
t={}
print(getmetatable(t))

-- suan shu lei fang fa
set={}
local  mt = {}
function set.new(l)
	local set = {}
	setmetatable(set,mt)
	for _,v in ipairs(l) do set[v] =true end
	return set
	-- body
end
function set.union(a,b)
	local  res = set.union{}
	for k in pairs(a) do res[k] =true end
	for k in pairs(b) do res[k] =true end
	return res
end
function set.intersection(a,b)
	local  res = set.new{}
	for k in pairs(a) do
		res[k]=b[k]
		end
		return res
end

function set.tostring(set)
	local l = {}
	for e in pairs(set) do
		l[#l+1]=e
		end
		return "{"..table.concat( 1, ", ").."}"
end
function set.print(s)
	print(set.tostring(s))
end

s1=set.new{10,20,30,50}
s2=set.new{30,1}
print(getmetatable(s1))
print(getmetatable(s2))

-- mt. __add=set.union
-- s3=s1+s2
-- set.print(s3)

for i=1,10,1 do
    sum=1
	for j=i,1,-1 do
		sum=sum*j
	end
	print(sum)
end

io.write("hello world, from ",_VERSION,"!\n")




print("======-------==========-------========")
-- I/O库
-- 简单I/O模型
-- io.input(filename)调用会以只读模式打开指定的文件，并将其设为当前输入文件
io.write("sin(3) = ",math.sin(3),"\n")
--> sin (3) = 0.14112000805987
io.write(string.format("sin (3) = %.4f\n", math.sin(3)))
--> sin (3) = 0.1411
-- 在其他需要完全控制输出的地方使用write

print("hello", "Lua");print("Hi")
    --> hello Lua
    --> Hi
io.write("hello ", "Lua ");io.write("Hi", "\n")
    --> helloLuaHi

-- write在输出时不会添加像制表符或回车这样的额外字符
-- 其次，write使用当前输出文件，而print总是使用标准输出
-- 最后，print会自动调用其参数的tostring()方法，因此它还能显示table、函数和nil








-- ● 元表（metatable）与元方法（meatmethod）
--  Lua中的每个值都有一个元表。table和userdata可以有各自独立的元表，
-- 而其他类型的值则共享其类型所属的单一元表。Lua在创建新的table时不会创建元表：
print("----======------")
print(a)
function abs()
	a="string"
	local x12 = "flajdfl"
end
abs()
print(a)
print(x12)


-- 算术类的元方法
-- 如何使用元表,计算集合的并集和交集
local Set = {}
function Set.new(l)
	local set = {}
	setmetatable(set,mt)
	for _,v in ipairs(l)do set[v]=true end
	return set
end

function Set.union(a,b)
	local res = Set.new{}
	for k in pairs(a)do res[k]=true end
	for k in pairs(b)do res[k]=true end
	return res
end

function Set.intersection(a,b)
	local res = Set.new{}
	for k in pairs(a)do
		res[k]=b[k]
		end
	return res
end

function Set.tostring(set)
    local l = {}        -- 用于存放集合中所有元素的列表
    for e in pairs(set) do
        l[#l + 1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

function Set.print(s)
    print(Set.tostring(s))
end

-- 使用加号（+）来计算两个集合的并集
local mt = {}
s1 = Set.new{10,20,30,50}
s2 = Set.new{30,1}
print(getmetatable(s1))
print(getmetatable(s2))
mt.__add = Set.union
-- s1+s2
s3=Set.union(s1,s2)
Set.print(s3)

mt.__mul=Set.intersection
-- (s1 + s2)*s1
Set.print(Set.intersection(Set.union(s1,s2),s1))

Set.print(mt.__add(s1,s2))
Set.print(mt.__mul(mt.__add(s1,s2),s1))


mt.__le = function(a, b)        -- 集合包含
          for k in pairs(a) do
              if not b[k] then return false end
          end
          return true
       end

mt.__lt = function(a, b)
              return a<=b and not (b<=a)
          end
mt.__eq = function(a, b)
              return a <= b and b <= a
          end
s1 = Set.new{2, 4}
    s2 = Set.new{4, 10, 2}
    print(mt.__le(s1,s2))            -- true
    -- print(mt.__lt(s1,s2))            -- true
    -- print(s1 >= s1)            -- true
    -- print(s1 > s1)            -- false
    -- print(mt.__eq(s1,mt.__mul(s1,s2)))    -- true
print("===------=====------======")
for n in pairs(_G)do print(n)end
print("===------=====------======")