-- 创建对象====
person = {name = "💩",health = 100,level =1,experience = 0 ,emojo = "^_^",attack = 20,gold = 10000,speed = 10,armor = 10,power = 100}
person.new = function(self)
	local tab = {}
	for k,v in pairs(self)do
		tab[k] = v
	end
	return tab
end
person.change = function(self,name,health,level,experience,emojo,attack,gold,speed,armor)
	self.name = name=="" and self.name or name
	self.health = health or self.health
	self.level = level or self.level
	self.experience = experience or self.experience
	self.emojo = emojo or self.emojo
	self.attack = attack or self.attack
	self.gold = gold or self.gold
	self.speed = speed or self.speed
	self.armor = armor or self.armor
	return self
end
local p = person:new()
function createmonster()
	 Gabriel = person:new()
	 Gabriel = person.change(Gabriel,"加百力",20,1,10,"*_*",2,10,2,2)
	 Goblin = person:new()
	 Goblin = person.change(Goblin,"哥布林",40,5,20,"$_$",10,20,10,10)
	 Ganunu = person:new()
	 Ganunu = person.change(Ganunu,"加努努",60,10,50,"#_#",20,50,20,20)
	 Cthulhu = person:new()
	 Cthulhu = person.change(Cthulhu,"克苏鲁",80,15,100,"@_@",40,100,40,40)
end
-------------------------------------------------------------

--升级 添加基础功能
function inithealth(self)
    
    return 100 + self.level-1
end
function initpower(self)
    
    return 100 + self.level-1
end
function initarmor(self)
    
    return 50
end
function initattack(self)
    
    return 40
end

function status(self,p1)
    print("====你的血量："..p1.health.."/"..inithealth(self))
    print("====你的蓝量："..p1.power.."/"..initpower(self))
    print("====你的等级："..p1.level)
    print("====你的金币："..p1.gold)
    print("====剩余经验："..addexpgloble)
    print("====你的攻击："..p1.attack)
    print("====你的护甲："..p1.armor)
end

addexpgloble = 0
p.addexp = function (self,p1,addexp)
    addexpgloble = addexpgloble + addexp
	while addexpgloble >= p1.level*1 do
		addexpgloble = addexpgloble - p1.level
		p1.level = p1.level + 1
		print("----你升级了 等级："..p1.level.." 血量："..inithealth(self))
		p1.health = inithealth(self)
		p1.power = p1.power + 20 > initpower(self) and initpower(self) or p1.power + 20
		-- p.addatt(p1)
	end
	return p1
end
p.addhel = function (self)
 if self.health < inithealth(self) then
  if self.gold > 100 then
    if self.health + 20 <= inithealth(self) then
    	self.health = self.health + 20
    else
    	self.health = inithealth(self)
    end
    self.gold = self.gold - 100
  else
  	print("金币不足: "..self.gold.." 需要金币: 100")
  end
    return self
 else
 	print("====你的血量已满不用添加血量====")
 end
end
p.addpow = function (self)
 if self.power < initpower(self) then
  if self.gold > 50 then
    if self.power + 20 <= initpower(self) then
    	self.power = self.power + 20
    else
    	self.power = initpower(self)
    end
    self.gold = self.gold - 50
  else
  	print("金币不足: "..self.gold.." 需要金币: 50")
  end
    return self
 else
 	print("====你的蓝量已满不用添加蓝量====")
 end
end
p.addarmor = function (self)
    if self.armor < 50 then
	    self.armor = self.armor + self.level*0.1
    else
    	self.armor = 50
    end
	return self 
end
p.addatt = function (self)
    if self.attack < 30 then
	    self.attack = self.attack + self.level*0.1
    else
    	self.attack = 30
    end
	return self 
end
-------------------------------------------------------------

--战斗状态功能
function fight(self,p1,p2,adjust)
	local p3 = {}
	for k,v in pairs(p2)do
		p3[k] = v
	end
    p1,p3 = fightTime(self,p1,p3,adjust)
    if p3.health <= 0 then
    	print("--------==!!战斗胜利!!==--------")
    	print("金币: +"..p3.gold.." 经验: +"..p3.experience)
    end
	    if p1.health > 0 then
	    	p1.addexp(self,p1,p3.experience)
	    	p1.gold = p1.gold + p3.gold
	    	-- createmonster()
	    else
	      print("====you are died====你的等级: ",p.level)
	      print('=======游戏结束=======')
	      print('=======游戏退出 输入 os.exit() 退出整个系统=======')
	      dead = true
	    end  
    return p1  
end
function maxnum(a,b)
	if a >= b then
		return a
	else
		return b
	end
end
function fightTime(self,p1,p3,adjust)

	if p1.speed >= p3.speed then
        print("====你遇到了 ⬈"..p3.name.."⬉ 你的百米长的大刀正向他们头上砍去====","你的血量："..p1.health.."/"..inithealth(self),"怪物血量："..p3.health)
		while p1.health >0 and p3.health > 0 do
          
		    if p1.health > 0 and p3.health > 0 then   
		        if p1.attack >30 then
		          	p1.attack = 30

		          	p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)
			          
		        else

					p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)
			        
		        end
            end

            if p1.health > 0 and p3.health > 0 then

		       p1,p3 = monsterattack(p1,p3)

		    end
        end
    else
        print("==== ☹︎"..p3.name.."☹︎ 向你张开了血盆大口====","怪物血量："..p3.health,"你的血量："..p1.health.."/"..inithealth(self))
   	    while p1.health >0 and p3.health > 0 do
   	    	
            if p1.health > 0 and p3.health > 0 then

		       p1,p3 = monsterattack(p1,p3)

		    end
          
            if p1.health > 0 and p3.health > 0 then
          	    if p1.attack >30 then
          	       p1.attack = 30

	               p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)

	            else
	         
	               p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)

                end
            end
        end
    end
    return p1,p3
end
-------------------------------------------------------------

--购物功能
article = {
    "请选择要购买的物品",
    {
    armor= {"锁子甲",1,200},
    sword= {"风暴剑",2,300},
    dragon= {"风暴龙",3,400},
    quit = {"退出",4}
    }
}
shoppingflag = false
function shopping(self,game,article,shopping)
	
  while shoppingflag==false do
  	prompt1(article)
	ret = option1(article)[1]
	if ret ~= "退出" then
        if ret == "锁子甲" then
            if self.armor < initarmor(self) then
	        	if self.gold >= 200 then
	        	self.armor = self.armor + 5 > initarmor(self) and initarmor(self) or self.armor + 5
	        	self.gold = self.gold - 200
	        	print("你的护甲：+5")
	        	else
	        		print("金币不足 你的金币："..self.gold)
	        	end
            else
            	print("你的护甲以达到最高不需要再购买"..ret)
            end
        elseif ret == "风暴剑" then
        	if self.attack < initattack(self) then
	        	if self.gold >= 300 then
	               self.attack = self.attack + 5 > initattack(self) and initattack(self) or self.attack + 5
	               self.gold = self.gold - 300
	               print("你的攻击：+5")
	            else
	            	print("金币不足 你的金币："..self.gold)
	            end
	        else
	        	print("你的攻击已经达到最高不需要再购买"..ret)
	        end
        elseif ret == "风暴龙" then
        	if self.gold >= 400 then
               self.speed = self.speed + 2
               self.gold = self.gold - 400
               print("你的速度：+2")
            else
            	print("金币不足 你的金币："..self.gold)
            end            
        end
    else
    	-- shoppingflag = true
    	-- move1(self,game,article)
    	return 0
    end
  end  
end
-------------------------------------------------------------

--战斗时调整
adjust =  {
    "你的回合",
    {
    attack= {"攻击",1},
    skill = {"技能",2},
    addhel= {"加血量",3},
    addpow= {"加蓝量",4},
    buy= {"购买道具",5},
    status= {"状态",6},
    quit = {"逃跑",7}
    }
}
adjustflag = false
function adjustment(self,p1,p3,adjust,adjustflag)
	while adjustflag == false do
		prompt(adjust)
		ret = option1(adjust)[1]
      if ret ~= "逃跑" then
        if ret == "加血量" then
        	p.addhel(p1)
        	print("你的血量："..p1.health.."/"..inithealth(self))
        elseif ret == "状态" then
        	status(self,p1)
        elseif ret == "购买道具" then
        	shopping(p1,game,article,shoppingflag)
        elseif ret == "加蓝量" then
            p.addpow(p1)
            print("你的蓝量："..p1.power.."/"..initpower(self))
        elseif ret == "技能" then  

            skills = {
	        "请选择技能,越强力的技能越能轻松打败敌人",
		    {
			    Spit = {"风暴之力",1,20},
			    Tone = {"巨龙撞击",2,40},
			    dragonplay= {"风舞九天",3,60},
			    dragonfly= {"飞龙在天",4,80},
			    -- buy= {"购买道具",5},
			    -- status= {"状态",6},
			    quit = {"退出",5}
			    }	    
		    }
			  while true do
			        prompt1(skills)
					ret = option1(skills)[1]
				  if ret ~= "退出" then
			        if ret == "风暴之力" then
			        	   local hurt = skills[2].Spit[3]
			        	if p1.power >= skills[2].Spit[3] then
				        	
				        	print("你的风暴之力对"..p3.name.."造成了少量伤害 生命值: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					        end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
				            return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))               

			                break
			            end
			        elseif ret == "巨龙撞击" then
			        	   local hurt = skills[2].Tone[3]
			        	if p1.power >=skills[2].Tone[3] then
				        	
				        	print("你的巨龙撞击对"..p3.name.."造成了适量伤害 生命值: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        elseif ret == "风舞九天" then
                           local hurt = skills[2].dragonplay[3]
			        	if p1.power >=skills[2].dragonplay[3] then
				        	
				        	print("你的风舞九天对"..p3.name.."造成了大量伤害 生命值: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        elseif ret == "飞龙在天" then
			        	   local hurt = skills[2].dragonfly[3]
			        	if p1.power >=skills[2].dragonfly[3] then
				        	
				        	print("你的飞龙在天对"..p3.name.."造成了巨量伤害 生命值: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        else
			            break
			        end
			      else
			        break
			      end 
			  end

        else
            p3.health = p3.health - p1.attack*(1-p3.armor/100)
            hurt = p1.attack*(1-p3.armor/100)
            if p3.health <= 0 then
	          	p3.health = 0
	          end
            print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
            print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
            return p1,p3
        end
	   else
			
			return p1,p3
	   end
    end
end
-------------------------------------------------------------

--释放技能
function skilltoenemy(self,p1,p3)
	    skills = {
	        "请选择技能,越强力的技能越能轻松打败敌人",
		    {
			    Spit = {"风暴之力",1,20},
			    Tone = {"巨龙撞击",2,40},
			    dragonplay= {"风舞九天",3,60},
			    dragonfly= {"飞龙在天",4,80},
			    -- buy= {"购买道具",5},
			    -- status= {"状态",6},
			    quit = {"退出",5}
			    }	    
		    }
			  while true do
			        prompt1(skills)
					ret = option1(skills)[1]
				  if ret ~= "退出" then
			        if ret == "风暴之力" then
			        	   local hurt = skills[2].Spit[3]
			        	if p1.power >= skills[2].Spit[3] then
				        	
				        	print("你的风暴之力对"..p3.name.."造成了少量伤害 生命值: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					        end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
				            return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))               

			                break
			            end
			        elseif ret == "巨龙撞击" then
			        	   local hurt = skills[2].Tone[3]
			        	if p1.power >=skills[2].Tone[3] then
				        	
				        	print("你的巨龙撞击对"..p3.name.."造成了适量伤害 生命值: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        elseif ret == "风舞九天" then
                           local hurt = skills[2].dragonplay[3]
			        	if p1.power >=skills[2].dragonplay[3] then
				        	
				        	print("你的风舞九天对"..p3.name.."造成了大量伤害 生命值: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        elseif ret == "飞龙在天" then
			        	   local hurt = skills[2].dragonfly[3]
			        	if p1.power >=skills[2].dragonfly[3] then
				        	
				        	print("你的飞龙在天对"..p3.name.."造成了巨量伤害 生命值: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余生命值: "..p3.health)
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        else
			            break
			        end
			      else
			        return p1,p3
			      end 
			  end
end

function monsterattack(p1,p3)
	local num = math.random(4)
	    if num == 3 then
            local num1 = math.random(2)
              if num1 == 1 then
		    	  p1.health = p1.health - p3.attack*1.1
		          if p1.health <= 0 then
		          	p1.health = 0
		          end
	              print("------"..p3.name.." 对 "..p1.name.." 发动口水攻击------")
		          print(p1.emojo.." "..p1.name.." 被吐了口水，口水中含有大量有毒细菌并且生命值: -"..p3.attack*(1.1).." 剩余生命值: "..p1.health)              
	          else
	          	  p1.health = p1.health - p3.attack*1.3
		          if p1.health <= 0 then
		          	p1.health = 0
		          end
	              print("------"..p3.name.." 对 "..p1.name.." 发动口气攻击------")
		          print(p1.emojo.." "..p1.name.." 被口气攻击,口气中含有大量毒气并且生命值: -"..p3.attack*(1.3).." 剩余生命值: "..p1.health)
		      end
	    else
	          p1.health = p1.health - p3.attack*(1-p1.armor/100)
	          if p1.health <= 0 then
	          	p1.health = 0
	          end
              print("------"..p3.name.." 对 "..p1.name.." 发动普通攻击------")
	          print(p1.emojo.." "..p1.name.." 被攻击并且生命值: -"..p3.attack*(1-p1.armor/100).." 剩余生命值: "..p1.health) 
		end
	return p1,p3  
end
-------------------------------------------------------------

--全局变量====
dead = false
getdragon = false
-------------------------------------------------------------

--主函数====
math.randomseed(os.time())
print("======好了又来到了打怪时间======")
description = [[
--------------简介----------------
    1.攻击力上限40
    2.护甲伤害减免上限50%
    3.升级后血量加满，蓝量每次升级加20
    4.所有的技能伤害都是真实伤害
    5.速度越快越能先手
    6.怪物也有护甲，越强力的怪物护甲越高
    ]]
print(description)
createmonster()
print("======取一个有个性的名字吧(不想取名的话直接按回车开始)======")
local changename = io.read()
-- print(type(changename))
local p = person.change(p,changename)


game = {
    "看看谁是下一个倒霉蛋!!",
    {
    up= {"向上移动",1},
    down= {"向下移动",2},
    left= {"向左移动",3},
    right= {"向右移动",4},
    addhel= {"加血量",5},
    addpow= {"加蓝量",6},
    status= {"状态",7},
    buy= {"购买道具",8},
    quit = {"退出",9}
    }
}
function Game(t)
	return t
end
function prompt(game)
	print '---------================================---------'
	print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',game[1]))
	print '---------选项---------'
    len = 0
    for k,v in pairs(game[2]) do
    	len = len + 1
    end
    for i=1,len do
    	for k,v in pairs(game[2])do
    		if i == v[2] then
		    print(v[2]..": "..v[1])
		    end
	    end
    end
	
	print '----------------------'
end
function prompt1(game)
	print '---------================================---------'
	print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',game[1]))
	print '---------选项---------'
    len = 0
    for k,v in pairs(game[2]) do
    	len = len + 1
    end
  for i=1,len do  
	for k,v in pairs(game[2])do
       if i == v[2] then
            if game[1] == "请选择要购买的物品" then
				if k ~= "quit" then
					v[3] = v[3] or ""
					print(v[2]..": "..v[1].." 价格: "..v[3].." 金币")
				else
					print(v[2]..": "..v[1])
			    end
            else
			    if k ~= "quit" then
					v[3] = v[3] or ""
					print(v[2]..": "..v[1].." 消耗: "..v[3].." 蓝量".." 造成: "..v[3].." 点真实伤害")
				else
					print(v[2]..": "..v[1])
			    end
			end
	   end
	end
  end
	print '---------------------'
end
function inputNum(game)
	num = io.read()
	_ret = nil
	for k,v in pairs(game[2]) do
        if tonumber(num) == v[2] then
            _ret = v 
          break
        else
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

function move1(self,p1,game,article,adjust,shoppingflag)
	while dead == false do
		prompt(game)
		ret = option1(game)[1]
	  if ret ~= "退出" then
        if ret == "加血量" then
        	p.addhel(p1)
        	print("你的血量："..p1.health.."/"..inithealth(self))
        elseif ret == "状态" then
        	status(self,p1)
        elseif ret == "购买道具" then
        	shopping(p1,game,article,shoppingflag)
        elseif ret == "加蓝量" then
        	p.addpow(p1)
        	print("你的血量："..p1.power.."/"..initpower(self))
        end
		if ret == "向上移动" then
			local num = math.random(6)
			if num == 1 then
               fight(self,p1,Gabriel,adjust)
            elseif num == 2 then
               print("====捡到宝箱 金币:+10====")
               p1.gold = p1.gold + 10
            elseif num == 3 then
               print("====走路吊儿郎当被人打 血量:-10====")
               p1.health = p1.health - 10 > 0 and p1.health - 10 or 1
            elseif num == 4 then
               print("====大吃一顿心情大好 血量:+20====")
               p1.health = p1.health + 20 > inithealth(self) and inithealth(self) or p1.health + 20
            elseif num == 5 then
               fight(self,p1,Goblin,adjust)
            else
            	print("====没有遇到怪物 下次可就没这么好运了====")
            end
        elseif ret == "向下移动" then
			local num = math.random(6)
			if num == 1 then
               fight(self,p1,Gabriel,adjust)
            elseif num == 2 then
               print("====遇到可怜的乞丐给了他一些钱 金币:-10====")
               p1.gold = p1.gold - 10 > 0 and p1.gold - 10 or 0
            elseif num == 3 then
               fight(self,p1,Goblin,adjust)
            elseif num == 4 then
               print("====打家劫舍抢得金钱 金币:+20====")
               p1.gold = p1.gold + 20
            elseif num == 5 then
                fight(self,p1,Goblin,adjust)
              
            else
            	print("====没有遇到怪物 下次可就没这么好运了====")
            end
        elseif ret == "向左移动" then
			local num = math.random(6)
			if num == 1 then
               fight(self,p1,Gabriel,adjust)
            elseif num == 2 then
               print("====和好友喝酒心情大好 蓝量:+20====")
               p1.gold = p1.gold + 10  
            elseif num == 3 then
               fight(self,p1,Goblin,adjust)
            elseif num == 4 then
               print("====走路不小心掉到井盖里 血量:-20====")
               p1.health = p1.health - 20 > 0 and p1.health - 20 or 1   
            elseif num == 5 then
               fight(self,p1,Ganunu,adjust)
              
            else
            	print("====没有遇到怪物 下次可就没这么好运了====")
            end
        elseif ret == "向右移动" then
			local num = math.random(6)
			if num == 1 then
               fight(self,p1,Goblin,adjust)
            elseif num == 2 then
            	if getdragon == false then
	               print("====巧遇一只远古巨龙 速度:+20====")
	               p1.speed = p1.speed + 20
	               getdragon = true
                else
                   print("====你已经拥有一只远古巨龙了，不要太贪心====")   
                end
            elseif num == 3 then
               fight(self,p1,Ganunu,adjust)
            elseif num == 4 then
                print("====真是踩到狗屎了捡到大宝箱金币++====")
                for i=1,10 do
               	print("====金币:+10====")
                p1.gold = p1.gold + 10
                end  
            elseif num == 5 then
               fight(self,p1,Cthulhu,adjust)
               
            else
            	print("====没有遇到怪物 下次可就没这么好运了====")
            end
        else

			-- local num = math.random(10)
			-- if num == 1 then
   --             fight(self,Gabriel)
               
   --          elseif num == 3 then
   --             fight(self,Goblin)
               
   --          elseif num == 5 then
   --             fight(self,Ganunu)
               
   --          elseif num == 7 then
   --             fight(self,Cthulhu)
               
   --          else
   --          	print("====没有遇到怪物 please keep move====")
   --          end
            -- print("你的血量："..self.health)
        end
      else
      	print('=======游戏结束=======')
        print('=======游戏退出 输入 os.exit() 退出整个系统=======')
        return 0
      end
    end
end
move1(p,p,game,article,adjust)

































































