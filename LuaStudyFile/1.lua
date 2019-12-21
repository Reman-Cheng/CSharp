print("hello world")
--[[
print("hello")
--]]
-- function reverseString(str)
-- 	strarr=
-- 	return str
-- end
-- reverseString("hello world to any thing")


function create(name,id)
        local obj = {name = name,id = id}

        function obj:SetName(name)
            self.name = name 
        end

        function obj:GetName()
            return self.name
        end

        function obj:SetId(id)
            self.id = id
        end

        function obj:GetId()
            return self.id
        end
        return obj
    end

    local myCreate = create("sam",001)

    for k,v in pairs(myCreate) do
        print(k,"=>",v)
    end

    print("myCreate's name:",myCreate:GetName()," myCreate's id:",myCreate.GetId(myCreate))

    myCreate:SetId(100)
    myCreate:SetName("Hello Kity")

    print("myCreate's name:",myCreate:GetName()," myCreate's id:",myCreate:GetId())




local function CreateRobot(name,id)
        local obj = {name = name,id = id}

        function obj:SetName(name)
            self.name = name
        end

        function obj:GetName()
            return self.name
        end

        function obj:SetId(id)
            self.id = id
        end

        function obj:GetId()
            return self.id
        end
        return obj
    end

    local function createFootballRobot(name ,id ,position)
        local obj = CreateRobot(name ,id)
        obj.position = "right back"

        function obj:SetPosition(p)
            self.position = p
        end

        function obj:GetPosition() 
            return self.position
        end

        return obj
    end

    local mycreateFootballRobot = createFootballRobot("Tom",1000,"广州")

    print("mycreateFootballRobot's name:",mycreateFootballRobot:GetName(),"myCreate's id:",mycreateFootballRobot:GetId(),mycreateFootballRobot:GetPosition())

    mycreateFootballRobot:SetName("麦迪")
    mycreateFootballRobot:SetId(2000)
    mycreateFootballRobot:SetPosition("北京")
    print("mycreateFootballRobot's name:",mycreateFootballRobot:GetName(),"myCreate's id:",mycreateFootballRobot:GetId(),mycreateFootballRobot:GetPosition())



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

foreach({1,2,3,4},print)


local function producer()
	return coroutine.create(
		function (salt)
			local t = {1,2,3}
			for i=1,#t do
				salt=coroutine.yield(t[i]+salt)
			end
		end)
end

function consumer(prod)
	local salt = 10
	while true do
		local running,product = coroutine.resume(prod,salt)
		salt = salt*salt
		if running then
			print(product or "END")
		else
			break
		end
    end
end

consumer(producer())

dofile("LCoroutine.lua")
for k,v in pairs(_G) do
	print(k,"==>",v)
end

-- print(getfenv(consumer))




-- function Set.new(l)
-- 	local set={}
-- 	setmetatable(set,mt)
-- 	for _,v in pairs(l) do set[v]=true end
-- 	mt.__metatable = "you cannot get the metatable"
-- 	return set
-- end
-- local tb = Set.new({1,2})
-- print(tb)
-- print(getmetatable(tb))
-- setmetatable(tb,{})


print(os.time{year=1970,month=1,day=1,hour=8})
print(os.time{year=1970,month=1,day=1,hour=9})

t=os.date("*t",os.time())
for i,v in pairs(t) do
	print(i,"->",v)
end

print(os.date("today is %A, in %B"))
print(os.date("%X",906000490))
print(os.date("%m/%d/%Y",906000490))


local s = "hello world for somthing"
i,j=string.find(s,"world")
print(i," ",j)
print(string.find(s,"kity"))
print(string.sub(s,i,j))

local s = "\nare you ok!\n OK\n"
local t = {}
local i = 0
while true do
    i = string.find(s,"\n",i+1)
    if i == nil then break end
    table.insert(t,i)   
end

for k,v in pairs(t) do
    print(k,"->",v)  
end


-- t=io.read("*all")
-- t=string.gsub(t,...)
-- io.write(t)


file=io.open("testRead.txt","r")
for line in file:lines() do
	print(line)
end
file:close()
file=io.open("testRead.txt","a+")
file:write("\nhello")
file:close()


girl={money=200}
function girl.goToMarket(girl,someMoney)
	girl.money=girl.money-someMoney
end
girl.goToMarket(girl,100)
print(girl.money)

function girl.goToMarket1(self,someMoney)
	self.money=self.money-someMoney
end
girl.goToMarket1(girl,100)
print(girl.money)

function girl:goToMarket2(someMoney)
	self.money=self.money-someMoney
end
girl.goToMarket2(girl,100)
print(girl.money)


a={}
for i=1,100 do
	a[i]=i
end
print("the length of array 'a' is "..#a)
squares={1,4,9,16,25}
print("the length of array 'a' is "..#squares)

local m = 4
local n = 4
local mtable = {}

for i=1,m do
	mtable[i]={}
	for j=1,n do
		mtable[i][j]=i*j
		print(mtable[i][j])
	end
end


list = nil
for i=1,10 do
	list={next = list,value =i}
	print(list.next)
end
print(list.value)
local l = list
while l do
	print(l.value)
	l=l.next --刨出来
end


list={}
List={}
function List.new()
	return {first =0,last =-1}
end
function List.pushFront(list,value)
	local first = list.first -1
	list.first = first
	list[first] = value
end


local function producer()
	return coroutine.create(
		function(salt)
			t={1,2,3}
			for i=1,#t do
			 salt = coroutine.yield(t[i] + salt)
			end
		end)
end
local function consumer(prod)
	local salt = 10
	while true do
	    local running,product = coroutine.resume(prod,salt)  
	    salt = salt * salt
	    if running then
	    	print(product or "END")
	    else
	    	break
	    end
	end
end

consumer(producer())


--制造一个可以造出不同随机值的方法
print(math.pi,math.rad(60))
print(math.random(1,100))
-- 在使用math.random函数之前必须使用此函数设置随机数种子
math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,7)))
for i=1,10 do
	t = math.random(1,10)
	print(t)
	-- print(math.random(1,10))
end


print("----==getRandom==----")

function printRandom()
	
end

function getRandom()
	local tabtab = {1,2,3,4,5,6,7,8,9}
	local tabrandom = {5}
	math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,7)))
    for i = 2,9 do      
	   -- t = math.random(1,9)	   
	   for k,v in pairs(tabrandom)do
	   	     m = 5
          repeat
            
          	m = math.random(1,9)
          until m ~= v
          tabrandom[i] = m
	   end
    end
    return tabrandom
end

-- for i,v in pairs(getRandom())do
-- 	print(i,v)
-- end

table = {}
tabk = {}
-- for r=1,9 do
-- -- for k=1,9 do
-- 	table[r]={}
-- 	tabk[r]={}
-- 	-- end
-- end
math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,7)))
-- table[1]= math.random(1,9)
j=1
function rand(table,i)	
	num = math.random(1,9)
    for k,v in ipairs(table)do
    	if v == num then
    	   return rand(table)
    	end
    end    	  	
end
-- while j<=8 do
-- 	j=j+1
--     rand(table)
-- table[j]=num 
-- end


-- function rand1(table,tabk,i,k)
-- 	num = math.random(1,9)
-- for m,v in ipairs(table[i])do
--     if v == num then
--     	return rand1(table,tabk,i,k)	
--     else
-- 		for p,q in ipairs(tabk[k]) do
-- 	         if q == num then
-- 		             return rand1(table,tabk,i,k)
-- 		     end      
-- 		 end	        
--     end
-- end
-- end
-- for i=1,9 do
-- 	table[i]={}
-- 	for k =1,9 do
-- 		    tabk[k] = {}
-- 		    rand1(table,tabk,i,k)    
-- 		    table[i][k] = num
-- 		    tabk[k][i] = num   
-- 	end

-- 	for k,v in ipairs(table[i])do
-- 	io.write(v)
-- 	end  
-- 	io.write("\n")	 
-- end


-- local rand1,randi,randk
function rand1(table,tabk,i,k)
	num = math.random(1,9)
    if (randi(table,tabk,i,k) == nil) or (randk(table,tabk,i,k) == nil) then
    	return rand1(table,tabk,i,k)   
	end
    --  randi(table,i)
    --  randk(tabk,k)
    -- if randi(table,i) == randk(tabk,k)then
    -- 	table[i][k] = num
	   --  tabk[k][i] = num  
    -- end
end


function randi(table,tabk,i,k)
	for m,v in pairs(table[i])do
	    if v == num then
	    	-- return rand1(table,tabk,i,k)
	    return nil
	    end
	end
	    return true
end

function randk(table,tabk,i,k)
	for p,q in pairs(tabk[k]) do
	         if q == num then
		             -- return rand1(table,tabk,i,k)
		     return nil
		     end
    end	
		 return true 
end

for i=1,9 do
	table[i]={}
	for k =1,9 do
	    tabk[k] = {}
	    rand1(table,tabk,i,k)    
	    table[i][k] = num
	    tabk[k][i] = num   
	end
	for k,v in pairs(table[i])do
	io.write(v)
	end  
	io.write("\n")	 
end












































