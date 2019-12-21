print(_ENV)
for k,v in pairs(_ENV)do
	print("==="..k.."===",_ENV[k])
	if type(v) == "table" then
	for m,n in pairs(v)do
		print(m,n)
	end
    else
    	print(v)
    end
end

-- ps: 使用 _G.function_name 定义可以实现全局函数

-- 字符串分隔成数组
function explode(str,symbol)
	local table = {}
	string.gsub(str,"[^"..symbol.."]+",function(w)
		table.insert(table,w)
	end)
	return table
end
-- str1 = "VolDn gets pressed times"
-- tab1 = explode(str1,"(%w+)")
-- for k,v in pairs(tab1)do
-- 	print(k,v)
-- end
-- 将数组使用给定符号拼接成字符串
function implode(arr,symbol)
	local implode_str = ""
	symbol = symbol or ","
	for k,v in pairs(arr)do
		implode_str = implode_str .. v .. symbol
	end
	-- return string.sub(implode_str,1,#implode_str-1)
	return implode_str
end
arr1 = {"string","find","kai",3,66}
print(implode(arr1,":)"))
-- 将数组 table 逆向
function table_reverse(tab)
	for i=1,math.floor(#tab/2)do
		tab[i],tab[#tab-i+1] = tab[#tab-i+1],tab[i]
	end
	return tab
end
for k,v in pairs(table_reverse(arr1)) do
	print(k,v)
end
-- 删除 table 中的一个给定的元素
function _G.table_remove(tab,rm)
	local result = tab
	for k,v in pairs(rm)do
		for a_k,a_v in pairs(result)do
			if type(a_k) == 'number'then
				if type(a_v) == 'table' then
					result[a_k][v] = nil
				elseif v == a_v then
					table.remove(result,a_k)
				end
			else
				if v == a_k then
					result[a_k] = nil
				end
			end
		end
	end
	return result
end
tab1 = {name = "zhangsan",{age = 24},num = 13245}
for k,v in pairs(_G.table_remove(tab1,{"age"}))do
	print(k,v)
end

-- 对数组型 table 去重
function _G.unique(arr)
	local hash = {}
	local res = {}
	for _,v in ipairs(arr)do
		if not hash[v] then
			hash[v] =true
			table.insert(res,v)
		end
	end
	return res
end
arr1 = {1,33,4,9,66,"string",66,4}
for k,v in ipairs(_G.unique(arr1))do
	print(k,v)
end
-- 对 hash table 按 key 排序
function sortByKey(f)
	local a = {}
	for n in pairs(self) do
		table.insert(a,n)
	end
	table.sort(a,f)
	local  i = 0
	local iter = function( ... )
		i = i + 1
		if a[i] == nil then
			return nil
		else
			return a[i],self[a[i]]
		end
	end
	return iter
end


function _shoot(a,b)
	if a.gun == "ak47" then
		b.blood = b.blood - 10
	elseif a.gun == "awmh" then
		b.blood = b.blood - 8
	else
		b.blood = b.blood -5
	end
end

function status(a,b)
	print(string.format("%s 射击 %s",a.name,b.name))
	print("结果：")
	show(a)
	show(b)
	print("====status=====")
end

function show(people)
	print(string.format("%s(%s),血量 %d",people.name,people.emojo,people.blood))
end

function shoot(a,b)
	_shoot(a,b)
	status(a,b)
end

P1 = {name = "麻花疼",gun = "ak47",blood = 100,emojo = "^=^"}
P2 = {name = "金肛狼",gun = "awmh",blood = 100,emojo = "*_*"}
math.randomseed(os.time())
-- while P1.blood >0 and P2.blood >0 do
--       local num = math.floor(math.random(1,2))
--       print(num)
--       if num == 1 then
--       	shoot(P1,P2)
--       else
--       	shoot(P2,P1)

--       end
-- end

-- 统计
function string.count(s)
	t = {}
	for i=1,#s do
		a = string.sub(s,i,i)
	    if t[a] then
	    	t[a] = t[a] + 1
	    else
	    	t[a] = 1
	    end
	end
	return t
end
t = "i love you very much,beyond your imagination."
for k,v in pairs(string.count(t))do
	print(k,v)
end

function choice(t)
	N = #t
	r = math.random(N)
	return t[r]
end
function keys(t)
	s = {}
	for k,v in pairs(t)do
		table.insert(s,1,k)
	end
	return s
end








