--===Lua 协同程序(coroutine)===--


--==什么是协同(coroutine)
-- Lua 协同程序(coroutine)与线程比较类似：拥有独立的堆栈，独立的局部变量，独立的指令指针，同时又与其它协同程序共享全局变量和其它大部分东西。


-- coroutine.create() 创建coroutine，返回coroutine， 参数是一个函数，当和resume配合使用的时候就唤醒函数调用
-- coroutine.resume() 重启coroutine，和create配合使用
-- coroutine.yield()  挂起coroutine，将coroutine设置为挂起状态，这个和resume配合使用能有很多有用的效果
-- coroutine.status() 查看coroutine的状态
-- 注：coroutine的状态有三种：dead，suspend，running，具体什么时候有这样的状态请参考下面的程序
-- coroutine.wrap（） 创建coroutine，返回一个函数，一旦你调用这个函数，就进入coroutine，和create功能重复
-- coroutine.running()  返回正在跑的coroutine，一个coroutine就是一个线程，当使用running的时候，就是返回一个corouting的线程号


--==线程和协同程序区别
-- 线程与协同程序的主要区别在于，一个具有多个线程的程序可以同时运行几个线程，而协同程序却需要彼此协作的运行。
-- 在任一指定时刻只有一个协同程序在运行，并且这个正在运行的协同程序只有在明确的被要求挂起的时候才会被挂起。
-- 协同程序有点类似同步的多线程，在等待同一个线程锁的几个线程有点类似协同。

-- coroutine_test.lua 文件
co = coroutine.create(
    function(i)
        print(i);
    end
)
coroutine.resume(co, 1)   -- 1
print(coroutine.status(co))  -- dead
 
print("----------")
 
co = coroutine.wrap(
    function(i)
        print(i);
    end
)
co(1)
-- 只是不用coroutine.resume来启用，直接co()调用

print("----------")
 
co2 = coroutine.create(
    function()
        for i=1,10 do
            print(i)
            if i == 3 then
                print(coroutine.status(co2))  --running
                print(coroutine.running()) --thread:XXXXXX
            end
            coroutine.yield() --挂起当前线程
        end
    end
)
 
coroutine.resume(co2) --1 --触发事件
coroutine.resume(co2) --2 --触发事件
coroutine.resume(co2) --3 --触发事件
 
print(coroutine.status(co2))   -- suspended
print(coroutine.running())
 
print("----------")


-- coroutine.running就可以看出来,coroutine在底层实现就是一个线程。
-- 当create一个coroutine的时候就是在新线程中注册了一个事件。
-- 当使用resume触发事件的时候，create的coroutine函数就被执行了，当遇到yield的时候就代表挂起当前线程，等候再次resume触发事件


function foo (a)
    print("foo 函数输出", a)
    return coroutine.yield(2 * a) -- 返回  2*a 的值
end
 
co = coroutine.create(function (a , b)
    print("第一次协同程序执行输出", a, b) -- co-body 1 10
    local r = foo(a + 1)
     
    print("第二次协同程序执行输出", r)
    local r, s = coroutine.yield(a + b, a - b)  -- a，b的值为第一次调用协同程序时传入
     
    print("第三次协同程序执行输出", r, s)
    return b, "结束协同程序"                   -- b的值为第二次调用协同程序时传入
end)
        
print("main", coroutine.resume(co, 1, 10)) -- true, 4
print("--分割线----")
print("main", coroutine.resume(co, "r")) -- true 11 -9
print("---分割线---")
print("main", coroutine.resume(co, "x", "y")) -- true 10 end
print("---分割线---")
print("main", coroutine.resume(co, "x", "y")) -- cannot resume dead coroutine
print("---分割线---")


-- 调用resume，将协同程序唤醒,resume操作成功返回true，否则返回false；
-- 协同程序运行；
-- 运行到yield语句；
-- yield挂起协同程序，第一次resume返回；（注意：此处yield返回，参数是resume的参数）
-- 第二次resume，再次唤醒协同程序；（注意：此处resume的参数中，除了第一个参数，剩下的参数将作为yield的参数）
-- yield返回；
-- 协同程序继续运行；
-- 如果使用的协同程序继续运行完成后继续调用 resume方法则输出：cannot resume dead coroutine
-- resume和yield的配合强大之处在于，resume处于主程中，它将外部状态（数据）传入到协同程序内部；而yield则将内部的状态（数据）返回到主程中。


-- ==生产者-消费者问题
-- 现在我就使用Lua的协同程序来完成生产者-消费者这一经典问题。

print("---========-------")
local newProductor

function productor()
     local i = 0
     while i<=10 do
          i = i + 1
          print("productor")
          send(i)     -- 将生产的物品发送给消费者
     end
end

function consumer()
    local i = 0
     while i<=10 
        do
        i=i+1
          local i = receive()     -- 从生产者那里得到物品
          print("consumer")
          print(i)
     end
end

function receive()
     local status, value = coroutine.resume(newProductor)
     print("receive")
     return value
end

function send(x)
     print("send")
     coroutine.yield(x)     -- x表示需要发送的值，值返回以后，就挂起该协同程序
end

-- 启动程序
newProductor = coroutine.create(productor)
consumer()
-- coroutine.yield()


co = coroutine.create(function () print("hi") end)
print(co)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))


co=coroutine.create(function ()
	for i=1,10 do
		print("co",i)
		coroutine.yield()
	end
end)
coroutine.resume(co)
print(coroutine.status(co))

-- coroutine.create() 创建coroutine，返回coroutine， 参数是一个函数，当和resume配合使用的时候就唤醒函数调用
-- coroutine.resume() 重启coroutine，和create配合使用
-- coroutine.yield()  挂起coroutine，将coroutine设置为挂起状态，这个和resume配合使用能有很多有用的效果
-- coroutine.status() 查看coroutine的状态
-- 注：coroutine的状态有三种：dead，suspend，running，具体什么时候有这样的状态请参考下面的程序
-- coroutine.wrap（） 创建coroutine，返回一个函数，一旦你调用这个函数，就进入coroutine，和create功能重复
-- coroutine.running()  返回正在跑的coroutine，一个coroutine就是一个线程，当使用running的时候，就是返回一个corouting的线程号

coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
print(coroutine.status(co))


co=coroutine.create(function (a,b,c)
	print("co",a,b,c)
end)
coroutine.resume(co,1,2,3)

co=coroutine.create(function (a,b)
	coroutine.yield(a+b,a-b)
end)
print(coroutine.resume(co,20,10))

co=coroutine.create(function ()
	print("co",coroutine.yield())
end)
coroutine.resume(co)
coroutine.resume(co,4,6)

co=coroutine.create(function ()
	return 6,co
end)
print(coroutine.resume(co))


function receive(producer)
	local status,value = coroutine.resume(producer)
	return value
end
function send(x)
	coroutine.yield(x)
end
function producer()
	return coroutine.create(function()
		while true do
		local x = io.read()
		print("send")
		send(x)
	    end
	end)
end

function consumer(producer)
	while true do
		local x = receive(producer)
		print("consumer")
		io.write(x,"\n")
		end
end
function filter(producer)
	return coroutine.create(function ()
		for line=1,math.huge do
			local x = receive(producer)
			x=string.format("%5d %s",line,x)
			send(x)
			end
	end)
end
producer=coroutine.create(function ()
	while true do
		local x = io.read()
		send(x)
		end
end)
-- consumer(filter(producer()))

-- p=producer()
-- f=filter()
-- consumer()




-- function productor()
     
--      while true do
--          local x = io.read()
--           send(i)     -- 将生产的物品发送给消费者
--      end
-- end
-- function consumer()
--      while true 
--         do
--           local x = receive()     -- 从生产者那里得到物品
--           io.write(x,"\n")
--      end
-- end
-- function receive()
--      local status, value = coroutine.resume(producer)
--      return value
-- end
-- function send(x)
--      coroutine.yield(x)     -- x表示需要发送的值，值返回以后，就挂起该协同程序
-- end
-- producer = coroutine.create(function ()
--     while true do
--         local x = io.read()
--         send(x)
--     end
-- end)


-- function receive(prod)
--     local status,value = coroutine.resume(prod)
--     return value
-- end
-- function send(x)
--     coroutine.yield(x)
-- end
-- function producer()
--     return coroutine.create(function ()
--         while true do
--             local x = io.read()
--             send(x)
--         end
--     end)
-- end
-- function filter(prod)
--     return coroutine.create(function ()
--         for line =1,math.huge do
--             local x = receive(prod)
--             x=string.format("%5d %s",line,x)
--             send(x)
--         end
--     end)
-- end
-- function consumer(prod)
--     while true do
--         local x = receive(prod)
--         io.write(x,"\n")
--         end
-- end
-- consumer(filter(producer()))




-- 用于迭代文件中每行的(io.lines)   迭代table元素的(pairs)  迭代数组元素(ipairs)      迭代字符串中的单词(string.gmatch)

-- str ="wo can do anything for this problem!"
-- for k,v in string.gmatch(str) do
--     print(v)
-- end


co1=coroutine.create(function (a,b,c)
    print("co",a,b,c)
end)
coroutine.resume(co1,1,2,3)   --gu ding yong fa


co2=coroutine.create(function (a,b)
    coroutine.yield(a+b,a-b)
end)
print(coroutine.resume(co2,20,10))




-- function permgen(a,n)
--     n = n or #a
--     if n<=1 then
--         printResult(a)
--     else
--         for i=1,n do
--             a[n],a[i]=a[i],a[n]
--             permgen(a,n-1)
--             a[n],a[i]=a[i],a[n]
--             end
--         end
-- -- end
-- function printResult(a)
--     for i=1,#a do
--         io.write(a[i]," ")
--         end
--         io.write("\n")
-- end
-- permgen({1,2,3,4})



-- function printResult(a)
--     for i=1,#a do
--         io.write(a[i]," ")
--         end
--         io.write("\n")
-- end
-- function permgen(a,n)
--     n=n or #a
--     if n<1 then
--         coroutine.yield(a)
--     else
--         for i=1,n do
--             a[n],a[i]=a[i],a[n]
--             permgen(a,n-1)
--             a[n],a[i]=a[i],a[n]
--             end
--         end 
-- end
-- function permutations(a)
--     local  co = coroutine.create(function ()
-- permgen(a)        
--     end)
--     return function ( )
-- local code,res = coroutine.resume(co)
-- return res
--     end
-- end
-- for p in permutations("a","b","c")
--  do printResult(p)
--  end


function prefix(w1,w2)
    return w1.." "..w2
end
local statetab={
    ["\n \n"]={"the"},
    ["\n the"]={"more"},
    ["the more"]={"we","we"},
    ["more we"]={"try","do"},
    ["we try"]={"the"},
    ["try the"]={"more"},
    ["we do"]={"\n"},
}

function insert(index,value)
    local list = statetab[index]
    if list== nil then
        statetab[index]={value}
        else
            list[#list+1]=value
            end
end

function allwords1()
    local line = io.read()
    local  pos = 1
    return function ()
        while line do
            local s,e = string.find(line,"%w+",pos)
            if s then
                pos=e+1
                return string.sub(line,s,e)
                else
                    line=io.read()
                    pos=1
                    end
                end
                return nil
    end
end

-- local statetab = {}

local N = 2
local MAXGEN = 10000
local NOWORD = "\n"

local w1,w2 = NOWORD,NOWORD
-- for w in allwords1() do
--     insert(prefix(w1,w2),w)
--     w1=w2;w2=w;
--     end
--     insert(prefix(w1,w2),NOWORD)

--     w1=NOWORD;w2=NOWORD
--     for i =1,MAXGEN do
--         local list = statetab[prefix(w1,w2)]
--         local r = math.random(#list)
--         local  nextword = list[r]
--         if nextword == NOWORD then return end
--         io.write(nextword," ")
--         w1=w2;w2=nextword
--     end









-- 协同程序
-- 一个具有多个协同程序的程序在任意时刻只能运行一个协同程序，
-- 并且正在运行的协同程序只会在其显式地要求挂起（suspend）时，它的执行才会暂停。

-- ● 协同程序基础
-- Lua将所有关于协同程序的函数放置在一个名为“coroutine”的table中
local co = coroutine.create(function ()
    print("hi")
end)
print(type(co))
-- 一个协同程序可以处于4种不同的状态：挂起（suspended）、运行（running）、死亡（dead）和正常（normal）
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))

-- 协同程序的真正强大之处在于函数yield的使用上，该函数可以让一个运行中的协同程序挂起，而之后可以再恢复它的运行。
local co = coroutine.create(function ()
    for i=1,10 do
        print("co",i)
        coroutine.yield()
    end
end)
for i=1,11 do
coroutine.resume(co)
end
print(coroutine.resume(co))

-- Lua的协同程序还具有一项有用的机制，就是可以通过一对resume-yield来交换数据。
local co = coroutine.create( function ( a, b, c )
    print( "co", a, b, c )
end )
coroutine.resume( co, 1, 2, 3 )    -- co 1 2 3

local co = coroutine.create( function ( a, b )
        coroutine.yield( a + b, a - b )
    end )
print( coroutine.resume( co, 20, 10 ) )    -- true 30 10
-- 与此对应的是，yield返回的额外值就是对应resume传入的参数：
local co = coroutine.create( function ()
    print( "co", coroutine.yield() )
end )
print(coroutine.resume( co, "a" ))      -- true
print(coroutine.resume( co, 4, 5, 6 ))  -- co 4 5 6  -- true
print(coroutine.resume( co, 4, 5))      -- false cannot resume dead coroutine

-- 当一个协同程序结束时，它的主函数所返回的值都将作为对应resume的返回值：
local co = coroutine.create( function ()
    return 6, 7
end )
print( coroutine.resume( co ) )        -- true 6 7

-- ● 以协同程序实现迭代器
function permgen(a, n)
        n = n or #a         -- 默认n为a的大小
        if n <= 1 then
            printResult(a)
        else
            for i = 1, n do
                -- 将第i个元素放到数组末尾
                a[n], a[i] = a[i], a[n]
                -- 生成其余元素的排列
                permgen(a, n - 1)
                -- 恢复第i个元素
                a[n], a[i] = a[i], a[n]
            end
        end
    end

function printResult(a)
        for i = 1, #a do
            io.write(a[i], " ")
        end
        io.write("\n")
    end

permgen({1, 2, 3, 4})



-- 将其转换为一个迭代器
function permgen1(a, n)
        n = n or #a
        if n <= 1 then
            coroutine.yield(a)
        else
            for i = 1, n do
                -- 将第i个元素放到数组末尾
                a[n], a[i] = a[i], a[n]
                -- 生成其余元素的排列
                permgen(a, n - 1)
                -- 恢复第i个元素
                a[n], a[i] = a[i], a[n]
            end
        end
    end
function permutations(a)
        local co = coroutine.create(function() permgen1(a) end)
        return function()  -- 迭代器
            local code, res = coroutine.resume(co)
            return res
        end
    end

   
for p in permutations{"a", "b", "c"} do
    printResult(p)
end
print("---------=======------------")


-- ● 非抢先式的多线程





local t = {}
local m = {a="and",b="li lei",c="han Meimei"}
setmetatable(t,{__index = m})  --表{ __index=m }作为表t的元表

    for k,v in pairs(t) do  --穷举表t
        print("有值吗？")
        print(k,"=>",v)
    end
    print("-------------")
    print(t.b, t.a, t.c)

print("----------------------------------------")
local function add(t1,t2)
        --‘#’运算符取表长度
        assert(#t1 == #t2)
        local length = #t1
        for i = 1,length do
            t1[i] = t1[i] + t2[i]
        end
        return t1
    end

    --setmetatable返回被设置的表
    t1 = setmetatable({1,2,3},{__add = add})
    t2 = setmetatable({10,20,30},{__add = add})

    for k,v in  pairs(t1) do
        print(k,"=>",v)
    end

    for k,v in  pairs(t2) do
        print(k,"=>",v)
    end

    print("---------两元表相加--------------")
    t1 = t1 + t2
    for i = 1 ,#t1 do
        print(t1[i])
    end

print(collectgarbage(count))

-- getfenv(add)