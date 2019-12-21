--===Lua table(表)===--


-- table 是 Lua 的一种数据结构用来帮助我们创建不同的数据类型，如：数组、字典等。
-- Lua table 使用关联型数组，你可以用任意类型的值来作数组的索引，但这个值不能是 nil。
-- Lua table 是不固定大小的，你可以根据自己需要进行扩容。
-- Lua也是通过table来解决模块（module）、包（package）和对象（Object）的。 例如string.format表示使用"format"来索引table string。


-- ==table(表)的构造
-- 初始化表
mytable = {}
-- 指定值
mytable[1]= "Lua"
-- 移除引用
mytable = nil
-- lua 垃圾回收会释放内存

-- 当我们为 table a 并设置元素，然后将 a 赋值给 b，则 a 与 b 都指向同一个内存。如果 a 设置为 nil ，
-- 则 b 同样能访问 table 的元素。如果没有指定的变量指向a，Lua的垃圾回收机制会清理相对应的内存。

-- 简单的 table
mytable = {}
print("mytable 的类型是 ",type(mytable))

mytable[1]= "Lua"
mytable["wow"] = "修改前"
print("mytable 索引为 1 的元素是 ", mytable[1])
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- alternatetable和mytable的是指同一个 table
alternatetable = mytable

print("alternatetable 索引为 1 的元素是 ", alternatetable[1])
print("mytable 索引为 wow 的元素是 ", alternatetable["wow"])

alternatetable["wow"] = "修改后"

print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- 释放变量
alternatetable = nil
print("alternatetable 是 ", alternatetable)

-- mytable 仍然可以访问
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

mytable = nil
print("mytable 是 ", mytable)


-- ==Table 操作
-- 1.table.concat (table [, sep [, start [, end]]]):
-- concat是concatenate(连锁, 连接)的缩写. 
-- table.concat()函数列出参数中指定table的数组部分从start位置到end位置的所有元素, 元素间以指定的分隔符(sep)隔开。

-- 2.table.insert (table, [pos,] value):
-- 在table的数组部分指定位置(pos)插入值为value的一个元素. pos参数可选, 默认为数组部分末尾

-- 3.table.maxn (table)
-- 指定table中所有正数key值中最大的key值. 如果不存在key值为正数的元素, 则返回0

-- 4.table.remove (table [, pos])
-- 返回table数组部分位于pos位置的元素. 其后的元素会被前移. pos参数可选, 默认为table长度, 即从最后一个元素删起

-- 5.table.sort (table [, comp])
-- 对给定的table进行升序排序
-- ==Table 连接
fruits = {"banana","orange","apple"}
-- 返回 table 连接后的字符串
print("连接后的字符串 ",table.concat(fruits))

-- 指定连接字符
print("连接后的字符串 ",table.concat(fruits,", "))

-- 指定索引来连接 table
print("连接后的字符串 ",table.concat(fruits,", ", 2,3))

-- ==插入和移除
fruits = {"banana","orange","apple"}

-- 在末尾插入
table.insert(fruits,"mango")
print("索引为 4 的元素为 ",fruits[4])

-- 在索引为 2 的键处插入
table.insert(fruits,2,"grapes")
print("索引为 2 的元素为 ",fruits[2])

print("最后一个元素为 ",fruits[5])
table.remove(fruits)
print("移除后最后一个元素为 ",fruits[5])

-- ==Table 排序
fruits = {"banana","orange","apple","grapes"}
print("排序前")
for k,v in ipairs(fruits) do
    print(k,v)
end

table.sort(fruits)
print("排序后")
for k,v in ipairs(fruits) do
    print(k,v)
end

-- ==Table 最大值
function table_maxn(t)
  local mn=nil;
  for k, v in pairs(t) do
    if(mn==nil) then
      mn=v
    end
    if mn < v then
      mn = v
    end
  end
  return mn
end
tbl = {[1] = 2, [2] = 6, [3] = 34, [26] =5}
print("tbl 最大值：", table_maxn(tbl))
print("tbl 长度 ", #tbl)
-- 当我们获取 table 的长度的时候无论是使用 # 还是 table.getn 
-- 其都会在索引中断的地方停止计数，而导致无法正确取得 table 的长度。可以使用以下方法来代替：
function table_leng(t)
  local leng=0
  for k, v in pairs(t) do
    leng=leng+1
  end
  return leng;
end




-- 1  table.concat (table [, sep [, i [, j]]])  根据给定的参数连接表中的字符串。
-- 2  table.insert (table, [pos,] value)  在指定位置的表中插入值。
-- 3  table.maxn (table)  返回最大的数字索引。
-- 4  table.remove (table [, pos])  从表中删除值。
-- 5  table.sort (table [, comp]) 根据可选的比较器参数对表进行排序。


-- 使用concat函数来连接两个表，如下所示
fruits = {"banana","orange","apple"}
print("Concatenated string ",table.concat(fruits))
print("Concatenated string ",table.concat(fruits," "))
print("Concatenated string ",table.concat(fruits,", ", 2,3))

-- 插入和删除
fruits = {"banana","orange","apple"}
-- insert a fruit at the end
table.insert(fruits,"mango")
print("Fruit at index 4 is ",fruits[4])

--insert fruit at index 2
table.insert(fruits,2,"grapes")
print("Fruit at index 2 is ",fruits[2])

-- print("The maximum elements in table is",table.maxn(fruits))

print("The last element is",fruits[5])

table.remove(fruits)
print("The previous last element is",fruits[5])

-- 排序表
fruits = {"banana","orange","apple","grapes"}
for k,v in ipairs(fruits) do
   print(k,v)
end

table.sort(fruits)
print("sorted table")

for k,v in ipairs(fruits) do
   print(k,v)
end




-- 1  table.concat (table [, step [, start [, end]]]):
-- concat是concatenate(连锁, 连接)的缩写. table.concat()函数列出参数中指定table的数组部分从start位置到end位置的所有元素, 元素间以指定的分隔符(sep)隔开。

-- 2  table.insert (table, [pos,] value):
-- 在table的数组部分指定位置(pos)插入值为value的一个元素. pos参数可选, 默认为数组部分末尾.

-- 3  table.maxn (table)
-- 指定table中所有正数key值中最大的key值. 如果不存在key值为正数的元素, 则返回0。(Lua5.2之后该方法已经不存在了,本文使用了自定义函数实现)

-- 4  table.remove (table [, pos])
-- 返回table数组部分位于pos位置的元素. 其后的元素会被前移. pos参数可选, 默认为table长度, 即从最后一个元素删起。

-- 5  table.sort (table [, comp])
-- 对给定的table进行升序排序。


fruits = {"banana","orange","apple"}
-- 返回 table 连接后的字符串
print("连接后的字符串 ",table.concat(fruits,"..",2,3))

table.insert(fruits,2,"mango")
print("索引为 2 的元素为 ",fruits[2])
for k,v in ipairs(fruits) do
  print(k,v)
end
table.sort(fruits)
print("排序后")
for k,v in ipairs(fruits) do
   print(k,v)
end


-- table.maxn 在 Lua5.2 之后该方法已经不存在了，我们定义了 table_maxn 方法来实现
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end
tbl = {[1] = "a", [2] = "b", [3] = "c", [26] = "z"}
print("tbl 长度 ", #tbl)
print("tbl 最大值 ", table_maxn(tbl))


require "module"
print(mod.constant)
mod.func3()

-- 给加载的模块定义一个别名变量，方便调用：
local m = require("module")
print(m.constant)
m.func3()


-- local path = "/usr/local/lua/lib/libluasocket.so"
-- -- 或者 path = "C:\\windows\\luasocket.dll"，这是 Window 平台下
-- local f = assert(loadlib(path, "luaopen_socket"))
-- f()  -- 真正打开库



-- 串行化
function serialize(o)
  if type(o) == "number" then
    io.write(o)
  elseif
    type(o) == "string"then
    io.write(string.format("%q",o))
  else
    print("something is not number and string")
  end
end
if type(o) == "string"then
  io.write("'",o,"'")
end

-- %q   string.format("%q",a) 接受一个字符串并将其转异为可安全被Lua编译器读入的格式，包括双引号换行符等其他特殊字符
a='a"problematic"\\string'
serialize(a)
print("\n"..string.format("%q",a))


-- 另一种安全括住任意字符串的方法[=[...]=],用于长字符串，但是%q更加方便
-- 必须使用真确的数量等号，要比字符串中出现的最长等号序列还大1
-- lua会忽略所有长字符串开头的换行符，要在字符串起史处添加换行符
function quote(s)
  local n = 1
  for w in string.gmatch(s,"]=*") do
    n=math.max(n,#w-1)
    end
    local eq = string.rep("=",n+1)
    return string.format("[%s[\n%s]%s]",eq,s,eq)
end
local s=[=["...os.execute('rm *').."]=]
quote(s)



-- 保存无环的table
function serializeuntable(o)
  if type(o)=="number"then
    io.write(o)
  elseif type(o) =="string"then
    io.write(string.format("%q",o))
  elseif type(o) =="table" then
    io.write("{\n")
    for  k,v in pairs(o) do
      io.write(" ",k," = ")
      serializeuntable(v)
      io.write(",\n")
    end
    io.write("}\n")
  else
    error("cannot serializeuntable a"..type(o))
  end
end
function serializeuntable2(o)
  if type(o)=="number"then
    io.write(o)
  elseif type(o) =="string"then
    io.write(string.format("%q",o))
  elseif type(o) =="table" then
    io.write("{\n")
    for  k,v in pairs(o) do
      io.write(" [");serializeuntable2(k);io.write("] = ")
      serializeuntable2(v)
      io.write(",\n")
    end
    io.write("}\n")
    else
      error("cannot serializeuntable2 a"..type(o))
    end
end
table1={a=14,b="lua",c="another \"one\""}
serializeuntable(table1)
serializeuntable2(table1)


-- 有环的table，要用拓扑结构
function basicSerialize(o)
  if type(o)=="number" then
    return tostring(o)
  else
    return string.format("%q",o)
  end
end

function save(name,value,saved)
  saved=saved or {}
  io.write(name," = ")
  if type(value)=="number" or type(value)=="string" then
    io.write(basicSerialize(value),"\n")
  elseif type(value) == "table" then
    if saved[value] then
      io.write(saved[value],"\n")
    else
      saved[value]=name
      io.write("{}\n")
      for k,v in pairs(value)do
        k=basicSerialize(k)
        local fname = string.format("%s[%s]",name,k)
        save(fname,v,saved)
      end
    end
  else
    error("cannot save a "..type(value))
    end
end
a={x=1,y="adfa",{3,"saf","fan\"n\""}}
a[2]=a
a.z=a[1]
save("a",a)
b={k=a[1]}
save("b",b)




-- 弱引用table
a = {}
b = {__mode = 'k'}
setmetatable(a, b)    -- 现在'a'的key就是弱引用
key = {}              -- 创建第一个key
a[key] = 1
key = {}              -- 创建第二个key
a[key] = 2
collectgarbage()      -- 强制进行一次垃圾收集
for k, v in pairs(a) do print(v) end
--> 2







-- 插入和删除
local t = {10,20,30}
table.insert(t,1,15)
-- 调用insert时没有指定位置参数，则会将元素添加到数组末尾
table.insert(t,15)
for i,v in ipairs(t) do
  print(i,v)
end
print("=====-------========")
table.remove(t,1)
table.remove(t)
for i,v in ipairs(t) do
  print(i,v)
end


-- 排序
local lines = {
  lua_set = 10,
  lua_get = 24,
  lua_present = 48,
}
table.sort(lines)
for i,v in pairs(lines) do
  print(i,v)
end
print("=====-------========")
local a = {}
for n in pairs(lines) do a[#a+1] = n end
table.sort(a)
for i,n in ipairs(a) do print(n) end
print("=====-------========")

-- 可选参数f，用于指定某种特殊次序
function pairsByKeys(t, f)
        local a = {}
        for n in pairs(t) do a[#a+1] = n end
        table.sort(a, f)
        local i = 0          -- 迭代器变量
        return function()    -- 迭代器函数
            i = i + 1
            return a[i], t[a[i]]
        end
    end
for name,line in pairsByKeys(lines)do
  print(name,line)
end


-- 连接 
-- table.concat( tablename, ", ", start_index, end_index )它接受一个字符串数组，
-- 并返回这些字符串连接后的结果。它有一个可选参数，用于指定插到字符串之间的分隔符
function rconcat(l)
  if type(l)~="table" then return l end
  local res = {}
  for i=1,#l do
    res[i]=rconcat(l[i])
  end
  return table.concat(res)
end
print(rconcat{{"a", {" nice"}}, " and", {{" long"}, {" list"}}})













-- 数据文件与持久性

Entry1={"Donald E.Knuth","Literate Programming","CSLI",1992}

Entry2={ "Jon Bentley",
       "More Programming Pearls",
       "Addison-Wesley",
       1990}
-- 那个收集作者姓名的程序改为：

    local authors = {}         -- 作者姓名的集合
    function Entry(b) authors[b.author] = true end
    -- dofile("data")
    for name in pairs(authors) do print(name) end
function Entry(b)
        if b.author then authers[b.author] = true end
    end


-- 串行化（Serialization）
function serialize(o)
        if type(o) == "number" then
            io.write(o)
        elseif type(o) == "string" then
            io.write(string.format("%q", o))
        end
        end
serialize('a "problematic"\\string')
print("\n".."-----------=========------------")


-- ● 保存无环的table
function serialize1(o)
        if type(o) == "number" then
            io.write(o)
        elseif type(o) == "string" then
            io.write(string.format("%q", o)) 
        elseif type(o) == "table" then
            io.write("{\n")
            for k, v in pairs(o) do
                io.write(" ", k, " = ")
                serialize(v)
                io.write(",\n")
            end
            io.write("}\n")
        else
            error("cannot serialize a " .. type(o))
        end
    end
serialize1({a="fjls",3,b={4,h="fjla",f=3},d="ffi"})


-- local x = "a"
-- print(x)
-- print((x))
-- print(type(x))
-- print(type((x)))


function basicSerialize(o)
    if type(o) == "number" then
        return tostring(o)
    else             -- assume it is a string
        return string.format("%q", o)
    end
end
function save(name, value, saved)
    saved = saved or {}         -- 初始值
    io.write(name, " = ")
    if type(value) == "number" or type(value) == "string" then
        io.write(basicSerialize(value), "\n")
    elseif type(value) == "table" then
        if saved[value] then         -- 该value是否已保存过？
            io.write(saved[value], "\n")         -- 使用先前的名字
        else
            saved[value] = name         -- 为下次使用保持名字
            io.write("{}\n")             -- 创建一个新的table
            for k, v in pairs(value) do
                k = basicSerialize(k)
                local fname = string.format("%s[%s]", name, k)
                save(fname, v, saved)
            end
        end
    else
        error("cannot save a " .. type(value))
    end
end
save("a",{a="fjls",3,b={4,h="fjla",f=3},d="ffi"})











-- 打印数据
local function __tostring(value, indent, vmap)
    local str = ''
    indent = indent or ''
    vmap = vmap or {}

    --递归结束条件
    if (type(value) ~= 'table') then
        if (type(value) == 'string') then
            --字符串
            str = string.format("[[%s]]", value)
        else
            --整数
            str = tostring(value)
        end
    else
        if type(vmap) == 'table' then
            if vmap[value] then return '('..tostring(value)..')' end
            vmap[value] = true
        end

        local auxTable = {}     --保存元表KEY(非整数)
        local iauxTable = {}    --保存元表value
        local iiauxTable = {}   --保存数组(key为0)
        table.foreach(value, function(i, v)
            if type(i) == 'number' then
                if i == 0 then
                    table.insert(iiauxTable, i)
                else
                    table.insert(iauxTable, i)
                end
            elseif type(i) ~= 'table' then
                table.insert(auxTable, i)
            end
        end)
        table.sort(iauxTable)

        str = str..'{\n'
        local separator = ""
        local entry = "\n"
        local barray = true
        local kk,vv
        table.foreachi (iauxTable, function (i, k)
            if i == k and barray then
                entry = __tostring(value[k], indent..'  \t', vmap)
                str = str..separator..indent..'  \t'..entry
                separator = ", \n"
            else
                barray = false
                table.insert(iiauxTable, k)
            end
        end)
        table.sort(iiauxTable)

        table.foreachi (iiauxTable, function (i, fieldName)

            kk = tostring(fieldName)
            if type(fieldName) == "number" then 
                kk = '['..kk.."]"
            end 
            entry = kk .. " = " .. __tostring(value[fieldName],indent..'  \t',vmap)

            str = str..separator..indent..'  \t'..entry
            separator = ", \n"
        end)
        table.sort(auxTable)

        table.foreachi (auxTable, function (i, fieldName)

            kk = tostring(fieldName)
            if type(fieldName) == "number" then 
                kk = '['..kk.."]"
            end 
            vv = value[fieldName]
            entry = kk .. " = " .. __tostring(value[fieldName],indent..'  \t',vmap)

            str = str..separator..indent..'  \t'..entry
            separator = ", \n"
        end)

        str = str..'\n'..indent..'}'
    end

    return str
end

ccmlog = function(m,fmt,...)
    local args = {...}
    for k,arg in ipairs(args) do
        if type(arg) == 'table' 
            or type(arg) == 'boolean' 
            or type(arg) == 'function' 
            or type(arg) == 'userdata' then
            args[k] = __tostring(arg)
        end
    end

    args[#args+1] = "nil"
    args[#args+1] = "nil"
    args[#args+1] = "nil"
    local str = string.format("[%s]:"..fmt.." %s", m, unpack(args))
    print(str)

    local off = 1
    local p = CCLOGWARN 
    if m == 'error' then 
        p = CCLOGERROR 
    elseif m == 'warn' then 
        p = CCLOGWARN
    end
    while off <= #str do 
        local subStr = string.sub(str, off, off+1024)
        off = off + #subStr
        --p(subStr)
    end
end

--打印测试
reserved =  { [100] = { 300, 400}, 200, { 300, 500}, abc = "abc",[0] = {1,2,3,"abc"}}
-- ccmlog("d","d",reserved)