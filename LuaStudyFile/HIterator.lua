--===Lua 迭代器===--


-- 迭代器（iterator）是一种对象，它能够用来遍历标准模板库容器中的部分或全部元素，每个迭代器对象代表容器中的确定的地址
-- 在Lua中迭代器是一种支持指针类型的结构，它可以遍历集合的每一个元素。

-- ==泛型 for 迭代器
-- 泛型 for 在自己内部保存迭代函数，实际上它保存三个值：迭代函数、状态常量、控制变量。
-- 泛型 for 迭代器提供了集合的 key/value 对，语法格式如下
array = {"Lua", "Tutorial"}
for key,value in ipairs(array) 
do
   print(key, value)
end


-- ==无状态的迭代器
-- 每一次迭代，迭代函数都是用两个变量（状态常量和控制变量）的值作为参数被调用，
-- 一个无状态的迭代器只利用这两个值可以获取下一个元素。

-- 这种无状态迭代器的典型的简单的例子是ipairs，它遍历数组的每一个元素
function square(iteratorMaxCount,currentNumber)
   if currentNumber<iteratorMaxCount
   then
      currentNumber = currentNumber+1
   return currentNumber, currentNumber*currentNumber
   end
end

for i,n in square,3,0
do
   print(i,n)
end


a={"one","two","three"}
for i,v,t,z in ipairs(a)do
  print(i,v,t,z)
end

-- 迭代的状态包括被遍历的表（循环过程中不会改变的状态常量）和当前的索引下标（控制变量），
-- ipairs和迭代函数都很简单，我们在Lua中可以这样实现
print("--===--===--===a")
local a = {{a=1},{b="55"}}
for i,v in ipairs(a)do
  print(i,v)
end
print(a[#a].b)


function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
       return i, v
    end
end
function ipairs (a)
    return iter, a, 0
end
-- 当Lua调用ipairs(a)开始循环时，他获取三个值：迭代函数iter、状态常量a、控制变量初始值0；
-- 然后Lua调用iter(a,0)返回1,a[1]（除非a[1]=nil）；第二次迭代调用iter(a,1)返回2,a[2]……直到第一个nil元素


-- ==多状态的迭代器
-- 所有的状态信息封装到table内，将table作为迭代器的状态常量，
-- 因为这种情况下可以将所有的信息存放在table内，所以迭代函数通常不需要第二个参数。

array = {"Lua", "Tutorial"}

function elementIterator (collection)
   local index = 0
   local count = #collection
   -- 闭包函数
   return function ()
      index = index + 1
      if index <= count
      then
         --  返回迭代器的当前元素
         return collection[index]
      end
   end
end

for element in elementIterator(array)
do
   print(element)
end




-- die dai qi yu closure
function values(t)
  local i = 0
  return function ()
  i =i+1;
  return t[i]
  end
end

t={10,20,40}
iter = values(t)
while true do
  local element = iter()
  if element == nil then
    break end
    print(element)
    end
-- 数字迭代器

for element in values(t) do
  print(element)
  end
-- 泛型迭代器
function allwords1()
  local line = io.read()
  local pos = 1
  return function ()
    while line do
      local s,e = string.find(line,"%w+",pos)
      if s then
        pos = e+1
        return string.sub(line,s,e)
        else
          line=io.read()
          pos=1
        end
        end
        return nil
  end
end

-- for word in allowords1() do
--  print(word)
-- end


local function iter(a,i)
  -- body
  i=i+1
  local v = a[i]
  if v then
    return i,v
    end
end
-- function ipairs(a)
--  -- body
--  return iter,a,0
-- end
-- function pairs(t)
--  return next,t,nil
-- end
-- pairs的基本函数是next，ipairs的基本函数是iter

local function getnext(list,node)
  if not node then
    return list
  else
    return node.next
    end
end

function traverse(list)
  return getnext,list,nil
end


-- list=nil
-- for  line in io.lines() do
--  list = {val=line,next=list}
-- end
-- for node in traverse(list) do
--  print(node.val)
-- end


-- local iterator
-- function allwords()
--  local state = {line=io.read(),pos=1}
--  return iterator,state
-- end
-- function iterator(state)
--  while state.line do
--    local s,e = string.find(state.line,"%w+",state.pos)
--  if s then
--    state.pos=e+1
--    return string.sub(state.line,s,e)
--  else
--    state.line=io.read()
--    state.pos=1
--    end
--    end
--    return nil
-- end

-- 真正的迭代器
function allwords(f)
    for line in io.lines() do
      -- 截取数字和字母
      for word in string.gmatch(line,"%w+") do
        f(word)
        end
    end
end
-- allwords(print) -- 传入函数print或其他函数



tab1 = { key1 = "val1", key2 = "val2" }
print("=====next======",next(tab1,key1))
tab2 = { "val1", "val2" }
print("======iter=====",iter(tab2,1))


function allwords(f)
  for line in io.lines()do
    for word in string.gmatch(line,"%w+")do
      f(word)
    end
  end
end
-- allwords(print)

-- local iterator
-- function allwords()
--  local state = {line=io.read(),pos=1}
--  return iterator,state
-- end

-- function iterator(state)
--  while state.line do
--    local s,e = string.find(state.line,"%w+",state.pos)
--    if s then
--      state.pos=e+1
--      return string.sub(state.line,s,e)
--      else
--        state.line=io.read()
--        state.pos =1
--  end
-- end
-- return nil
-- end


-- function allwords(f)
--  for line in io.lines() do
--    for word in string.gmatch(line,"%w+") do
--      f(word)
--      end
--      end
--  -- body
-- end

-- allwords(print)

-- -- ji suan hello chu xian ci shu
-- local  count = 0
-- allwords(function (w)
--  if w == "hello" then count =count+1 end
--  end)
-- print(count)

-- -- huo yong 
-- local count = 0
-- for w in allwords() do
--  if w =="hello" then count=count+1 end
--  end
-- print(count)

-- -- 编译，自信与错误
-- function  dofile(filename)
--  local f = assert(loadfile(filename))
--  return f()
-- end









str1 =  "123 h123 hds45678 fdaga123ad  h 123 s"
for i in string.gmatch(str1,"%D%d+%D")do
  print(i)
end
print("------==============")
for i in string.gmatch(str1,"%f[%A]%d+%f[%s]")do
  print(i)
end
print("------==============")
for i in string.gmatch(str1,"[%A]")do
  print(i)
end


-- •迭代器与范型for
-- 如何利用泛型for的各种能力来编写更简单、更有效的迭代器

-- • 迭代器与closure
print("------==============")
function values(t)
  local i = 0
  return function()
    i=i+1
    return t[i]
  end
end
t = { 10, 20, 30 }


for element in values(t) do
    print( element )
end


function allwords()
        -- local line = io.open("testRead.txt","r")    -- 当前行
        local pos = 1             -- 一行中的当前位置
        return function()         -- 迭代器函数
            while line do         -- 若为有效的行内容就进入循环
                local s, e = string.find(line, "%w+", pos)
                if s then         -- 是否找到一个单词
                    pos = e + 1   -- 该单词的下一个位置
                    return string.sub(line, s, e)    -- 返回该单词
                else
                    -- line = io.read()    -- 没有找到单词，尝试下一行
                    pos = 1             -- 在第一个位置上重新开始
                end
            end
            return nil                  -- 没有其余行了，遍历结束
        end
    end
-- for word in allwords() do
--         print(word)
--     end


-- • 泛型for的语义 pairs()
-- 泛型for在循环过程内部保存了迭代器函数。实际上它保存着3个值：一个迭代器函数、一个恒定状态和一个控制变量
-- for做的第一件事情是对in后面的表达式求值。这些表达式应该返回3个值供for保存：迭代器函数、恒定状态和控制变量的初值

-- • 无状态的迭代器 ipairs()
-- 在每次迭代中，for循环都会用恒定状态和控制变量来调用迭代器函数。一个无状态的迭代器可以根据这两个值来为下次迭代生成下一个元素
local function iter(a, i)
        i = i + 1
        local v = a[i]
        if v then
            return i, v
        end
    end

    function ipairs(a)
        return iter, a, 0
    end
    a={"one","1",67}
for i,v in ipairs(a)do
  print(i,v)
end

-- 函数pairs与ipairs类似，也是用于遍历一个table中的所有元素。不同的是，它的迭代器函数是Lua中的一个基本函数next
print("---------=====-----------")
function pairs(t)
    return next, t, nil
end
-- 不通过pairs调用而直接使用next
for i,v in next,a,nil do
  print(i,v)
end



-- 遍历链表的迭代器
-- 链表的实现
    node = {}
    head = node

   -- 初始化
    function init(v)
        node.val = v
    end

   -- 在尾部插入
    function push_back(v)
        node.next = {val = v}
        node = node.next
    end

    init(10)
    push_back(8)
    push_back(6)

    -- 迭代器函数
    local function getnext(list, node)
        if node then
            return node.next
        else
            return list
        end
    end

    function traverse( list )
        return getnext, list, nil
    end

    for v in traverse(head) do
        print( v.val )
    end