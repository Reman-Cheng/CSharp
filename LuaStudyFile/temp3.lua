-- brain = {}
-- while true do
--      print("请输入问题")
--      x = io.read()
--      if x == "quit" then
--      	break
--      end
--      y =brain[x]

--      if y == nil then
--      	print("请输入正确答案")
--      	z = io.read()
--      	brain[x] = z
--      	print("数据存储完毕")
--      else
--      	print(y)
--      	print("你对我的答案满意吗")
--      	z = io.read()
--      	if z == nil or z == "是" then
--      		print("xiexie")
--      	else
--      		print("请输入正确答案")
--      		z = io.read()
--      		brain[x] = z
--      	end
--      end
-- end

zodiacs = {'摩羯座','水瓶座','双鱼座','白羊座','金牛座','双子座',
'巨蟹座','狮子座','处女座','天秤座','天蝎座','射手座'}

dates = {{1,20},{2,19},{3,21},{4,21},{5,21},{6,22},
{7,23},{8,23},{9,23},{10,23},{11,23},{12,22}}

function get_zodiac(month, day)
    --[[获得星座 
    参数:
        month {int} -- 月份
        day {int} -- 日期
    返回:
        星座名
    ]]
    for k,v in ipairs(dates)do
    	if day<=v[2] then

           return zodiacs[month]
        else
        	if month == 12 then
        	    return zodiacs[1]
        	else
        		return zodiacs[month + 1]
        	end
        end
    end
end
print(get_zodiac(1,25))


local m = {foo = "bar"}
local test = {table.unpack(m)}
m.foo = 'foo'
print(test.foo)

-- 函数美学
-- cosmo = require "cosmo"
-- print(cosmo)

function env(t)
	if t.content then
		s = cosmo.fill([[\begin{$name}[$option]
			$content
			\end{$name}]],t)
		return s
	else
		function g(s)
			t.content = s
			return env(t)
		end
	end
	return g
		end
-- print(env{name = 'env',option = 'option',content = 'hello'})
-- print(env {name = 'env',option = 'option'} 'hello')

-- 分词算法 逆向最大匹配
function contains(t,a)
	for i,b in ipairs(t)do
		if b == a then
			return true
		end
	end
	return false
end

dictionary = {'南京', '南京市', '南京市长', '市长', '长江', '长江大桥', '江大桥', '大桥', '桥'}

function imm(text,maxlen)
	if maxlen == nil then
		maxlen = 4
	end
	result = {}
	index = #text
	while index > 0 do
		size = math.min(index,maxlen)
		while size > 0 do
			piece = string.sub(text,(index - size)*3+1,index * 3)
			if contains(dictionary,piece)then
				table.insert(result,1,piece)
				index = index-size+1
				break
			end
			size = size - 1
		end
		index = index - 1
	end
	return result
end

result = imm("南京市长江大桥",4)
for _,a in ipairs(result) do
	print(a)
end

print(string.sub("南京市长江大桥",1,15))


-- 关于luaxml模块的使用问题
-- xml = require "LuaXML"
-- print(type(xml))

-- _ENV = namespace "main"
-- a = 3
-- print(a)
-- print(main.a)



-- Curry化
function deco(key)
	return function (f)
		   return function (t)
		   	  if t[key] then
		   	  	return f(t)
		   	  else
		   	  	function g(s)
		   	  		t[key] = s
		   	  		return f(t)
		   	  	end
		   	  	return g
		   	  end
		   end
	end
end

function reverse(tab)
	local ks = {}
	local N = #tab
	for i =1,N do
		--移除的最后一个value
		ks[i] = table.remove(tab)
	end
	return ks
end

function decox(keys)
	local ks = reverse(keys)
	return function (f)
		for i,key in ipairs(ks) do
			f = deco(key)(f)
			-- print(f)
		end
		return f
	end
end

function f(t)
	s = 'hello word'
	for k,v in pairs(t) do
		s = string.format('<%s class=%s>'..s..' </%s>',k,v,k)
	end
	return s
end
f = decox {'cat','you'} (f)
s = f {body = 'body',head = 'head'} 'animal' 'people'
print(s)

-- tab1 = {'cat','you'}
-- tab2 = table.remove(tab1)
-- print(tab2)
-- for k,v in pairs(tab2)do
-- 	print(k,v)
-- end





function prompt(game)
	print(string.format('系统提示: %s(从菜单中提供的选项中选择)',game[1]))
	print '---------菜单---------'
	for k,v in pairs(game[2])do
		print(k)
	end
	print '---------------------'
end

function option1(game)
	print 'you choose: '
	key = io.read()

	local _ret = game[2][key] or game[2][string.lower(key)] or game[2][string.upper(key)]
	while key == nil or _ret == nil do
		print '输入无效，请再次输入(要输入提供的选择哦): '
		key = io.read()
		_ret = game[2][key]
	end

	return _ret
end

total = 0

function run(game)
	prompt(game)
	local _ret = option1(game)
	ret = _ret[1]
	total = total + _ret[2]
	print(string.format("你获得了%d",_ret[2]))
  if ret ~= "quit" then
	if type(ret) == "string" then
		io.write '系统提示: '
		print(ret)
	else
		run(ret)
	end
  else
  	pr = 'quit'
  	print('=======游戏结束=======')
    print(string.format('你总共获得%d', total))
    print('=======游戏退出 输入 os.exit() 退出整个系统=======')
  end
end

function Game(t)
	return t
end

lua_game = Game{
	    '你学习什么知识？',
            {
            table={'表的使用频率较高要认真学',5},
            metatable={'表的进阶版本',2},
            coroutine={'学好协程可以控制运行',6},
            object={'对象较难可以模拟出来功城狮!', 0},
            quit = {"quit",0}
        }
}
computer_game = Game{
	    '你学习什么语言？',
            {
            c={'C语言好难啊，没几个人会额，你好厉害呢',5},
            lua={lua_game,2},
            java={'都是大神啊',6},
            wtf={'严肃一点!', 0},
            quit = {"quit",0}
        }
}
math_game = Game {
'学习哪些数学？',
            {differential={'微分进阶好好加油', 2},
            integral={'积分强化，你是最棒的', 10},
            limit={'极限是开始，加油', -1},
            quit = {"quit",0}
            }
        }



sleep_game = Game {
'什么姿势睡觉？',
            {
            upsleep={'仰着睡(真确的睡姿)', 1},
            downsleep={'趴着睡(对心脏不好)', -2},
            sidesleep={'侧着睡(尽量往右侧)', -1},
            quit = {"quit",0}
            }
        }
classroom_game = Game {
'学习什么？',
            {computer={computer_game, 2},
            math={math_game, 3},
            sleep={'睡觉还用学？！在教室睡觉影响不好', -1},
            quit = {"quit",0}
            }
        }


pr = nil
print('=======游戏开始=======')
run {
    "你去哪里？",
    {
    room= {sleep_game, 0},
    classroom= {classroom_game, 1},
    quit = {"quit",0}
    }
}

while pr ~= 'quit' do
	print("please 输入 quit 退出 或 输入 run 继续")
	pr = io.read()
	if string.lower(pr) == 'quit' then
print('=======游戏结束=======')
print(string.format('你总共获得%d', total))
print('=======游戏退出 输入 os.exit() 退出整个系统=======')
    else
print('=======游戏继续=======')
print(string.format('你总共获得%d', total))    	
    run {
    "你去哪里？",
    {
    room= {sleep_game, 0},
    classroom= {classroom_game, 1},
    quit = {"quit",0}
    }
}
end
end


lua_request = [[
1、根据项目需求，进行手机游戏程序设计及开发工作；
2、参与讨论软件模块功能、操作流程等客户端设计；
3、根据策划需求，完成程序的编码、调试、配置等工作。
职位要求：
1. 1年以上cocos2d-x(c++,lua)研发经验，经历过成功上线运营的项目。
2. 程序设计基础好，熟悉数据结构，设计模式，动态语言。
3. 有lua,js等脚本语言经验优先，有Android或IOS平台经验优先。
5. 具备良好的分析解决问题能力，能独立承担复杂系统开发工作。
6. 具备高度的责任心、良好的沟通能力和团队合作精神。
7. 英语四级或六级优先，参与过开源项目研发优先。
8. 有sdk接入经验优先。
]]























































