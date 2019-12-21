-- local mymath =  {}

-- function mymath.add(a,b)
--    print(a+b)
-- end

-- function mymath.sub(a,b)
--    print(a-b)
-- end

-- function mymath.mul(a,b)
--    print(a*b)
-- end

-- function mymath.div(a,b)
--    print(a/b)
-- end

-- return mymath

-- tab1 = {key1 = "val1", key2 = "val2", "val3"}
-- for k, v in pairs(tab1) do
--     print(k .. " - " .. v)
-- end
 
-- tab1.key1 = nil
-- for k, v in pairs(tab1) do
--     print(k .. " - " .. v)
-- end



Account={}
function Account:new(o)
        o = o or {}        -- 如果用户没有提供table，则创建一个
        setmetatable(o, self)
        self.__index = self
        return o
    end

function Account:deposit(v)
	self.balance = self.balance + v
	return self.balance
end

function Account:withdraw(v)
	if v>self.balance then error"insufficient funds" end
	self.balance=self.balance - v
	return self.balance
end


SpecialAccount = Account:new()
s=SpecialAccount:new{limit=1000.00}
s.balance=10.00


function SpecialAccount:withdraw(v)
        if v - self.balance >= self:getLimit() then
            error "insufficient funds"
        end
        self.balane = self.balance - v
    end

function SpecialAccount:getLimit()
    return self.limit or 0
end

-- function s:getLimit()
--     return self.balance * 0.10
-- end

print(s:deposit(100.00))


f=loadfile("module.lua")
print(foo)
f()
foo("ok")


print "enter a number"
n= "sr"
if not n then error("invalid input") end


local status,err = pcall(function()
	a = "a" + 1
end)
print(err)

local status,err = pcall(function()
	error("my error")
end)
print(err)


-- function foo1(str)
-- 	if type(str) ~= "string" then
-- 		error("string expected")
-- 	end
-- 	print(str)
-- end
-- foo1({x=1})


function foo1(str)
	if type(str) ~= "string" then
		error("string expected",2)
	end
	print(str)
end
-- foo1({x=1})

print("coroutine")
 


co = coroutine.create(function()
	print("first coroutine program")
end)
print(co)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))

co=coroutine.create(function()
	for i=1,10 do
		print("co",i)
		coroutine.yield()
		print("finish")
	end
end)
for i=1,10 do
	coroutine.resume(co)
end
print(coroutine.resume(co))


co = coroutine.create(function(a,b,c)
	print("co",a,b,c)
end)
coroutine.resume(co,10,29,"str")

co = coroutine.create(function(a,b)
	coroutine.yield(a+b,a-b)
	
end)
-- a,b,c=coroutine.resume(co,62,44)
-- print(a,b,c)
print(coroutine.resume(co,62,44))

co = coroutine.create(function()
	print("co",coroutine.yield())
end)
coroutine.resume(co)
coroutine.resume(co,2,5)

co = coroutine.create(function()
	 return 54,6
end)
-- print(coroutine.resume(co))
local a,b,c = coroutine.resume(co)
print(a,b,c)


function permgen1(a,n)
	n=n or #a
	if n<=1 then
		printResult(a)
	else
		for i=1,n do
			a[n],a[i]=a[i],a[n]
			permgen1(a,n-1)
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
permgen1({1,2,3,4})


function permgen(a,n)
	n=n or #a
	if n <= 1 then
		coroutine.yield(a)
	else
		for i=1,n do
			a[n],a[i]=a[i],a[n]
			permgen(a,n-1)
			a[n],a[i]=a[i],a[n]
		end
	end
end
function permutations(a)
	local co = coroutine.create(function()
		permgen(a)
	end)
	return function()
		local code,res = coroutine.resume(co)
		return res
	end
end

for p in permutations("a","b","c")do
	printResult(p)
end




























