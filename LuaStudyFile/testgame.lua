game = {
    "请选择选项",
    {
    up= {"向上移动",1},
    down= {"向下移动",2},
    left= {"向左移动",3},
    right= {"向右移动",4},
    addhel= {"加血量",5},
    status= {"状态",6},
    quit = {"退出",7}
    }
}

function inputNum(game)
    num,_ret = 3,nil
   for k,v in pairs(game[2]) do
        if num == v[2] then
            _ret = v
            print(num,_ret)
          break
        else
            print(num,_ret)
            _ret = nil
        end
   end
  return num,_ret
end
function option1(game)
    print '请选择: '
    -- local _ret = game[2][key] or game[2][string.lower(key)] or game[2][string.upper(key)]
     num,_ret = inputNum(game)
    while num == nil or _ret == nil do
        print '输入无效，请再次输入(要输入提供的数字选择哦): '
         num,_ret = inputNum(game)
    end
    return _ret
end
-- num,ret = inputnum(game)
-- print(num)
-- ret = option1(game)
-- for k,v in pairs(ret)do
--     print(k,v)
-- end


-- per2 = nil
p1 = {name = "zhangsan",age = 23}
function testinput(p1,per2)

    if per2 == nil then

        print("======zhijie开始======")

        print("======取一个有个性的名字吧(不想取名的话直接按回车开始)======")
        -- local changename = io.read()
        -- local p = person.change(p,changename)    
        -- move1(p,p,game,article,adjust)


        per2 = {}
        for k,v in pairs(p1) do
        per2[k] = v
        end
        per2.name = "lisi"
        for k,v in pairs(per2) do
        print(k,v)
        end
        return per2
    else 
        -- copydate(p1,per2)
        print("======shifoujixu======")
        if true then
            -- for k,v in pairs(per2) do
            -- p1[k] = v
            -- end
            -- for k,v in pairs(p1) do
            --     print(k,v)
            -- end
            jixu(p1,per2)
        else
            print("zhijiekaisi")
        end
    end
end



function jixu(p1,per2)
    if per2 == nil then
        print("zhijiekaisi")
    else
        for k,v in pairs(per2) do
            p1[k] = v
        end
        for k,v in pairs(p1) do
            print(k,v)
        end
    end
end        

-- jixu(p1,per2)
-- per2 = testinput(p1,per2)
-- for k,v in pairs(per2) do
--     print(k,v)
-- end


-- p1 = {name = "zhangsan",age = 23}
-- p2 = {}
-- file = io.open("~/Desktop/savegame1.lua","w")
-- for k,v in pairs(p1) do
--     if k =="name" then
--         p2[1] = v
--     elseif k == "age" then
--         p2[2] = v
--     else

--     end
-- end
-- for k,v in pairs(p2) do
--     file:write(v..",")
-- end
-- file:close()

-- file = io.open("savegame1.lua","r")
-- -- file:seek("set",0)
-- file1 = file:read("*a")
-- print(file1)
-- file:close()
-- p3 = {}
-- i=0
-- for v in string.gmatch(file1,"(%w+),")do
--     i=i+1
--     p3[i]=v   
-- end
-- for k,v in ipairs(p3)do
--     print(k,v)
-- end


print(os.getenv("HOME"))

-- os.execute("touch ~/Desktop/savegame.lua")


-- i=0
-- repeat
--     i=i+1
--     print(i)
--     until i>=10

-- test1,test2,test3,test4 = os.execute("touch ~/Desktop/test1.lua")
-- print(test1,test2,test3,test4)
print(os.time())
print(os.date("%Y/%m/%d %H:%M:%S"))


-- bas_type = classs()
-- function bas_type:hello( ... )
--     print("hello bas_type")
-- end
-- bas_type:hello()


print("--------------继承方法实现1")
--继承方法实现1
a = {name = "zhangsan",age = 11}
a.new = function (self)
    local obj = {}
    setmetatable(obj,{__index = self})
    return obj
end
--继承
b=a.new(a)
b.c = function (self)
    print(self.name)
end
b.c(b)
print(b.c)
b.c = nil
print(b.c)
b.name = "lisi"
-- 这样创建 的tab2 改变 tab1 不会改变
print(b.name)
print(a.name)


print("--------------继承方法实现2")
--继承方法实现2
tab1 = {name = "lisi",age =22}
tab1.new = function (self)
    local obj = {}
    for k,v in pairs(tab1)do
        obj[k] = v
    end
    return obj
end
tab1.printcopy = function (self)
    print(self.name)
end


tab2 = tab1:new()
tab2.name = "zhangsan"
tab2.printcopy = function (self)
    print(self.age)
end
print(tab2.name,tab2.age,tab2.new,tab2.printcopy)
-- 这样创建 的tab2 改变 tab1 不会改变
print(tab1.name)
print(tab2.name)
local x = tostring("name")
print(tab1[x])
tab2.printcopy(tab2)
tab1.printcopy(tab1)


str1 = "继承,方法,"
for v in string.gmatch(str1,"([^,]+),") do
    print(v)
end
print("-----function_name-----")
function function_name()
    print(tab1.name)
end
function_name()

print("-------==========------------------")
strname = "nil"
print(strname == ("" or "nil") and "wu" or "king")
arr1 = {name = ""}
ar = arr1.name
print(ar == ("" or "nil") and "wu" or "king")


numtest = 13.5555666
print(string.format("%.2f",numtest))

-- local cjson = require"cjson"
-- local json = require("framework.shared.json")
os.execute("touch "..os.getenv("HOME").."/Desktop/savegame.json")
file = io.open(os.getenv("HOME").."/Desktop/savegame.json","w")
a = {name = "zhangsan",age = 11}
-- a = cjson.encode(a)
file:write(tostring(a))
file:close() 

file = io.open(os.getenv("HOME").."/Desktop/savegame.json","r")
file1 = file:read("*a")
print(file1)
-- setmetatable(file1,{__tostring= file1})
-- mt.__tostring = Set.tostring
-- print(Set.new(file1))
file:close()


a= {10,"str",4}
print(a)
Set = {}
function Set.tostring(set)
    local l = {}        -- 用于存放集合中所有元素的列表
    for e in pairs(set) do
        l[#l + 1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end
talpoint = {
     "请选择要添加的天赋类型",
     {
     {"攻",1,0,"未激活",0,"未激活"},
     {"防",2,0,"未激活",0,"未激活"},
     {"速",3,0,"未激活",0,"未激活"},
     {"技",4,0,"未激活",0,"未激活"},
     {"退回",5}
     }
 }
-- print(Set.tostring(file1))
fu = "[攻|1|10|已激活|20|已激活|防|2|0|未激活|0|未激活|速|3|0|未激活|0|未激活|技|4|0|未激活|0|未激活|退回|5|]"

fu = string.match(fu,"%[(.*)%]")
-- print(fu)
local i = 0
local j = 0
for v in string.gmatch(fu,"([^|]+)|") do
    print(v)
    if i%6 == 1 or i%6== 2 or i%6==4 then
        talpoint[2][j+1][tonumber(i%6+1)] = tonumber(v)
    else
        talpoint[2][j+1][tonumber(i%6+1)] = v
    end
    i=i+1
    if i%6 == 0 then
        j = j+1
        print("-------------")
    end
    
end
for k,v in pairs(talpoint[2]) do
    for m,n in pairs(v)do
        print(m,n)
        print(type(n))
    end
end