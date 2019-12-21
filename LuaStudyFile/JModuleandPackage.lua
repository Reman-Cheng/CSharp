--===Lua 模块与包===--


-- 模块类似于一个封装库，从 Lua 5.1 开始，Lua 加入了标准的模块管理机制，
-- 可以把一些公用的代码放在一个文件里，以 API 接口的形式在其他地方调用，有利于代码的重用和降低代码耦合度。

-- ==require 函数
-- Lua提供了一个名为require的函数用来加载模块。要加载一个模块，只需要简单地调用就可以了
-- require("<模块名>") 或者 require "<模块名>"

-- 执行 require 后会返回一个由模块常量或函数组成的 table，并且还会定义一个包含该 table 的全局变量
-- test_module.lua 文件
-- module 模块为上文提到到 module.lua

require("module") 
print(mod.constant)
mod.func3()
-- 或者给加载的模块定义一个别名变量，方便调用
-- 别名变量 m
m = require("module")
print(m.constant)
m.func3()


--==加载机制

-- 对于自定义的模块，模块文件不是放在哪个文件目录都行，
-- 函数 require 有它自己的文件路径加载策略，它会尝试从 Lua 文件或 C 程序库中加载模块。

-- require 用于搜索 Lua 文件的路径是存放在全局变量 package.path 中，
-- 当 Lua 启动后，会以环境变量 LUA_PATH 的值来初始这个环境变量。
-- 如果没有找到该环境变量，则使用一个编译时定义的默认路径来初始化。

-- 当然，如果没有 LUA_PATH 这个环境变量，也可以自定义设置，在当前用户根目录下打开 .profile 文件
-- （没有则创建，打开 .bashrc 文件也可以），例如把 "~/lua/" 路径加入 LUA_PATH 环境变量里：
mymath=require("mymath")
mymath.add(10,20)
mymath.sub(30,20)
mymath.mul(10,20)
mymath.div(30,20)


--==C 包
-- Lua和C是很容易结合的，使用C为Lua写包。
-- 与Lua中写包不同，C包在使用以前必须首先加载并连接，在大多数系统中最容易的实现方式是通过动态连接库机制。
-- Lua在一个叫loadlib的函数内提供了所有的动态连接的功能。这个函数有两个参数:库的绝对路径和初始化函数。所以典型的调用的例子如下:
-- local path = "/usr/local/lua/lib/libluasocket.so"
-- local f = loadlib(path, "luaopen_socket")

-- loadlib函数加载指定的库并且连接到Lua，然而它并不打开库（也就是说没有调用初始化函数），
-- 反之他返回初始化函数作为Lua的一个函数，这样我们就可以直接在Lua中调用他。
-- 如果加载动态库或者查找初始化函数时出错，loadlib将返回nil和错误信息。
-- 我们可以修改前面一段代码，使其检测错误然后调用初始化函数：

-- local path = "/usr/local/lua/lib/libluasocket.so"
-- -- 或者 path = "C:\\windows\\luasocket.dll"，这是 Window 平台下
-- local f = assert(loadlib(path, "luaopen_socket"))
-- f()  -- 真正打开库


-- -- Method 1
-- require "printFormatter"
-- printFormatter.simpleFormat("test")

-- -- Method 2
-- local formatter = require "printFormatter"
-- formatter.simpleFormat("test")

-- -- Method 3
-- require "printFormatter"
-- local formatterFunction = printFormatter.simpleFormat
-- formatterFunction("test")


-- test_module2.lua 文件
-- module 模块为上文提到到 module.lua
-- 别名变量 m
local m = require("module")
print(m.constant)
m.func3()




-- 模块与包  require函数
local m = require "io"
m.write("hello word\n")

function require1(name)
    if not package.loaded[name] then     -- 模块是否已加载？
        local loader = findloader(name)
        if loader == nil then
            error("unable to load module"..name)
        end
        package.loaded[name]=true    -- 将模块标记为已加载
        local res = loader[name]     -- 初始化模块
        if res ~=nil then
            package.loaded[name]=res
        end
    end
    return package.loaded[name]
end
-- 只要一个模块已加载过，后续的require调用都将返回同一个值，不会再次加载它

-- 如果模块尚未加载，require就试着为该模块找一个加载器（loader），会先在table package.preload中查询传入的模块名

-- require会用模块名来替换每个“?”，然后根据替换的结果来检查是否存在这样一个文件




myprint = function (param)
	print("This is my print function - ##",param,"##")
end
function add(num1,num2,functionPrint)
	result = num1 + num2
	functionPrint(result)
end
myprint(10)
add(2,5,myprint)


function average( ... )
	result = 0
	local arg = {...}
	for i,v in ipairs(arg) do
		result=result+v
	end
	return result/#arg
end

print("the average is",average(10,33,45,77))










--==编写模块的基本方法

-- 创建一个模块最简单的方法是：创建一个table，并将所有需要导出的函数放入其中，最后返回这个table

-- complex = {}
-- function complex.new(r,i) return {r=r,i=i}
-- end

-- complex.i=complex.new(0,1)
-- function complex.add(c1,c2)
--     return complex.new(c1.r+c2.r,c1.i+c2.i)
-- end
-- function complex.sub(c1,c2)
--     return complex.new(c1.r-c2.r,c1.i-c2.i)
-- end
-- function complex.mul(c1,c2)
--     return complex.new(c1.r*c2.r,c1.i*c2.i)
-- end
-- function complex.inv(c)
--     local n = c.r^2+c.i^2
--     return complex.new(c.r/n-c.i/n)
-- end
-- function complex.div(c1,c2)
--     return complex.mul(c1.r/c2.r,c1.i/c2.i)
-- end
-- return complex


-- module函数
-- module(..., package.seeall)
-- 开头有了这句调用后，后续所有的代码都可以像普通的Lua代码那样编写了。不需要限定模块名和外部名字，同样也不需要返回模块table





print(math.abs(-16))--取绝对值
print(math.ceil(5.8))--不小于x的最大整数 向上取整数
print(math.floor(5,7))--不大于x的最大整数 向下取整数
print(math.ldexp(10.0, 3))--计算value * 2的n次方
print(math.max(2.71, 100, -98, 23))--取得参数中最大值
print(math.min(2.71, 100, -98, 23))--取得参数中最大值
print(math.modf(15.98))--把数分为整数和小数
-- math.randomseed(os.time(100))
-- print(math.random(1, 100) )
print(math.sqrt(16))



game=require ("game")
game.play()

local t = io.write("sin (3) = ", math.sin(3), "\n")
print(t)
print("hello","Lua")
print("Hi")
-- 注：Write函数与print函数不同在于，write不附加任何额外的字符到输出中去，例如制表符，换行符等等。
-- 还有write函数是使用当前输出文件，而print始终使用标准输出。
-- 另外print函数会自动调用参数的tostring方法，所以可以显示出表（tables）函数（functions）和nil。

-- read函数:从当前输入文件读取串，由它的参数控制读取的内容：
-- "*all" 读取整个文件
-- "*line" 读取下一行
-- "*number" 从串中转换出一个数值
-- mum 读取num个字符串

--io.read 从标准输入流中获得，默认设置下，就是你的屏幕输入
-- t = io.read("*all")
-- t = string.gsub(t, ...) -- do the job
-- io.write(t) -- write the


--读操作
-- file = io.open("testRead.txt", "r")
-- for line in file:lines() do
--     print(line)
-- end
-- file:close()

--写操作
file = io.open("testRead.txt","a+")
file:write("\nhello")
file:close()


function show1()
    print("hello============world")
    print(add2(1.0,2.0))
    print(sub2(20.1,19))
    print(l_sin(1))
end
-- show1()




-- Lua 常用数据结构
a = {}
for i = 1,100 do
    a[i] = i
end
print("The length of array 'a' is " .. #a)

squares = {1, 4, 9, 16, 25}
print("The length of array 'a' is " .. #squares)



local N = 3
local M = 3
mt={}
for i=1,N do
    mt[i]={}
    for j=1,M do
        mt[i][j]=i*j
        io.write(mt[i][j])
    end
end
-- for i,v in pairs(mt)do
--  io.write(i,for i in pairs(mt[i])do
--      print(i)end)
-- end
print("\n")
mt={}
for i=1,N do
    for j=1,M do
        mt[(i-1)*M+j]=i*j 
    end
end
for i in pairs(mt)do
    io.write(i)
end


list = nil
for i = 1, 10 do
    list = {value = i,next = list }
end

local l = list
while l do 
    print(l.value)
    l = l.next
end

-- 队列与双向队列
List = {}

--创建
function List.new()
    return {first = 0,last = -1}
end

--队列头插入
function List.pushFront(list,value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end

--队列尾插入
function List.popFront(list)
    local first = list.first
    if first > list.last then
        error("List is empty")
    end

    local value = list[first]
    list[first] = nil
    list.first = first + 1
    return value
end

function List.popBack(list)
    local last = list.last
    if list.first > last then
        error("List is empty")
    end
    local value = list[last]
    list[last] = nil
    list.last = last - 1 
    return value
end

--测试代码
local testList = {first = 0,last = -1}
local tableTest = 12

List.pushFront(testList,tableTest)
print( List.popFront(testList))


-- 五、栈
-- 简单实现堆栈功能，代码如下：

local stackMng = {}
stackMng.__index = stackMng

function stackMng:new()
    local temp = {}
    setmetatable(temp,stackMng)
    return temp
end

function stackMng:init()
    self.stackList = {}
end

function stackMng:reset()
    self:init()
end

function stackMng:clear()
    self.stackList = {}
end

function stackMng:pop()
    if #self.stackList == 0 then
        return
    end
    if self.stackList[1] then
        print(self.stackList[1])
    end

    return table.remove(self.stackList,1)
end

function stackMng:push(t)
    table.insert(self.stackList,t)
end

function stackMng:Count()
    return #self.stackList
end

--测试代码
object = stackMng:new()
object:init()
object:push(1)
object:pop()



-- 在Lua中用table实现集合是非常简单的，见如下代码：
reserved = {
["while"] = true, ["end"] = true,
["function"] = true, ["local"] = true,
}

for k,v in pairs(reserved) do
    print(k,"->",v)
end



-- 迭代
local function enum(array)
        local index = 1
        return function()
            local ret = array[index]
            index = index + 1
            return ret
        end
    end

local function foreach(array,action)
    for element in enum(array)do
        action(element)
    end
end

foreach({1,2,3},print)


 --线程
    local function producer()
        return coroutine.create(
        function(salt)
            local t = {1,2,3}
            for i = 1,#t do
                salt = coroutine.yield(t[i] + salt)
            end
        end
        )
    end

    function consumer(prod)
        local salt = 10
        while true do
            local running ,product = coroutine.resume(prod, salt)
            salt = salt*salt
            if running then
                print(product or "END!")
            else
                break
            end
        end
    end

    consumer(producer())