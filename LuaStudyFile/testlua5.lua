-- #!/usr/local/bin/lua
-- function allwords ()
--     local line = io.read() -- current line
--     local pos = 1 -- current position in the line
--     return function () -- iterator function
--         while line do -- repeat while there are lines
--             local s, e = string.find(line, "%w+", pos)
--             if s then -- found a word?
--                 pos = e + 1 -- update next position
--                 return string.sub(line, s, e) -- return the word
--             else
--                 line = io.read() -- word not found; try next line
--                 pos = 1 -- restart from first position
--             end
--         end
--         return nil -- no more lines: end of traversal
--     end
-- end

-- function prefix (w1, w2)
--     return w1 .. " " .. w2
-- end

-- local statetab = {}

-- function insert (index, value)
--     local list = statetab[index]
--     if list == nil then
--         statetab[index] = {value}
--     else
--         list[#list + 1] = value
--     end
-- end


-- -- The Markov program

-- local N = 2
-- local MAXGEN = 10000
-- local NOWORD = "\n"

-- -- build table
-- local w1, w2 = NOWORD, NOWORD
-- for w in allwords() do
--     insert(prefix(w1, w2), w)
--     w1 = w2; w2 = w;
-- end
-- insert(prefix(w1, w2), NOWORD)

-- -- generate text
-- w1 = NOWORD; w2 = NOWORD -- reinitialize
-- for i=1, MAXGEN do
--     local list = statetab[prefix(w1, w2)]
--     -- choose a random item from list
--     local r = math.random(#list)
--     local nextword = list[r]
--     if nextword == NOWORD then return end
--     io.write(nextword, " ")
--     w1 = w2; w2 = nextword
-- end



for i=1,100 do
	for j=1,100 do
		if((100-i-j)+15*i+9*j == 300)then
			print("gongji:"..i.."muji:"..j.."xiaoji:"..100-i-j)
		end
	end
end


--升降，按数字还是字符还是key的顺序排序
network = {
        {name = "grauna", IP = "210.26.30.34"},
        {name = "arraial", IP = "210.26.30.23"},
        {name = "lua", IP = "210.26.23.12"},
        {name = "derain", IP = "210.26.23.20"}
}
-- table.sort(network, function(a,b) return (a.name > b.name) end)
table.sort(network, function(a,b) return (#(a.name) < #(b.name)) end)
for i, v in ipairs( network ) do
    print( v["name"] )
end


names = {"Peter", "Paul", "Mary"} 
grades = {Mary = 10, Paul = 7, Peter = 8}
table.sort(names, function(n1, n2)
    return grades[n1] > grades[n2]         -- 比较年级
end)
for i, v in ipairs(names) do
    print(v)
end



-- do
--         local oldOpen = io.open
--         local access_OK = function(filename, mode)
--             <检查访问权限>
--         end
--         io.open = function(filename, mode)
--             if access_OK(filename, mode) then
--                 return oldOpen(filename, mode)
--             else
--                 return nil, "access denied"
--             end
--         end
-- end


local function iter(a,i)
	i = i + 1
	local v = a[i]
	if v then
		return i,v
	end
end

function ipairs(a)
	return iter,a,0
end
a={"stringk,","fjls{}",12,5}
for i,v in ipairs(a)do
	print(i,v)
end


-- 楼梯有n阶台阶，上楼可以一步上1阶，也可以一步上2阶，编一程序列出每一种走法
-- local step = n
-- local tabstep = {}
-- function getStep(n)
-- 	if n==1 then
-- 		table.insert(tablestep,{1})
-- 		return tablestep
-- 	elseif n == 2 then
-- 		table.insert(tablestep,{1,1})
-- 		table.insert(tablestep,{2})
-- 	    return tablestep
-- 	else
-- 		table1 = getStep(n-1)
-- 		for i,v in pairs(table1)do
-- 			table.insert(table1[i],{1})
-- 			table.insert(tablestep,table1[i])
-- 		end
-- 		table2 = getStep(n-1)
-- 		for i,v in pairs(table2)do
-- 			table.insert(table2[i],{1})
-- 			table.insert(tablestep,table2[i])
-- 		end
--     return tablestep
--     end
-- end
-- tablereturn = getStep(6)
-- for i,v in pairs(tablereturn)do
-- 	print("solve:"..i..table.concat(tablestep[i],"-"))
-- end

-- 两个有序数组的合并



-- 求1-n的随机序列



-- 二分查找
print("----====binarySearch====----")
function binarySearch(tab,n)
	table.sort(tab)
	-- for i,v in ipairs(tab)do
	-- 	print(i,v)
	-- end
	min = 1
	max = #tab
	if n<tab[min] or n>tab[max] then
		print("cannot find the num")
	end
	while(max>=min)do
		if n<tab[(min+max+(min+max)%2)/2] then	
		    -- print(tab[(min+max+(min+max)%2)/2])		
			min = min
			max = (min+max+(min+max)%2)/2-1
			-- print(min,max)
		elseif n>tab[(min+max+(min+max)%2)/2] then
			-- print(tab[(min+max+(min+max)%2)/2])
			min = (min+max+(min+max)%2)/2+1
			max = max
			-- print(min,max)
        elseif n==tab[(min+max+(min+max)%2)/2] then
        	-- print(tab[(min+max+(min+max)%2)/2])
        	-- print(tab[(min+max+(min+max)%2)/2],min,max)
        	return (min+max+(min+max)%2)/2,tab[(min+max+(min+max)%2)/2]
        end
    end
end
function foor(n)
	n=n-n%1
	return n
end
tab1 = {3,12,8,99,81,88,57,102}
a,b = binarySearch(tab1,99)
print("position: "..a.." value: "..b)
a,b = binarySearch(tab1,8)
print("position: "..a.." value: "..b)
a,b = binarySearch(tab1,57)
print("position: "..a.." value: "..b)
a,b = binarySearch(tab1,3)
print("position: "..a.." value: "..b)



-- kmp



--相似度
a="stringfothefunction"
b="sfuncting"
function getB(str)
	n=0
	for w in string.gmatch(str,"%w") do
		if string.find(str,w) then
			n=n+1
		end
	end
	return n
end
print("Same ratio: "..string.format("%5.2f",(getB(b)/#a)*100).."%")



print("----====快速排序====----")
tabtest = {6,1,2,7,9,3,4,5,10,8}
function quickSort(tabtest,min,max)
	min = min
	max = max
	-- temp = tabtest[min]
	if(min<max)then
		i=min
		j=max
		temp = tabtest[min]
		while(i<j)do
			while(i<j and tabtest[j]>=temp)do
				j=j-1
			end
			if(i<j)then
				i=j
				j=i
				i=i+1
			end
			while(i<j and tabtest[i]<=temp)do
				i=i+1
			end
			if(i<j)then
				j=j-1
			end
		end
		tabtest[i]=temp
		quickSort(tabtest,min,i-1)
		quickSort(tabtest,i+1,max)		
	end
end
-- quickSort(tabtest,1,#tabtest)
-- for i,v in ipairs(tabtest)do
-- 	print(i,v)
-- end

-- yield返回的额外值就是对应resume传入的参数,可以返回resume传入的所有参数
print("----====coroutine.resum====----")
co = coroutine.create( function ()
    print( "co", coroutine.yield())
end )

print(coroutine.resume( co, "a" ))
print(coroutine.resume( co, 4, 5, 6 ))
print(coroutine.resume( co, 4, 5))


print("----====管道与过滤器====----")
function receive(prod)
	local status,value = coroutine.resume(prod)
	return status,value
end

function send(x)
	coroutine.yield(x)
end

function producer()
	return coroutine.create(function ()
		i=0
		while i<10 do
			local i = i+1
			send(i)
		end
	end)
end

function filter(prod)
	return coroutine.create(function ()
		for line =1,math.huge do
			local x,y = receive(prod)
			y = string.format("%5d %s",line,y)
			send(y)
		end
	end)
end

function consumer(prod)
	i=0
	while i<10 do
		i=i+1
		local x,y = receive(prod)
		io.write(tostring(x),y,"\n")
	end
end

consumer(filter(producer()))


print("----====递归地生成元素的排列====----")
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

function permutations(a)
        local co = coroutine.create(function() permgen(a) end)
        return function()  -- 迭代器
            local code, res = coroutine.resume(co)
            return res
        end
    end


for p in permutations{"a", "b", "c"} do
        printResult(p)
    end


-- require "socket"
-- host = "www.w3.org"
-- file = "/TR/REC-html32.html"

-- c=assert(socket.connect(host,80))
-- c:send("GET"..file.."HTTP/1.0\r\n\r\n")
-- while true do
-- 	local s,status,partial = c:receive(2^10)
-- 	io.write(s or partial)
-- 	if status == "closed" then break end
-- end
-- c:close()


print("----====数据结构====----")
list = nil
list ={next = list,value = v}
local l = list
while l do
	print(l.next)
	l=l.next
end
a={a="4",b=5}
b={5,8,99}
for i,v in pairs(a)do
	print(i,v)
end
for i,v in pairs(b)do
	print(i,v)
end
function funtest1(...)
	-- tet = {...}
	for i,v in pairs({...})do
		print(i,v)
	end
	-- print(tet)
end
funtest1(44,5,7,8)


print("----====保存无环的table====----")
function serialize(obj)
	if type(obj) == "number" then
		io.write(obj)
	elseif type(obj) == "string" then
		io.write(string.format("%q",obj))
	elseif type(obj) == "table" then
		io.write("{\n")
		for k,v in pairs(obj) do
			io.write(" ",k," = ")
			serialize(v)
			io.write(",\n")
		end
		io.write("}\n")
	else
		error("unknow the type "..type(o))
	end
end

obja = {a="str",b=10,{t="fdsf",f=66}}
serialize(obja)

-- math.random(s)

print(string.match("hello","()ll()"))

function test12()
	print("print the test12")
end
test12()

-- PF CT1 Station overlay development for P1 dry run
math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,7)))
-- for i=1,10,2 do
-- 	for j=1,i do
-- 		print(i,j,"♡☯︎")
-- 	end
-- end
for i=1,10 do
	print(math.random(1,10))
end























