-- 我们可以使用两个函数：assert 和 error 来处理错误
local function add(a,b)
   assert(type(a) == "number", "a 不是一个数字")
   assert(type(b) == "number", "b 不是一个数字")
   return a+b
end
add(10,5)
-- 实例中assert首先检查第一个参数，若没问题，assert不做任何事情；否则，assert以第二个参数作为错误信息抛出


-- error函数   语法格式：error (message [, level])
-- 功能：终止正在执行的函数，并返回message的内容作为错误信息(error函数永远都不会返回)

-- 通常情况下，error会附加一些错误位置的信息到message头部。

-- Level参数指示获得错误的位置:

-- Level=1[默认]：为调用error位置(文件+行号)
-- Level=2：指出哪个调用error的函数的函数
-- Level=0:不添加错误位置信息


-- pcall接收一个函数和要传递给后者的参数，并执行，执行结果：有错误、无错误；返回值true或者或false, errorinfo
pcall(function(i) print(i) end, 33)
pcall(function(i) print(i) error('error..') end, 33)

function f() return false,2 end
if f() then print '1' else print '0' end



-- pcall以一种"保护模式"来调用第一个参数，因此pcall可以捕获函数执行中的任何错误。

-- 通常在错误发生时，希望落得更多的调试信息，而不只是发生错误的位置。但pcall返回时，它已经销毁了调用桟的部分内容。

-- Lua提供了xpcall函数，xpcall接收第二个参数——一个错误处理函数，
-- 当错误发生时，Lua会在调用桟展开（unwind）前调用错误处理函数，于是就可以在这个函数中使用debug库来获取关于错误的额外信息了。

-- debug库提供了两个通用的错误处理函数:
-- debug.debug：提供一个Lua提示符，让用户来检查错误的原因
-- debug.traceback：根据调用桟来构建一个扩展的错误消息
-- xpcall(function(i) print(i) error('error..') end, function() print(debug.traceback()) end, 33)

-- function myfunction ()
--    n = n/nil
-- end

-- function myerrorhandler( err )
--    print( "ERROR:", err )
-- end

-- status = xpcall( myfunction, myerrorhandler )
-- print( status)


-- error (message [, level])
-- 功能：终止正在执行的函数，并返回message的内容作为错误信息(error函数永远都不会返回)
-- 通常情况下，error会附加一些错误位置的信息到message头部。
-- Level参数指示获得错误的位置:
-- Level=1[默认]：为调用error位置(文件+行号)
-- Level=2：指出哪个调用error的函数的函数
-- Level=0:不添加错误位置信息


-- Lua中处理错误，可以使用函数pcall（protected call）来包装需要执行的代码
-- pcall接收一个函数和要传递个后者的参数，并执行，执行结果：有错误、无错误；返回值true或者或false, errorinfo。

local a=pcall(function(i) print(i) end, 33)
print(a)

local a=pcall(function(i) print(i) error('error..') end, 33)
print(a)


-- Lua提供了xpcall函数，xpcall接收第二个参数——一个错误处理函数，当错误发生时，Lua会在调用桟展看（unwind）前调用错误处理函数，于是就可以在这个函数中使用debug库来获取关于错误的额外信息了。

-- debug库提供了两个通用的错误处理函数:
-- debug.debug：提供一个Lua提示符，让用户来价差错误的原因
-- debug.traceback：根据调用桟来构建一个扩展的错误消息
-- local a=xpcall(function(i) print(i) error('error..') end, function() print(debug.traceback()) end, 33)





-- pcall可以捕获函数执行的任何错误，错误会返回true及函数调用的返回值，否则返回false及错误信息
-- if pcall(function ()
-- 	<受保护的代码》
-- end)then
--     <常规代码>
-- else
-- 	<错误处理代码>
-- end



local status,err = pcall(function ()
	error({code=121})
end)
print(err.code)

local status,err = pcall(function ()
	a="a"+1
end)
print(err)

local status,err = pcall(function ()
	error("my error")
end)
print(err)


function foo(str)
	if type(str)~="string" then
		error("string expected",2)
		end
		print("foo")
end
-- string expected
-- foo({x=1})

-- debug.debug, 它提供lua提示符，让用户来检查错误的原因；另一个是debug.traceback,它会根据调用栈来构建一个扩张错误信息
-- print(debug.traceback())




-- 递归身材所有元素的排列
function permgen(a,n)
	n=n or #a
	if n<=1 then
		printResult(a)
	else
		for i=1,n do
			a[n],a[i]=a[i],a[n]
			permgen(a,n-1)
			a[n],a[i]=a[i],a[n]
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
print("=========permgen===========")


function permgen1(a,n)
	n=n or #a
	if n<=1 then
		coroutine.yield(a)
		else
		for i=1,n do
			a[n],a[i]=a[i],a[n]
			permgen1(a,n-1)
			a[n],a[i]=a[i],a[n]
		end
    end
end
function permutations(a)
	local  co = coroutine.create(function ()
		permgen1(a)
	end)
	return function ()
		local code,res = coroutine.resume(co)
		return res
		end
end
for p in permutations{"a","b","c"} do
	printResult(p)
end



-- require "socket"
-- host="www.w3.org"
-- file="/TR/REC-html32.html"
-- c=assert(socket.connect(host,80))
-- c:send("GET"..file.."HTTP/1.0\r\n\r\n")
-- while true do
-- 	local s,status,partial = c:receive(2^10)
--     io.write(s or partial)
--     if status== "closed" then break end
-- end


squares={}
for i=1,10 do
	squares[i]=i*i
	-- print(squares[i])
end
for i in pairs(squares) do
     print(squares[i])
end

print(squares)


mt={}
for i=1,4 do
	mt[i]={}
	for j=1,5 do
		mt[i][j]=6
		end
	end
print(mt[3][5])

for i in pairs(mt) do
	print(mt[i])
	end

function mult(a,rowindex,k)
   local row = a[rowindex]
   for i,v in pairs(row) do
   	row[i]=v*k
   	end
end

list=nil
list={next=list,value=v}
local l = list
while l do
	l=l.next
	end

list={a="a",b="b"}
print(list.a)
print(list["a"])


function list.pushfirst(list,value)
	local first = list.first-1
	list.first=first
	list[first]=value
end


-- reserved={["while"]=true,["end"]=true,["function"]=true,["local"]=true,}
-- for w in allwords()do
-- 	if not reserved[w] then
-- 		print("==the allwords is not reserved")
-- end
-- end


function set(list)
	local set = {}
	for _,l in ipairs(list) do set[l] =true end
	return set
end
reserved=set{"while","end","function","local"}


-- local buff = ""
-- for line in io.lines() do
-- 	buff =buff..line.."\n"
-- end


-- local t = {}
-- for line in io.lines() do
-- 	t[#t+1]=line.."\n"
-- end
-- local s = table.concat(t)



-- Entry{
-- 	"Donald E.Knuth",
-- 	"Literate Programing",
-- 	"CSLI",
-- 	1992
-- }

-- local count = 0
-- function Entry(_)
-- 	count=count+1
-- end
-- dofile("data")
-- print("number of enteries"..count)

for i=1,9 do
	for j=1,i do
		sum=i*j
    io.write(string.format(i.."*"..j.." = %-2d  ",sum))
    end
    print("\n")
end





function dofile(filename)
	local f = assert(loadfile(filename))
    return f()
end
-- dofile("moudle.lua")


-- f=loadstring("i=i+1")
-- i=0
-- f();print(i)
-- f();print(i)

-- loading(s)()

















































