print("----====查找并删除table中的指定元素值====----")
tabletest = {13,66,88,99}
function removetable1(tabletest)
  for i,v in ipairs(tabletest)do
	if tabletest[i]==88 then
		-- table.remove(tabletest,i)
		return i
	end

  end
end

local i = removetable1(tabletest)
print(i,tabletest[i],tabletest[i+1],type(i))
table.remove(tabletest,i)
for i,v in ipairs(tabletest)do
	print(i,v)
end


tabletest = {13,66,"string","99s"}
function removetable1(tabletest)
  for i,v in ipairs(tabletest)do
	if v=="string" then
		-- table.remove(tabletest,i)
		-- tabletest[i]=nil
		return i
	end

  end
end

local i = removetable1(tabletest)
-- print(i,tabletest[i],tabletest[i+1],type(i))
table.remove(tabletest,i)
for i,v in ipairs(tabletest)do
	print(i,v)
end

--删除带k值的table中某个特点的值
tabletest = {a="string",b="banana",c="orange",d="apple"}
function removetable1(tabletest)
  for k,v in pairs(tabletest)do
	if v=="orange" then
		print(type(k),k,tabletest[k])
		-- return k
		--k为string类型，则用table[k]
		tabletest[k] = nil
	end
	print(k,v)
  end
end

local k = removetable1(tabletest)
print(k,tabletest.k,type(k))
-- table.remove(tabletest,k)
for k,v in pairs(tabletest)do
	print(k,v)
end



Shape = {area = 0}
--self为Shape的对象，也是一个table
function Shape:new(o,side)
	o = o or {}
	setmetatable(o,self)
	--self就等于Shape
	self.__index = self
	side = side or 0
	self.area = side*side
	return o
end
function Shape:printArea()
	print("the area is:"..self.area)
end
myshape = Shape:new(nil,15)
myshape:printArea()


Square = Shape:new()
function Square:new(o,side)
	o = o or Shape:new(o,side)
	-- o 是继承了shape中的new中的所有东西，self为o 的新元表可以添加新的东西
	-- o = o or Shape:new(o)
    setmetatable(o,self)
    self.__index=self
    -- self.area = side*side
    self.vrea = side*side*side
    return o
end
function Square:printArea()
	print("the Square area is:"..self.area,self.vrea)
end
mySquare = Square:new(nil,13)
mySquare:printArea()


Rectangle = Shape:new()
function Rectangle:new(o,len,wid)
	o = o or Shape:new(o)
    setmetatable(o,self)
    self.__index=self
    self.area = len*wid
    return o
end
function Rectangle:printArea()
	print("the Square area is:"..self.area)
end

myRectangle = Rectangle:new(nil,19,18)
myRectangle:printArea()


local a = {1,x=2,c="string",["hello"]="world"}
print(a[1],a.x,a.c,a["hello"],a[x])

print("----====查找并增加指定元素值到table中的====----")
table1 = {3,66,88,4,87}
function insertTable1(table1)
	for k,v in ipairs(table1)do
		if v==4 then
			table.insert(table1,k+1,62)
		end
	end
end
insertTable1(table1)
for k,v in ipairs(table1)do
	print(k,v)
end


table2 = {a="string",b="bring",c="cb",d="function end"}
--字典型不用管顺序，直接添加
table2["e"]="find the sum"
function insertTable1(table2)
	-- for k,v in pairs(table2)do
	-- 	if k=="" then
			table.insert(table2,k+1,62)
	-- 	end
	-- end
end
-- insertTable1(table2)
for k,v in pairs(table2)do
	print(k,v)
end


print("----====查找并更改table中的指定元素值====----")



local function tabletostring(value,indent,vmap)
	  local str = ""
	  indent =indent or ""
	  vmap = vmap or {}

	  if(type(value)~= "table")then
	  	if(type(value)=="string")then
	  		str =string.format("[[%s]]",value)
	  	else
	  		str = tostring(value)
	  	end
	  else
	  	if type(vmap) == "table" then
	  		if vmap[value]then
	  			return"("..tostring(value)..")"
	  		end
	  	vmap[value] =true
	  	end
	  	local x = 1
	  end
end


print("----====用 rawset 函数在相同的表（主表）中更新键值，而不再是将新的键添加到另外的表中====----")
mymetatable = {}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })
print(mytable.key1)
mytable.newkey = "new value 2"
print(mytable.newkey,mymetatable.newkey)
mytable.key1 = "new  value 1"
print(mytable.key1,mymetatable.newkey1)

print("----====对比两个输出一个将新键添加到另外的表中，下面的将新键添加到主表中====----")
mytable = setmetatable({key1 = "value1"},{__newindex = function(mytable,key,value)
	  rawset(mytable,key,"\""..value.."\"")
end})
mytable.key1 = "new value"
mytable.key2 = 4
print(mytable.key1,mytable.key2)


print("----====使用 __call 可以使表具有像函数一样可调用的特性====----")
mytable = setmetatable({10},{__call = function(mytable,newtable)
	 sum = 0
	 for i,v in ipairs(mytable) do
	 	sum = sum + mytable[i]
	 end
	 for i,v in ipairs(newtable) do
	 	sum = sum + newtable[i]
	 end
	 return sum
end})
secondtable = {15,20,60}
print(mytable(secondtable))


print("----====改变 print 语句的行为====----")
mytable = setmetatable({10,20,30},{
	__tostring = function(mytable)
		sum =  0
		for i,v in ipairs(mytable) do
			sum = sum + mytable[i]
		end
		return "the sum of values in the table is "..sum
	end
	})
print(mytable)


-- 使用 pcall(f,arg1,...) 函数可以使用保护模式调用一个函数
function myfunction ()
   n = n/nil
end

if pcall(myfunction) then
   print("Success")
else
    print("Failure")
end


-- xpcall(f,err(这是错误处理方法)) 函数调用函数 f 同时为其设置了错误处理方法 err，并返回调用函数的状态
function myfunction ()
   n = n/nil
end

function func(err)
   print( "GET ERROR:", err )
end

status = xpcall(myfunction,func)
print( status)


print("----====每个对象都有独立的内存区域====----")







































































