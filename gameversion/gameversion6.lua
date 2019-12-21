-- 创建对象====
person = {name = "💩",health = 100,level = 0,experience = 0 ,emojo = "^_^",attack = 20,gold = 10000,speed = 10,armor = 0,power = 100,lifegold = 0,
attackname = "nil",armorname = "nil",speedname = "nil",handname = "nil",headname = "nil",wristname = "nil",shouldername="nil", cloalname="nil", 
legname = "nil",kneepadname = "nil",magicresistance = 0,talentpoint = 100,technology1 = 0,technology2 = 0,technology3 = 0,technology4 = 0,
magic1 = 0,magic2 = 0,magic3 = 0,magic4 = 0,talpoint = ""}
person.new = function(self)
	local tab = {}
	for k,v in pairs(self)do
		tab[k] = v
	end
	return tab
end
person.change = function(self,name,health,level,experience,emojo,attack,gold,speed,armor,magicresistance)
	self.name = name=="" and self.name or name
	self.health = health or self.health
	self.level = level or self.level
	self.experience = experience or self.experience
	self.emojo = emojo or self.emojo
	self.attack = attack or self.attack
	self.gold = gold or self.gold
	self.speed = speed or self.speed
	self.armor = armor or self.armor
	self.magicresistance = magicresistance or self.magicresistance
	return self
end
local p = person:new()
function createmonster()
	 Gabriel = person:new()
	 Gabriel = person.change(Gabriel,"加百力",20,1,10,"*_*",2,20,2,2,2)
	 Goblin = person:new()
	 Goblin = person.change(Goblin,"哥布林",40,5,20,"$_$",10,30,10,10,10)
	 Ganunu = person:new()
	 Ganunu = person.change(Ganunu,"加努努",60,10,50,"#_#",20,100,20,20,20)
	 Cthulhu = person:new()
	 Cthulhu = person.change(Cthulhu,"克苏鲁",80,15,100,"@_@",40,200,40,40,40)
	 Caikunxu = person:new()
	 Caikunxu = person.change(Caikunxu,"菜虚昆",100,30,300,"&_&",60,500,60,60,60)
end
-------------------------------------------------------------

--升级 添加基础功能
function inithealth(self,article)
	local wristvalue = 0
	local shouldervalue = 0
    for k,v in ipairs(article[2]) do
		if self.wristname == v[1] then
			wristvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		if self.shouldername == v[1] then
			shouldervalue = v[4]
			-- print("--------inithealth",v[4])
		end
		-- print("--------inithealth",k,v)
	end
    self.health = 100 + self.level + wristvalue+ shouldervalue
    return self.health
end
function initpower(self,article)
	-- for k,v in pairs(article[2]) do
	-- 	if self.cloalname == v[1] then
	--     self.power = 100 + self.level + v[4] 
	--     return self.power
	-- 	end
	-- end
	self.power = 100 + self.level 
	return self.power
end
function initarmor(self,article)
    
    local headvalue = 0
    local armorvalue = 0
    for k,v in ipairs(article[2]) do
		if self.headname == v[1] then
			headvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		if self.armorname == v[1] then
			armorvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		-- print("--------inithealth",k,v)
	end
	self.armor = 0 + headvalue + armorvalue
	if self.technology2 == 1 then
		return self.armor * 1.1
	else
        return self.armor
    end
end
function initattack(self,article)	
    local attackvalue = 0
    local handvalue = 0
    for k,v in ipairs(article[2]) do
		if self.attackname == v[1] then
			attackvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		if self.handname == v[1] then
			handvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		-- print("--------inithealth",k,v)
	end
	self.attack = self.attack + attackvalue + handvalue
	if self.technology1 == 1 then
		return self.attack * 1.1
	else
        return self.attack
    end
end
function initspeed(self,article)
	
	local speedvalue = 0
    local legvalue = 0
    for k,v in ipairs(article[2]) do
		if self.speedname == v[1] then
			attackvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		if self.legname == v[1] then
			legvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		-- print("--------inithealth",k,v)
	end
	self.speed = self.speed + speedvalue + legvalue
	if self.technology3 == 1 then
		return self.speed * 1.1
	else
        return self.speed
    end
end
function initmagicresistance(self,article)

	local cloalvalue = 0
    local kneepadvalue = 0
    for k,v in ipairs(article[2]) do
		if self.cloalname == v[1] then
			cloalvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		if self.kneepadname == v[1] then
			kneepadvalue = v[4]
			-- print("--------inithealth",v[4])
		end
		-- print("--------inithealth",k,v)
	end
	self.magicresistance = self.magicresistance + cloalvalue + kneepadvalue
	if self.technology4 == 1 then
		return self.magicresistance * 1.1
	else
        return self.magicresistance
    end

end
function inittalentpoint(self)
	
	return self.level
end
function initfun(self,val,article)
	if val == "attack" then
		self.attack = initattack(self,article)
		return self.attack
	elseif val == "armor" then
		self.armor = initarmor(self,article)
		return self.armor
	elseif val == "magicresistance" then
		self.magicresistance = initmagicresistance(self,article)
		return self.magicresistance
	elseif val == "speed" then
		self.speed = initspeed(self,article)
		return self.speed
	elseif val == "health" then
		self.health = inithealth(self,article)
		return self.health
	end
end
function status(self,p1)
    print("====血量❤️ : "..p1.health.."/"..inithealth(self,article))
    print("====蓝量💙: "..p1.power.."/"..initpower(self))
    print("====等级📶: "..p1.level)
    print("====金币💰: "..p1.gold)
    print("====经验📖: "..p1.experience.."/"..p1.level*10)
    print("====攻击🗡 : "..p1.attack)
    print("====护甲🛡 : "..p1.armor)
    print("====魔抗🔰: "..p1.magicresistance)
    print("====速度👟: "..p1.speed)
    print("====天赋💡: "..p1.talentpoint.."/"..p1.level)
    print("====复活💊: "..p1.lifegold)
end

function equipbar(self,p1)
    print("刀剑⚔️ :"..(self.attackname == "nil" and "无" or self.attackname), "拳套🥊:"..(self.handname == "nil" and "无" or self.handname))
    print("头盔⛑ :"..(self.headname == "nil" and "无" or self.headname), "胸甲🥋:"..(self.armorname == "nil" and "无" or self.armorname))
    print("手腕💪:"..(self.wristname == "nil" and "无" or self.wristname), "护肩👕:"..(self.shouldername == "nil" and "无" or self.shouldername))   
    print("腿甲👢:"..(self.legname == "nil" and "无" or self.legname), "护胫🎿:"..(self.speedname == "nil" and "无" or self.speedname))
    print("披风🧚‍♀️:"..(self.cloalname == "nil" and "无" or self.cloalname), "  护膝🏉:"..(self.kneepadname == "nil" and "无" or self.kneepadname))
end
addexpgloble = 0
p.addexp = function (self,p1,addexp)
    p1.experience = p1.experience + addexp
	while p1.experience >= p1.level*10 do
		p1.experience = p1.experience - p1.level*10
		p1.level = p1.level + 1
		p1.talentpoint = p1.talentpoint + 1
		print("----你升级了👑 等级："..p1.level.." 血量："..inithealth(self,article))
		p1.health = inithealth(self,article)
		p1.power = p1.power + 20 > initpower(self) and initpower(self) or p1.power + 20
		-- p.addatt(p1)
	end
	return p1
end
p.addhel = function (self)
 if self.health < inithealth(self,article) then
  if self.gold >= 100 then
    if self.health + 20 <= inithealth(self,article) then
    	self.health = self.health + 20
    else
    	self.health = inithealth(self,article)
    end
    self.gold = self.gold - 100
  else
  	print("💰不足: "..self.gold.." 需要金币: 100")
  end
    return self
 else
 	print("====你的血量已满不用添加血量====")
 end
end
p.autoaddhel = function (self)
	while self.health < 100 do

			if self.gold >= 100 then
			    if self.health + 20 <= inithealth(self,article) then
			    	self.health = self.health + 20
                    self.gold = self.gold - 100
			    else
			    	self.health = inithealth(self,article)
                    self.gold = self.gold - 100
			    end
			    
		    else
		  	    print("💰不足: "..self.gold.." 需要金币: 100")
		  	    return
		    end

	end
	return self
end
p.addpow = function (self)
 if self.power < initpower(self) then
  if self.gold >= 100 then
    if self.power + 20 <= initpower(self) then
    	self.power = self.power + 20
    else
    	self.power = initpower(self)
    end
    self.gold = self.gold - 100
  else
  	print("💰不足: "..self.gold.." 需要金币: 100")
  	return
  end
    return self
 else
 	print("====你的蓝量已满不用添加蓝量====")
 end
end
p.autoaddpow = function (self)
	while self.power < 100 do
		 -- if self.power < initpower(self) then
			  if self.gold >= 100 then
				    if self.power + 20 <= initpower(self) then
				    	self.power = self.power + 20
				    	self.gold = self.gold - 100
				    else
				    	self.power = initpower(self)
				    	self.gold = self.gold - 100
				    end
				    
			  else
			  	print("💰不足: "..self.gold.." 需要金币: 100")
			  end
		     
	end
	return self
end
p.addlife = function (self)
	if self.gold < 1000 then
		print("你的💰不足: "..self.gold.." 需要金币: 1000")
	else
		self.gold = self.gold - 1000
		self.lifegold = self.lifegold + 1
		print("====你购买了复活币====","复活币: +1")
	end
	return self
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
---------------------------------------------------------------------------
--天赋加点
talpoint = {
     "请选择要添加的天赋类型",
     {
     {"攻",1,0,"未激活",0,"未激活"},
     {"防",2,0,"未激活",0,"未激活"},
     {"速",3,0,"未激活",0,"未激活"},
     {"抗",4,0,"未激活",0,"未激活"},
     {"退回",5}
     }
 }
function numberOfTalents(p1,talpoint,addpoint)
     
	while true do
	    print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',talpoint[1]))
		print '---------选项---------'
		print("   类型  加点   技1     加点    技2")
		for k,v in pairs(talpoint[2])do
					if v[1] ~= "退回" then
						
						print(tonumber(v[2])..": "..v[1].."   "..v[3].."/10".."  "..v[4].."  "..v[5].."/20".."  "..v[6])
					else

						print(v[2]..": "..v[1])
				    end

	    end
		print '---------------------'
	    print '请选择: '
		num,_ret = inputNum2(talpoint)
		while num == nil or _ret == nil do
			print '输入无效，请再次输入(要输入提供的数字选择哦): '
			num,_ret = inputNum2(talpoint)
		end
	    ret = _ret[1]
	    if ret ~= "退回" then
	          if ret == "攻" then
	          	p1,tabval = getaddpoint(p1,talpoint[2][1],addpoint)
	               -- Gong(p1)
	          elseif ret == "防" then
	          	p1,tabval = getaddpoint(p1,talpoint[2][2],addpoint)
	               -- Fang(p1)
	          elseif ret == "速" then
	          	p1,tabval = getaddpoint(p1,talpoint[2][3],addpoint)
	               -- Su(p1)
	          elseif ret == "抗" then
	          	p1,tabval = getaddpoint(p1,talpoint[2][4],addpoint)
	               -- Ji(p1)
	          end
	    else
	    	return p1,talpoint
	    end

	end
end
function Gong(p1,talpoint)
	
	return p1
end
function Fang(p1,talpoint)
	
	return p1
end
function Su(p1,talpoint)
	
	return p1
end
function Ji(p1,talpoint)
	
	return p1
end
addpoint = {
"请选择要添加的天赋点数",
	{
	{"添加一点",1},
	{"添加五点",2},
	{"添加十点",3},
	{"退回",4}
}
}
function getaddpoint(p1,tabval,addpoint)

   while true do
	    print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',addpoint[1]))
		print '---------选项---------'
		-- print("   类型  加点  技1    加点   技2")
		for k,v in pairs(addpoint[2])do
					if v[1] ~= "退回" then
						
						print(tonumber(v[2])..": "..v[1])
					else

						print(v[2]..": "..v[1])
				    end

	    end
		print '---------------------'
	    print '请选择: '
		num,_ret = inputNum2(addpoint)
		while num == nil or _ret == nil do
			print '输入无效，请再次输入(要输入提供的数字选择哦): '
			num,_ret = inputNum2(addpoint)
		end
	    ret = _ret[1]
	    if ret ~= "退回" then
	          if ret == "添加一点" then
	               p1,tabval = addpoint1(p1,tabval)
	          elseif ret == "添加五点" then
	               p1,tabval = addpoint5(p1,tabval)
	          elseif ret == "添加十点" then
	               p1,tabval = addpoint10(p1,tabval)
	          end
	    else
	    	return p1,tabval
	    end

	end

end
function addpointcount(p1,tabval)
	if tabval[3]<10 then
		if tabval[1] == "攻" then
			p1.attack = p1.attack + 1
			p1.attack = initattack(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[3] = tabval[3] + 1
			if tabval[3] == 10 then
			   tabval[4] = "已激活"
			   print("====解锁技能：总攻击+10%====")
			   p1.technology1 = 1	
			end
		elseif tabval[1] == "防" then
	        p1.armor = p1.armor + 1
	        p1.armor = initarmor(p1,article)
	        -- p1.magicresistance = p1.magicresistance + 0.5
			p1.talentpoint = p1.talentpoint - 1
			tabval[3] = tabval[3] + 1
			if tabval[3] == 10 then
			   tabval[4] = "已激活"
			   print("====解锁技能：总物防+10%====")
			   p1.technology2 = 1	
			end
		elseif tabval[1] == "速" then
	        p1.speed = p1.speed + 1
	        p1.speed = initspeed(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[3] = tabval[3] + 1
			if tabval[3] == 10 then
			   tabval[4] = "已激活"
			   print("====解锁技能：总速度+10%====")	
			   p1.technology3 = 1
			end
		elseif tabval[1] == "抗" then
	        p1.magicresistance = p1.magicresistance + 1
	        p1.magicresistance = initmagicresistance(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[3] = tabval[3] + 1
			if tabval[3] == 10 then
			   tabval[4] = "已激活"
			   print("====解锁技能：总魔防+10%====")	
			   p1.technology4 = 1
			end
		end

    elseif tabval[4] == "已激活" and tabval[5] < 20 then
		if tabval[1] == "攻" then
			p1.attack = p1.attack + 1
			p1.attack = initattack(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[5] = tabval[5] + 1
			if tabval[5] == 20 then
				tabval[6] = "已激活"
				p1.magic1 = 1
				print("====此天赋已加满====")
				print("====解锁技能：遇怪总能先手====")
		    end
		elseif tabval[1] == "防" then
	        p1.armor = p1.armor + 1
	        p1.armor = initarmor(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[5] = tabval[5] + 1
			if tabval[5] == 20 then
				tabval[6] = "已激活"
				p1.magic2 = 1
				print("====此天赋已加满====")
				print("====解锁技能：能挡怪物的首次物理攻击====")
		    end
		elseif tabval[1] == "速" then
	        p1.speed = p1.speed + 1
	         p1.speed = initspeed(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[5] = tabval[5] + 1
			if tabval[5] == 20 then
				tabval[6] = "已激活"
				p1.magic3 = 1
				print("====此天赋已加满====")
				print("====解锁技能：逃跑必成功====")
		    end
		elseif tabval[1] == "抗" then
	        p1.magicresistance = p1.magicresistance + 1
	        p1.magicresistance = initmagicresistance(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[5] = tabval[5] + 1
			if tabval[5] == 20 then
				tabval[6] = "已激活"
				p1.magic4 = 1
				print("====此天赋已加满====")
				print("====解锁技能：能挡怪物的首次魔法攻击====")
		    end
		end       
    end

	return p1,tabval
end
function addpoint1(p1,tabval)
	if tabval[5] == 20 then
		print("----你的此天赋已经加满----")
	else
		if p1.talentpoint > 0 then
			p1,tabval = addpointcount(p1,tabval)
			print("----天赋添加点数：".."1".." 天赋剩余点数："..p1.talentpoint)
	    else
			print("====天赋点不足====")
		end
	end
	return p1,tabval
end
function addpoint5(p1,tabval)
	if tabval[5] == 20 then
		print("----你的此天赋已经加满----")
	else
		if p1.talentpoint > 0 then
			if p1.talentpoint < 5 then
			    local num = p1.talentpoint
				for i=1,p1.talentpoint do
					
						p1,tabval = addpointcount(p1,tabval)            
				end
		        print("----天赋添加点数："..num.." 天赋剩余点数："..p1.talentpoint)
			else
				for i=1,5 do
					
						p1,tabval = addpointcount(p1,tabval)
				    
			    end
			    print("----天赋添加点数：".."5".." 天赋剩余点数："..p1.talentpoint)
			end
		else
	       print("====天赋点不足====")
		end
	end
	return p1,tabval
end
function addpoint10(p1,tabval)
	if tabval[5] == 20 then
		print("----你的此天赋已经加满----")
	else
		if p1.talentpoint > 0 then
			if p1.talentpoint < 10 then
			local num = p1.talentpoint 
				for i=1,p1.talentpoint do
					
						p1,tabval = addpointcount(p1,tabval)
				    
				end
				print("----天赋添加点数："..num.." 天赋剩余点数："..p1.talentpoint)
			else
				for i=1,10 do
					
						p1,tabval = addpointcount(p1,tabval)
				    
			    end
			    print("----天赋添加点数：".."10".." 天赋剩余点数："..p1.talentpoint)
			end
		else
	       print("====天赋点不足====")
		end
	end
	return p1,tabval
end
-------------------------------------------------------------

--购物功能
article = {
    "请选择要购买的物品",
    {
    {"新手风暴剑",1,200,10,"攻击","刀剑"},
    {"强化风暴剑",2,400,20,"攻击","刀剑"},
    {"老手风暴剑",3,900,30,"攻击","刀剑"},
    {"大师风暴剑",4,1200,40,"攻击","刀剑"},
    {"新手正义冲拳",5,200,10,"攻击","拳套"},
    {"强化正义冲拳",6,400,20,"攻击","拳套"},
    {"老手正义冲拳",7,900,30,"攻击","拳套"},
    {"大师正义冲拳",8,1200,40,"攻击","拳套"},    
    {"新手正义头盔",9,200,10,"护甲","头盔"},
    {"强化正义头盔",10,400,20,"护甲","头盔"},
    {"老手正义头盔",11,500,30,"护甲","头盔"},
    {"大师正义头盔",12,1000,40,"护甲","头盔"},
    {"新手锁子甲",13,200,10,"护甲","胸甲"},
    {"强化锁子甲",14,400,20,"护甲","胸甲"},
    {"老手锁子甲",15,500,30,"护甲","胸甲"},
    {"大师锁子甲",16,1000,40,"护甲","胸甲"},
    {"新手纳什力腕",17,200,10,"血量","手腕"},
    {"强化纳什力腕",18,400,20,"血量","手腕"},
    {"老手纳什力腕",19,500,30,"血量","手腕"},
    {"大师纳什力腕",20,1000,50,"血量","手腕"},
    {"新手龙骨护肩",21,200,10,"血量","护肩"},
    {"强化龙骨护肩",22,400,20,"血量","护肩"},
    {"老手龙骨护肩",23,500,30,"血量","护肩"},
    {"大师龙骨护肩",24,1000,50,"血量","护肩"},
    {"新手灵光披风",25,200,10,"魔抗","披风"},
    {"强化灵光披风",26,400,20,"魔抗","披风"},
    {"老手灵光披风",27,500,30,"魔抗","披风"},
    {"大师灵光披风",28,1000,50,"魔抗","披风"},
    {"新手荣耀护膝",29,200,10,"魔抗","护膝"},
    {"强化荣耀护膝",30,400,20,"魔抗","护膝"},
    {"老手荣耀护膝",31,500,30,"魔抗","护膝"},
    {"大师荣耀护膝",32,1000,50,"魔抗","护膝"},
    {"新手壮士力腱",33,200,10,"速度","腿甲"},
    {"强化壮士力腱",34,400,20,"速度","腿甲"},
    {"老手壮士力腱",35,500,30,"速度","腿甲"},
    {"大师壮士力腱",36,1000,50,"速度","腿甲"},  
    {"新手风暴鞋",37,100,10,"速度","鞋"},
    {"强化风暴鞋",38,200,20,"速度","鞋"},
    {"老手风暴鞋",39,400,30,"速度","鞋"},
    {"大师风暴鞋",40,800,40,"速度","鞋"},
    {"退回",41}
    }
}
function option2(article)
	print '请选择: '
	num,_ret = inputNum2(article)
	while num == nil or _ret == nil do
		print '输入无效，请再次输入(要输入提供的数字选择哦): '
		num,_ret = inputNum2(article)
	end
	return _ret
end
function inputNum2(article)
	num = io.read()
	_ret = nil
	for k,v in pairs(article[2]) do
        if tonumber(num) == v[2] then
            _ret = v 
          break
        else
            _ret = nil
        end
    end
    return num,_ret
end
function prompt2(game)
	
	print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',game[1]))
	print '---------选项---------'
	for k,v in pairs(game[2])do
				if v[1] ~= "退回" then
					v[3] = v[3] or ""
					print(string.format("%2d",tonumber(v[2]))..": "..v[1].." 价格: "..string.format("%4d",tonumber(v[3])).." 金币".." 加成: "..string.format("%3d",tonumber(v[4])).." "..v[5])
				else
					print(v[2]..": "..v[1])
			    end
			    if k % 4 == 0 then
			    print("----------------------")
			    end          
    end
	print '---------------------'
end
function changeequipment(self,equipname,equipattrib,v,article)
	if self.gold >= v[3] then
		local equipname = tostring(equipname)
		local equipattrib = tostring(equipattrib)
	   if self[equipname] == "" then	
    	    self[equipname] = v[1]	        	
        	self[equipattrib] = self[equipattrib] + v[4]
        	self[equipattrib] = initfun(self,equipattrib)
        	self.gold = self.gold - v[3]
        	print("购买了"..v[1].."你的"..v[5].."：+"..v[4].." 你的金币："..self.gold)
       else
            for m,n in pairs(article[2]) do
            	if n[1] == self[equipname] then
            		self[equipattrib] = self[equipattrib] - n[4]
            		self.gold = self.gold + n[3]*0.7
                    print("回收"..self[equipname].."装备 金币：+"..tostring(n[3]*0.7).." 你的金币："..self.gold)
            	end
            end
            self[equipname] = v[1]	        	
        	self[equipattrib] = self[equipattrib] + v[4]
        	self[equipattrib] = initfun(self,equipattrib,article)
        	self.gold = self.gold - v[3]
        	print("购买了"..v[1].."你的"..v[5].."：+"..v[4].." 你的金币："..self.gold)
       end
	else
		print("💰不足 你的金币："..self.gold)
	end
end
function shopping(self,game,article,shopping)
	
  while shoppingflag==false do
  	print '---------===============购物菜单=================---------'
  	prompt2(article)
	ret = option2(article)
	if ret[1] ~= "退回" then
		for k,v in pairs(article[2]) do
	        if ret[1] == v[1] then
	        -- handname = "",headname = "",wristname = "",shouldername="", cloalname="", legname = ""
	        	if v[6] == "刀剑" then
		        	changeequipment(self,"attackname","attack",v,article)
		        elseif v[6] == "胸甲" then
		        	changeequipment(self,"armorname","armor",v,article)
		        elseif v[6] == "鞋" then
		        	changeequipment(self,"speedname","speed",v,article)
                elseif v[6] == "拳套" then
		        	changeequipment(self,"handname","attack",v,article)
		        elseif v[6] == "手腕" then
		        	changeequipment(self,"wristname","health",v,article)
		        elseif v[6] == "护肩" then
		        	changeequipment(self,"shouldername","health",v,article)
		        elseif v[6] == "披风" then
		        	changeequipment(self,"cloalname","magicresistance",v,article)
		        elseif v[6] == "腿甲" then
		        	changeequipment(self,"legname","speed",v,article)
		        elseif v[6] == "头盔" then
		        	changeequipment(self,"headname","armor",v,article)
		        elseif v[6] == "护膝" then
		        	changeequipment(self,"kneepadname","magicresistance",v,article)
		        end
     
	        end
	    end
    else
    	
    	return 0
    end
  end  
end
-------------------------------------------------------------

--战斗状态功能
function fight(self,p1,p2,adjust)
	local p3 = {}
	for k,v in pairs(p2)do
		p3[k] = v
	end
	    p1,p3 = fightTime(self,p1,p3,adjust)
        if escapeflag == false then			    
			    if p3.health <= 0 then
			    	print("--------==!!战斗胜利!!==--------")
			    	print("💰: +"..p3.gold.." 经验: +"..p3.experience)
			    end
			    if p1.health > 0 then
			    	p.addexp(self,p1,p3.experience)
			    	p1.gold = p1.gold + p3.gold
			
			    else
                    if p1.lifegold >= 1 then
			            print("====you are died====是否使用复活币复活: 1.是,2.否(直接输入数字即可）")
			            local inputlife = io.read()
			            if inputlife == "1" then
			           	  p1.health = inithealth(self,article)
			           	  p1.power = initpower(self)
			           	  p1.lifegold = p1.lifegold - 1
			           	  print("========复活成功又可以开心的玩耍了========","复活币: -1")
			            else
			            	dead = true
			            end
                    elseif p1.gold >= 1000 then
                    	print("====you are died====是否使用1000金币复活: 1.是,2.否(直接输入数字即可）")
			            local inputlife = io.read()
			            if inputlife == "1" then
			           	  p1.health = inithealth(self,article)
			           	  p1.power = initpower(self)
			           	  p1.gold = p1.gold - 1000
			           	  print("========复活成功又可以开心的玩耍了========","金币: -1000")
			            else
			            	dead = true
			            end
                    else	
                       print('--------没有复活币也没有足够的金钱复活,你只能被怪物们吃掉了--------')
			           dead = true
			        end
			    end
	    else
	      
	       escapeflag = false
	    end  
    return p1  
end

function fightTime(self,p1,p3,adjust)
	local magicflag = false
    if p1.magic1 == 1 then
    	    print("===="..os.date("%Y/%m/%d %H:%M:%S").."你遇到了 ⬈"..p3.name.."⬉ 你的百米长的大刀正向他们头上砍去====","你的血量："..p1.health.."/"..inithealth(self,article),"怪物血量："..p3.health)
			while p1.health >0 and p3.health > 0 and escapeflag==false do
	          
			    if p1.health > 0 and p3.health > 0 then   
						p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)
						
							if p1.health > 0 and p3.health > 0 and escapeflag==false then
						       p1,p3 = monsterattack(p1,p3)
						    end	
	        
	            end            

	        end
	else
		if p1.speed >= p3.speed then
	        print("===="..os.date("%Y/%m/%d %H:%M:%S").."你遇到了 ⬈"..p3.name.."⬉ 你的百米长的大刀正向他们头上砍去====","你的血量："..p1.health.."/"..inithealth(self,article),"怪物血量："..p3.health)
			while p1.health >0 and p3.health > 0 and escapeflag==false do
	          
			    if p1.health > 0 and p3.health > 0 then   
						p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)

						
							if p1.health > 0 and p3.health > 0 and escapeflag==false then
						       p1,p3 = monsterattack(p1,p3)
						    end
		        
	            end            

	        end
	    else
	        print("===="..os.date("%Y/%m/%d %H:%M:%S").." ☹︎"..p3.name.."☹︎ 向你张开了血盆大口====","怪物血量："..p3.health,"你的血量："..p1.health.."/"..inithealth(self,article))
	   	    while p1.health >0 and p3.health > 0 and escapeflag==false do
	        
	            if p1.health > 0 and p3.health > 0 then

				
			            if p1.health > 0 and p3.health > 0 and escapeflag==false then
					       p1,p3 = monsterattack(p1,p3)
					    end
					end	         
		               p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)


	        end
	    end

    end
    return p1,p3
end
-------------------------------------------------------------

--战斗时调整
adjust =  {
    "你的回合",
    {
    autoattack = {"自动攻击",1},
    autoaddpow = {"自动加蓝量",2},
    autoaddhel = {"自动加血量",3},
    attack= {"攻击",4},
    skill = {"技能",5},
    addhel= {"加血量",6},
    addpow= {"加蓝量",7},
    buy= {"购买装备",8},
    addlife= {"购买复活币",9},
    status= {"状态",10},
    quit = {"逃跑",11}
    }
}
adjustflag = false
escapeflag = false
function adjustment(self,p1,p3,adjust,adjustflag)

	while p1.health > 0 and p3.health > 0 and escapeflag==false do
		print '---------===============战斗菜单=================---------'
		skills = {
		        "请选择技能,越强力的技能越能轻松打败敌人",
			    {
				    Spit = {"风暴之力",1,20},
				    Tone = {"巨龙撞击",2,40},
				    dragonplay= {"风舞九天",3,60},
				    dragonfly= {"飞龙在天",4,80},
				    mustkill= {"鸡你太美",5,100},
				    -- status= {"状态",6},
				    quit = {"退出",6}
				    }	    
			    }
		prompt(adjust)
		ret = option1(adjust)[1]
        if ret ~= "逃跑" then
	        if ret == "加血量" then
	        	p1 =p.addhel(p1)
	        	print("你的血量："..p1.health.."/"..inithealth(self,article))
	        elseif ret == "状态" then
	        	status(self,p1)
	        elseif ret == "购买装备" then
	        	shopping(p1,game,article,shoppingflag)
	        elseif ret == "加蓝量" then
	            p1 =p.addpow(p1)
	            print("你的蓝量："..p1.power.."/"..initpower(self))
	        elseif ret == "自动加蓝量" then
	            p1 = p.autoaddpow(p1)
	            print("你的蓝量："..p1.power.."/"..initpower(self))
	        elseif ret == "自动加血量" then
	            p1 = p.autoaddhel(p1)
	            print("你的血量："..p1.health.."/"..inithealth(self,article))
	        elseif ret == "购买复活币" then
	            p1 =p.addlife(p1)
	            print("你的剩余复活币："..p1.lifegold)
	        elseif ret == "技能" then  
	            
				  while true do
				  	print '---------===============技能菜单=================---------'
				        prompt1(skills)
						ret = option1(skills)[1]
					  if ret ~= "退出" then
				        if ret == "风暴之力" then
				        	   local hurt = skills[2].Spit[3]*100/(100+p3.magicresistance)
				        	   hurt = string.format("%.2f",hurt)
				        	if p1.power >= skills[2].Spit[3] then
					        	
					        	print("你的风暴之力对"..p3.name.."造成了少量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						        end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
					            return p1,p3
				            else
				            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))               

				                break
				            end
				        elseif ret == "巨龙撞击" then
				        	   local hurt = skills[2].Tone[3]*100/(100+p3.magicresistance)
				        	   hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].Tone[3] then
					        	
					        	print("你的巨龙撞击对"..p3.name.."造成了适量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        elseif ret == "风舞九天" then
	                           local hurt = skills[2].dragonplay[3]*100/(100+p3.magicresistance)
	                           hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].dragonplay[3] then
					        	
					        	print("你的风舞九天对"..p3.name.."造成了大量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        elseif ret == "飞龙在天" then
				        	   local hurt = skills[2].dragonfly[3]*100/(100+p3.magicresistance)
				        	   hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].dragonfly[3] then
					        	
					        	print("你的飞龙在天对"..p3.name.."造成了巨量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        elseif ret == "鸡你太美" then
			        	       local hurt = skills[2].mustkill[3]*100/(100+p3.magicresistance)
			        	       hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].mustkill[3] then
					        	
					        	print("你的鸡你太美对"..p3.name.."造成了巨大的伤害 血量: -"..p3.health)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被🏀 攻击并且生命值为: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
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

	        elseif ret == "攻击" then
	            p3.health = p3.health - p1.attack/(p3.armor+100)*100
	            hurt = p1.attack/(p3.armor+100)*100
	            hurt = string.format("%.2f",hurt)
	            if p3.health <= 0 then
		          	p3.health = 0
		        end
	            print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
	            print(p3.emojo.." "..p3.name.." 被攻击并且血量: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
	            return p1,p3
	        else
                while p1.health > 0 and p3.health > 0 and escapeflag==false do
                	if p1.health <= p3.attack*1.3*100/(100+p1.magicresistance) or p1.health<= p3.attack*100/(100+p1.armor) then
                		print("------生命值较低，请手动操作------")
                	   break
                	elseif p3.health <= p1.attack/(100+p3.armor)*100 then
                	    p3.health = p3.health - p1.attack/(100+p3.armor)*100
			            hurt = p1.attack/(100+p3.armor)*100
			            hurt = string.format("%.2f",hurt)
			            if p3.health <= 0 then
				          	p3.health = 0
				        end
			            print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			            print(p3.emojo.." "..p3.name.." 被攻击并且血量: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
			        elseif p3.health <= 40 then
                        if p3.attack <= 40 then
                           p3.health = p3.health - p1.attack/(100+p3.armor)*100
				            hurt = p1.attack/(100+p3.armor)*100
				            hurt = string.format("%.2f",hurt)
				            if p3.health <= 0 then
					          	p3.health = 0
					        end
				            print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
				            print(p3.emojo.." "..p3.name.." 被攻击并且血量: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
                        else
                        	local hurt = skills[2].Tone[3]*100/(100+p3.magicresistance)
                        	hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].Tone[3] then
					        	
					        	print("你的巨龙撞击对"..p3.name.."造成了适量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")				                
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				            else
				            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))
				                break
				            end
				        end
				    elseif p3.health <= 60 then
				    	if p3.attack <= 20 then
				    		p3.health = p3.health - p1.attack/(100+p3.armor)*100
				            hurt = p1.attack/(100+p3.armor)*100
				            hurt = string.format("%.2f",hurt)
				            if p3.health <= 0 then
					          	p3.health = 0
					        end
				            print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
				            print(p3.emojo.." "..p3.name.." 被攻击并且血量: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				        else
                            local hurt = skills[2].dragonplay[3]*100/(100+p3.magicresistance)
                            hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].dragonplay[3] then
					        	
					        	print("你的风舞九天对"..p3.name.."造成了大量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        end
				    elseif p3.health <= 80 then
				    	local hurt = skills[2].dragonfly[3]*100/(100+p3.magicresistance)
				    	hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].dragonfly[3] then
					        	
					        	print("你的飞龙在天对"..p3.name.."造成了巨量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				    else
				    	local hurt = skills[2].mustkill[3]*100/(100+p3.magicresistance)
				    	hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].mustkill[3] then
					        	
					        	print("你的鸡你太美对"..p3.name.."造成了无限的伤害 血量: -"..p3.health)
					            p3.health = p3.health - p3.health
					            p1.power = p1.power - hurt
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动必杀绝技------")
				                print(p3.emojo.." "..p3.name.." 被🏀 攻击并且直接生命值为: 0")
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				    end
				    if p1.health >0 and p3.health >0 then
				    monsterattack(p1,p3)
				    end
                end
	        end
	    else
	    	if p1.magic3 == 1 then
	    		print("====逃跑成功====")
				escapeflag = true
				return p1,p3
		    else
		    	local escapnum = math.random(3)
		    	if escapnum == 2 then
			    	print("====逃跑成功====")
					escapeflag = true
					return p1,p3
				else
					print(p3.name.."在你逃跑的路上绊了你一跤----逃跑失败----")
					escapeflag = false
					return p1,p3
				end
			end
	    end
    end
    return p1,p3
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
			    mustkill= {"鸡你太美",5},
			    -- status= {"状态",6},
			    quit = {"退回",6}
			    }	    
		    }
			  while true do
			        prompt1(skills)
					ret = option1(skills)[1]
				  if ret ~= "退回" then
			        if ret == "风暴之力" then
			        	   local hurt = skills[2].Spit[3]
			        	if p1.power >= skills[2].Spit[3] then
				        	
				        	print("你的风暴之力对"..p3.name.."造成了少量伤害 血量: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					        end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				            return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))               

			                break
			            end
			        elseif ret == "巨龙撞击" then
			        	   local hurt = skills[2].Tone[3]
			        	if p1.power >=skills[2].Tone[3] then
				        	
				        	print("你的巨龙撞击对"..p3.name.."造成了适量伤害 血量: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        elseif ret == "风舞九天" then
                           local hurt = skills[2].dragonplay[3]
			        	if p1.power >=skills[2].dragonplay[3] then
				        	
				        	print("你的风舞九天对"..p3.name.."造成了大量伤害 血量: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        elseif ret == "飞龙在天" then
			        	   local hurt = skills[2].dragonfly[3]
			        	   hurt = string.format("%.2f",hurt)
			        	if p1.power >=skills[2].dragonfly[3] then
				        	
				        	print("你的飞龙在天对"..p3.name.."造成了巨量伤害 血量: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
			                return p1,p3
			            else
			            	print("你的蓝量不足"..hurt.." 剩余："..p1.power.."/"..initpower(self))

			                break
			            end
			        elseif ret == "鸡你太美" then
			        	   local hurt = skills[2].dragonfly[3]
			        	   hurt = string.format("%.2f",hurt)
			        	if p1.power >=skills[2].dragonfly[3] then
				        	
				        	print("你的飞龙在天对"..p3.name.."造成了巨量伤害 血量: -"..hurt)
				            p3.health = p3.health - hurt
				            p1.power = p1.power - hurt
				            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
				            if p3.health <= 0 then
					          	p3.health = 0
					          end
			                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
			                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
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
	    	if p1.magic4 == 1 and magicflag == false then
                    print("====你的防御技能生效抵挡了"..p3.name.."的技能攻击====")
                    magicflag = true
		    else
	            local num1 = math.random(2)
	              if num1 == 1 then
	              	local hurt = p3.attack*1.1*100/(100+p1.magicresistance)
	              	hurt = string.format("%.2f",hurt)
			    	  p1.health = p1.health - hurt
			          if p1.health <= 0 then
			          	p1.health = 0
			          end
		              print("------"..p3.name.." 对 "..p1.name.." 发动口水攻击------")
			          print(p1.emojo.." "..p1.name.." 被吐了口水，口水中含有大量有毒细菌并且血量: -"..hurt.." 剩余生命值: "..string.format("%.2f",p1.health))              
		          else
		          	  local hurt = p3.attack*1.3*100/(100+p1.magicresistance)
		          	  hurt = string.format("%.2f",hurt)
		          	  p1.health = p1.health - hurt
			          if p1.health <= 0 then
			          	p1.health = 0
			          end
		              print("------"..p3.name.." 对 "..p1.name.." 发动口气🗣 攻击------")
			          print(p1.emojo.." "..p1.name.." 被口气攻击,口气中含有大量毒气并且血量: -"..hurt.." 剩余生命值: "..string.format("%.2f",p1.health))
			      end
			end
	    else
	    	if p1.magic2 == 1 and magicflag == false then
                    print("====你的物理防御技能生效抵挡了"..p3.name.."的普通攻击====")
                    magicflag = true
			else
	    	  local hurt = p3.attack*100/(100+p1.armor)
	    	  hurt = string.format("%.2f",hurt)
	          p1.health = p1.health - hurt
	          if p1.health <= 0 then
	          	p1.health = 0
	          end
              print("------"..p3.name.." 对 "..p1.name.." 发动普通攻击------")
	          print(p1.emojo.." "..p1.name.." 被攻击并且血量: -"..hurt.." 剩余生命值: "..string.format("%.2f",p1.health)) 
		    end
		end
	return p1,p3  
end
-------------------------------------------------------------

--全局变量====
dead = false
getdragon = false
getlifegold = false
shoppingflag = false
-- os.execute("touch "..os.getenv("HOME").."/Desktop/savegame.lua")
-------------------------------------------------------------

--主函数====
math.randomseed(os.time())
-- 💣☄️💥🔥🌪
print("======好了又来到了打怪时间======")
description = [[
--------------简介----------------
    1.升级后血量加满，蓝量每次升级加20
    2.速度越快越能先手
    3.怪物也有护甲，越强力的怪物护甲越高
    4.在主菜单中退出可以保存进度
    ]]
print(description)
createmonster()



game = {
    "看看谁是下一个倒霉蛋!!",
    {
    up= {"向上移动",1},
    down= {"向下移动",2},
    left= {"向左移动",3},
    right= {"向右移动",4},
    makemoney= {"这儿的怪太强了",5},
    autoaddpow = {"自动加蓝量",6},
    autoaddhel = {"自动加血量",7},
    addhel= {"加血量",8},
    addpow= {"加蓝量",9},
    status= {"状态",10},
    equipbar= {"装备栏",11},
    buy= {"购买道具",12},
    addlife= {"购买复活币",13},
    numberoftalents= {"天赋树",14},
    quit = {"退出",15}
    }
}
function prompt(game)
	-- print '---------================================---------'
	print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',game[1]))
	print '---------选项---------'
    len = 0
    for k,v in pairs(game[2]) do
    	len = len + 1
    end
    for i=1,len do
    	for k,v in pairs(game[2])do
    		if i == v[2] then
		    print(string.format("%2d",v[2])..": "..v[1])
		    end
	    end
    end
	
	print '----------------------'
end
function prompt1(game)
	-- print '---------================================---------'
	print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',game[1]))
	print '---------选项---------'
    len = 0
    for k,v in pairs(game[2]) do
    	len = len + 1
    end
  for i=1,len do  
	for k,v in pairs(game[2])do
       if i == v[2] then

			    if k ~= "quit" then
			    	if k ~= "mustkill" then
					v[3] = v[3] or ""
					print(string.format("%2d",v[2])..": "..v[1].." 消耗: "..string.format("%3d",v[3]).." 蓝量".." 造成: "..v[3].." 点真实伤害")
				    else
					print(string.format("%2d",v[2])..": "..v[1].." 消耗: "..string.format("%3d",v[3]).." 蓝量".." 功能: 直接秒杀怪物")
			        end
			    else
			    	print(string.format("%2d",v[2])..": "..v[1])
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

function move1(self,p1,game,article,adjust,talpoint,addpoint)
	while dead == false do
		print '---------===============主菜单=================---------'
		prompt(game)
		ret = option1(game)[1]
	    if ret ~= "退出" then
	        if ret == "加血量" then
	        	p1 =p.addhel(p1)
	        	print("你的血量："..p1.health.."/"..inithealth(self,article))
	        elseif ret == "状态" then
	        	status(self,p1)
	        elseif ret == "装备栏" then
	        	equipbar(self,p1)
	        elseif ret == "购买道具" then
	        	shopping(p1,game,article,shoppingflag)
	        elseif ret == "加蓝量" then
	        	p1 =p.addpow(p1)
	        	print("你的蓝量："..p1.power.."/"..initpower(self))
	        elseif ret == "自动加蓝量" then
	            p1 =p.autoaddpow(p1)
	            print("你的蓝量："..p1.power.."/"..initpower(self))
	        elseif ret == "自动加血量" then
	            p1 =p.autoaddhel(p1)
	            print("你的血量："..p1.health.."/"..inithealth(self,article))
	        elseif ret == "购买复活币" then
	        	p1 =p.addlife(p1)
	        	print("你的剩余复活币："..p1.lifegold)
	        elseif ret == "天赋树" then
	        	p1,talpoint =numberOfTalents(p1,talpoint,addpoint)
	        	p1.talpoint = talpoint
	        	-- print("你的剩余复活币："..p1.lifegold)
	        end
			if ret == "向上移动" then
				local num = math.random(6)
				if num == 1 then
	               fight(self,p1,Gabriel,adjust)
	            elseif num == 2 then
	               print("====捡到宝箱 💰:+10====")
	               p1.gold = p1.gold + 10
	            elseif num == 3 then
	               print("====走路吊儿郎当被人打 血量:-10====")
	               p1.health = p1.health - 10 > 0 and p1.health - 10 or 1
	            elseif num == 4 then
	               print("====大吃一顿心情大好 血量:+20====")
	               p1.health = p1.health + 20 > inithealth(self,article) and inithealth(self,article) or p1.health + 20
	            elseif num == 5 then
	               fight(self,p1,Goblin,adjust)
	            else
	            	-- print("====没有遇到怪物 下次可就没这么好运了====")
	            	fight(self,p1,Gabriel,adjust)
	            end
	        elseif ret == "向下移动" then
				local num = math.random(6)
				if num == 1 then
	               fight(self,p1,Gabriel,adjust)
	            elseif num == 2 then
	               print("====遇到可怜的乞丐给了他一些钱 💰:-10====")
	               p1.gold = p1.gold - 10 > 0 and p1.gold - 10 or 0
	            elseif num == 3 then
	               fight(self,p1,Goblin,adjust)
	            elseif num == 4 then
	               print("====打家劫舍抢得金钱 💰:+20====")
	               p1.gold = p1.gold + 20
	            elseif num == 5 then
	                fight(self,p1,Ganunu,adjust)
	              
	            else
	            	-- print("====没有遇到怪物 下次可就没这么好运了====")
	            	fight(self,p1,Gabriel,adjust)
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
	            	-- print("====没有遇到怪物 下次可就没这么好运了====")
	            	print("====在路上被☄️ 攻击 血量：-10====")
	            	p1.health = p1.health - 10 > 0 and p1.health - 10 or 1
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
	                   fight(self,p1,Goblin,adjust)   
	                end
	            elseif num == 3 then
	               fight(self,p1,Ganunu,adjust)
	            elseif num == 4 then
	                print("====真是踩到狗屎了捡到大宝箱💰++====")
	                for i=1,10 do
	               	print("====金币:+10====")
	                p1.gold = p1.gold + 10
	                end  
	            elseif num == 5 then
	               fight(self,p1,Cthulhu,adjust)
	               
	            else
	            	fight(self,p1,Goblin,adjust)
	            	-- print("====没有遇到怪物 下次可就没这么好运了====")
	            end
	        elseif ret == "这儿的怪太强了" then

				local num = math.random(5)
				if num == 1 then
	               fight(self,p1,Caikunxu,adjust)
	               
	            elseif num == 2 then
	               fight(self,p1,Cthulhu,adjust)
	               
	            elseif num == 3 then
	               fight(self,p1,Caikunxu,adjust)
	               
	            elseif num == 4 then
	               fight(self,p1,Cthulhu,adjust)
	               
	            else
	            	if getlifegold == false then
		               print("====遇见宝箱，惊奇的发现里面有一枚复活币 复活币:+1====")
		               p1.lifegold = p1.lifegold + 1
		               getlifegold = true
	                else
	                   print("====这个宝箱以及被你捡过了，不要太贪心====")
	                   -- fight(self,p1,Goblin,adjust)
	                   print("----糟了，从树后面跳出一只怪物----")
	                   fight(self,p1,Cthulhu,adjust)   
	                end	            	
	            end	           
	        else

	        end
        else
          
            print("====保存处理====是否保存: 1.是,2.否(直接输入数字即可）")
			            local inputlife = io.read()
			            if inputlife == "1" then
						    -- os.execute("touch "..os.getenv("HOME").."/Desktop/savegame.lua")
						        p2 = {}
								file = io.open(os.getenv("HOME").."/Desktop/savegame.lua","w")
								for k,v in pairs(p1) do
								    if k =="name" then
								        p2[1] = v
								    elseif k == "health" then
								        p2[2] = v
								    elseif k == "level" then
							            p2[3] = v
							        elseif k == "experience" then
								        p2[4] = v
								    elseif k == "emojo" then
								        p2[5] = v
								    elseif k == "attack" then
								        p2[6] = v
								    elseif k == "gold" then
								        p2[7] = v
								    elseif k == "speed" then
								        p2[8] = v
								    elseif k == "armor" then
								        p2[9] = v
								    elseif k == "power" then
								        p2[10] = v
								    elseif k == "lifegold" then
								        p2[11] = v
								    elseif k == "attackname" then
								        p2[12] = v
								    elseif k == "armorname" then
								        p2[13] = v
								    elseif k == "speedname" then
								        p2[14] = v
								    elseif k == "handname" then
								        p2[15] = v
								    elseif k == "headname" then
								        p2[16] = v
								    elseif k == "wristname" then
								        p2[17] = v
								    elseif k == "shouldername" then
								        p2[18] = v
								    elseif k == "cloalname" then
								        p2[19] = v
								    elseif k == "legname" then
								        p2[20] = v
								    elseif k == "kneepadname" then
								        p2[21] = v
								    elseif k == "magicresistance" then
								        p2[22] = v
                                    elseif k == "talentpoint" then
								        p2[23] = v
								    elseif k == "technology1" then
								        p2[24] = v
								    elseif k == "technology2" then
								        p2[25] = v
								    elseif k == "technology3" then
								        p2[26] = v
								    elseif k == "technology4" then
								        p2[27] = v
								    elseif k == "magic1" then
								        p2[28] = v
								    elseif k == "magic2" then
								        p2[29] = v
								    elseif k == "magic3" then
								        p2[30] = v
								    elseif k == "magic4" then
								        p2[31] = v
								    elseif k == "talpoint" then
								        p2[32] = "["
								        -- io.write("[")
								        for m,n in ipairs(v[2])do
								        	for i,j in ipairs(n) do
								        		p2[32] = p2[32]..tostring(j).."|"
								        		-- print(p2[32])
								        	end
								        end
								        p2[32] = p2[32].."]"
								        p1.talpoint = p2[32]
								        -- p2[32] = tostring(v)								        
								    else
                                -- handname = "",headname = "",wristname = "",shouldername="", cloalname="", legname = ""
								    end
								end
								-- for k,v in ipairs(p2) do
								--     print(k,v)
								-- end
								for k,v in ipairs(p2) do
								    file:write(v..",")
								end
								file:close()
			           	    print("========保存成功========")
			           	    os.exit()
			            else
			            	  print('=======游戏结束=======')
							  print('=======游戏退出=======')
							  os.exit()
			            end
	      	-- print('=======保存成功=======')
	       --  print('=======游戏退出 输入 os.exit() 退出整个系统=======')
	       --  return p1
	    end
    end
      print("====⚰️ you are died⚰️ ====你的等级: ",p.level)
	  print('=======游戏结束=======')
	  print('=======游戏退出=======')
	  os.exit()
end
-- move1(p,p,game,article,adjust)

entertime = 0
function start()
	os.execute("touch "..os.getenv("HOME").."/Desktop/savegame.lua")
	file = io.open(os.getenv("HOME").."/Desktop/savegame.lua","r")
	file1 = file:read("*a")
	if file1 == "" or nil then
		file:close()
		print("======取一个有个性的名字吧(不想取名的话直接按回车开始)======")
		local changename = io.read()
		local p = person.change(p,changename)
		move1(p,p,game,article,adjust,talpoint,addpoint)
    else
    	print("====你有已经保存的记录====是否继续: 1.是,2.否(直接输入数字即可）")
        local inputlife = io.read()
        if inputlife == "1" then  

			   pload = person:new()
			   -- p = person:new()
		       pcopy = {}
		       local i=0
				for v in string.gmatch(file1,"([^,]+),")do
				    i=i+1
				    pcopy[i] = v   
				end

				do
				  pload.name = pcopy[1]
				  pload.health = tonumber(pcopy[2])
		          pload.level = tonumber(pcopy[3])
		          pload.experience = tonumber(pcopy[4])
		          pload.emojo = pcopy[5]
		          pload.attack = tonumber(pcopy[6])
		          pload.gold = tonumber(pcopy[7])
		          pload.speed = tonumber(pcopy[8])
		          pload.armor = tonumber(pcopy[9])
		          pload.power = tonumber(pcopy[10])
		          pload.lifegold = tonumber(pcopy[11])
		          pload.attackname = tostring(pcopy[12]) == "" and "nil" or tostring(pcopy[12])
		          pload.armorname = tostring(pcopy[13]) == "" and "nil" or tostring(pcopy[13])
		          pload.speedname = tostring(pcopy[14]) == "" and "nil" or tostring(pcopy[14])
		          pload.handname = tostring(pcopy[15]) == "" and "nil" or tostring(pcopy[15])
		          pload.headname = tostring(pcopy[16]) == "" and "nil" or tostring(pcopy[16])
		          pload.wristname = tostring(pcopy[17]) == "" and "nil" or tostring(pcopy[17])
		          pload.shouldername = tostring(pcopy[18]) == "" and "nil" or tostring(pcopy[18])
		          pload.cloalname = tostring(pcopy[19]) == "" and "nil" or tostring(pcopy[19])
		          pload.legname = tostring(pcopy[20]) == "" and "nil" or tostring(pcopy[20])
		          pload.kneepadname = tostring(pcopy[21]) == "" and "nil" or tostring(pcopy[21])
		          pload.magicresistance = tonumber(pcopy[22])
		          pload.talentpoint = tonumber(pcopy[23])
		          pload.technology1 = tonumber(pcopy[24])
		          pload.technology1 = tonumber(pcopy[25])
		          pload.technology1 = tonumber(pcopy[26])
		          pload.technology1 = tonumber(pcopy[27])
		          pload.magic1 = tonumber(pcopy[28])
		          pload.magic2 = tonumber(pcopy[29])
		          pload.magic3 = tonumber(pcopy[30])
		          pload.magic4 = tonumber(pcopy[31])
		          pload.talpoint = pcopy[32]
		          pcopy[32] = string.match(pcopy[32],"%[(.*)%]")
		            local i = 0
					local j = 0
					for v in string.gmatch(pcopy[32],"([^|]+)|") do
					    -- print(v)
					    if i%6 == 1 or i%6== 2 or i%6==4 then
					        talpoint[2][j+1][tonumber(i%6+1)] = tonumber(v)
					    else
					        talpoint[2][j+1][tonumber(i%6+1)] = v
					    end
					    i=i+1
					    if i%6 == 0 then
					        j = j+1
					    end					    
					end

		        end


               file:close()
    	         	       
	        move1(pload,pload,game,article,adjust,talpoint,addpoint)
	    else
            file:close()
			print("======取一个有个性的名字吧(不想取名的话直接按回车开始)======")
			local changename = io.read()
			local p = person.change(p,changename)
			move1(p,p,game,article,adjust,talpoint,addpoint)
		end
    end
end
start()


function savegame(p1)
	p2 = {}
	-- {name = "💩",health = 100,level =1,experience = 0 ,emojo = "^_^",attack = 30,gold = 10000,speed = 10,armor = 10,power = 100,lifegold = 0}
	file = io.open("savegame.lua","w")
	for k,v in pairs(p1) do
	    if k =="name" then
	        p2[1] = v
	    elseif k == "health" then
	        p2[2] = v
	    elseif k == "level" then
            p2[3] = v
        elseif k == "experience" then
	        p2[4] = v
	    elseif k == "emojo" then
	        p2[5] = v
	    elseif k == "attack" then
	        p2[6] = v
	    elseif k == "gold" then
	        p2[7] = v
	    elseif k == "speed" then
	        p2[8] = v
	    elseif k == "armor" then
	        p2[9] = v
	    elseif k == "power" then
	        p2[10] = v
	    elseif k == "lifegold" then
	        p2[11] = v
	    else

	    end
	end
	for k,v in ipairs(p2) do
	    file:write(v..",")
	end
	file:close()
end

function loadgame()
   
end

























































