--===Lua 数组===--
-- 数组，就是相同数据类型的元素按一定顺序排列的集合，可以是一维数组和多维数组
-- Lua 数组的索引键值可以使用整数表示，数组的大小不是固定的


-- ==一维数组
-- 一维数组是最简单的数组，其逻辑结构是线性表。一维数组可以用for循环出数组中的元素
array={"lua","Tutorial"}

for i=0,2 do
	print(array[i])
end
-- 我们可以使用整数索引来访问数组元素，如果知道的索引没有值则返回nil,在 Lua 索引值是以 1 为起始，但你也可以指定 0 开始
array={}
for 
endi=-2,2 do
  array[i]=i*2
end
for i=-2,2 do
  print(array[i])


-- ==多维数组
-- 多维数组即数组中包含数组或一维数组的索引键对应一个数组
-- 以下是一个三行三列的阵列多维数组
-- 初始化数组
print("======++++++=======")
array = {}
for i=1,3 do
   array[i] = {}
      for j=1,3 do
         array[i][j] = i*j
      end
end

-- 访问数组
for i=1,3 do
   for j=1,3 do
      print(array[i][j])
   end
end


-- 初始化数组
array = {}
maxRows = 3
maxColumns = 3
for row=1,maxRows do
   for col=1,maxColumns do
      array[row*maxColumns +col] = row*col
   end
end

-- 访问数组
for row=1,maxRows do
   for col=1,maxColumns do
      print(array[row*maxColumns +col])
   end
end





array = {"Lua", "Tutorial"}
for i = 0, 2 do
   print(array[i])
end

array = {}

for i= -2, 2 do
   array[i] = i *2
end
for i = -2,2 do
   io.write(array[i].." ")
end
print("\n")

-- 初始化数组
array = {}
for i=1,3 do
   array[i] = {}
   for j=1,3 do
      array[i][j] = i*j
   end
end
-- 访问数组
io.write("{".."\n")
for i=1,3 do 
	io.write("{")
   for j=1,3 do
      io.write(array[i][j]..",")
   end
   print("}")
end
io.write("}".."\n")


-- 初始化数组
array = {}
maxRows = 3
maxColumns = 3
for row=1,maxRows do
   for col=1,maxColumns do
      array[row*maxColumns +col] = row*col
   end
end
-- 访问数组
for row=1,maxRows do
   for col=1,maxColumns do
      io.write(array[row*maxColumns +col]..",")
   end
end
print("\n")


array = {"Lua", "Tutorial"}

for key,value in ipairs(array) 
do
   print(key, value)
end


function square(iteratorMaxCount,currentNumber)

   if currentNumber<iteratorMaxCount
   then
      currentNumber = currentNumber+1
      return currentNumber, currentNumber*currentNumber
   end

end

function squares(iteratorMaxCount)
   return square,iteratorMaxCount,0
end  

for i,n in squares(3)
do 
   print(i,n)
end


array = {"Lua", "Tutorial"}

function elementIterator (collection)

   local index = 0
   local count = #collection

   -- The closure function is returned

   return function ()
      index = index + 1

      if index <= count
      then
         -- return the current element of the iterator
         return collection[index]
      end

   end

end

for element in elementIterator(array)
do
   print(element)
end




-- account = {balance = 0}
-- function account.withdraw(v)
-- 	account.balance = account.balance - v
-- end
-- account.withdraw(100.00)



account = {balance = 0}
function account.withdraw(self,v)
	self.balance=self.balance-v
end
a1=account;
account=nil
a1.withdraw(a1,100.00)


for i=1,9 do
	for j=1,9 do
		sum = i*j
		io.write(string.format("%2d",i).."*"..string.format("%2d",j).." = "..string.format("%.2d",sum).." ")
		-- print("\n")
	end
	print("\n")
end




-- 数据结构
-- ● 数组
local a = {}                -- 新建一个数组
for i = 1, 10 do
    a[i] = i
end
for i,v in ipairs(a)do
   print(i,v)
end


-- ● 矩阵与多维数组
local mt = {}
local n,m = 3,3
for i=1,n do
   mt[i]={}
   for j=1,m do
      mt[i][j]=i*j
   end
end
for i=1,n do
   print(table.unpack(mt[i]))
end


-- ● 队列与双向队列
-- 在Lua中实现队列的一种简单方法是使用table库的函数insert和remove
local List = {}
function List.new()
    return {first = 0, last = -1}
end
function List.pushfirst(list, value)
        local first = list.first - 1
        list.first = first
        list[first] = value
    end

    function List.pushlast(list, value)
        local last = list.last + 1
        list.last = last
        list[last] = value
    end

    function List.popfirst(list)
        local first = list.first
        if first > list.last then error("list is empty") end
        local value = list[first]
        list[first] = nil             -- 为了允许垃圾收集
        list.first = first + 1
        return value
    end

    function List.poplast(list)
        local last = list.last
        if list.first > last then error("list is empty") end
        local value = list[last]
        list[last] = nil             -- 为了允许垃圾收集
        list.last = last - 1
        return value
    end
-- for i=1,5 do
-- list.pushlast(List,i)
-- end
-- print(table.unpack(list))


-- ● 集合与无序组（bag）
reserved = {["while"] = true, ["end"] = true, ["function"] = true, ["local"] = true, }
-- for w in allwords() do
--     if not reserved[w] then
--         -- <对'w'作任意处理>          -- 'w'不是保留字
--         print("the string is not here")
--     end
-- end

-- 只不过包需要将一个计数器与table的key关联
function insert(bag, element)
    bag[element] = (bag[element] or 0) + 1
end
function remove(bag, element)
    local count = bag[element]
    bag[element] = (count and count > 1) and count - 1 or nil
end