-- 0604 修复天赋树的实现
-- 修复血量和蓝量自动回满bug
-- 添加宠物
-- 添加符文石
-- 添加怪物数量，优化界面

-- 创建对象====
person = {name = "Reman",health = 100,level = 0,experience = 0 ,emojo = "^_^",attack = 20,gold = 1000,speed = 10,armor = 0,power = 100,lifegold = 0,
attackname = "nil",armorname = "nil",speedname = "nil",handname = "nil",headname = "nil",wristname = "nil",shouldername="nil", cloalname="nil", 
legname = "nil",kneepadname = "nil",magicresistance = 0,talentpoint = 0,technology1 = 0,technology2 = 0,technology3 = 0,technology4 = 0,
magic1 = 0,magic2 = 0,magic3 = 0,magic4 = 0,talpoint = "",armorpenetrate = 0,magicpenetrate = 0,armorpenetratepercentage = 0,magicpenetratepercentage = 0,
critpercentage = 0,critdamage = 0,armorpenetratename1 = "nil",armorpenetratename2 = "nil",magicpenetratename1="nil",magicpenetratename2 = "nil",
armorpenetratepercentagename1 = "nil",armorpenetratepercentagename2 = "nil",magicpenetratepercentagename1 = "nil",magicpenetratepercentagename2 = "nil",
critpercentagename1 = "nil",critpercentagename2 = "nil",critdamagename1 = "nil",critdamagename2 = "nil",petname = "nil",runestone = 0,attackaddpercentage = 0,
armoraddpercentage = 0,magicresistanceaddpercentage = 0,speedaddpercentage = 0,attackrunestone = "nil",armorrunestone = "nil",magicresistancerunestone = "nil",
speedrunestone = "nil"}
person.new = function(self)
	local tab = {}
	for k,v in pairs(self)do
		tab[k] = v
	end
	return tab
end
person.change = function(self,name,health,level,experience,emojo,attack,gold,speed,armor,magicresistance,runestone)
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
	self.runestone = runestone or self.runestone
	return self
end
local p = person:new()
function createmonster()
	--rumeng
	 Gabriel = person:new()
	 Gabriel = person.change(Gabriel,"加百力",20,1,10,"*_*",2,20,2,2,2,1)
     XiaoYan = person:new()
     XiaoYan = person.change(XiaoYan,"小鲷",30,3,15,"+_+",5,25,5,5,5,2)
    --chuji 
	 Goblin = person:new()
	 Goblin = person.change(Goblin,"哥布林",40,5,20,"$_$",10,30,10,10,10,4)
     BearTwo = person:new()
     BearTwo = person.change(BearTwo,"熊二",50,8,30,"U_U",15,50,15,15,15,8)
    --zhongji
	 Ganunu = person:new()
	 Ganunu = person.change(Ganunu,"加努努",60,10,50,"#_#",20,100,20,20,20,10)
     LittleBeast = person:new()
     LittleBeast = person.change(LittleBeast,"小雷兽",70,12,10,"I_I",30,150,30,30,30,15)
    --gaoji
	 Cthulhu = person:new()
	 Cthulhu = person.change(Cthulhu,"克苏鲁",80,15,100,"@_@",40,200,40,40,40,20)
	 YuanZun = person:new()
	 YuanZun = person.change(YuanZun,"元尊",90,20,150,"{_}",50,300,50,50,50,30)
	--teji
	 Caikunxu = person:new()
	 Caikunxu = person.change(Caikunxu,"菜虚昆",100,30,300,"&_&",60,500,60,60,60,35)
	 Sentenced = person:new()
	 Sentenced = person.change(Sentenced,"处刑者",200,50,500,"%_%",100,1000,100,100,100,50)
end
-------------------------------------------------------------

--升级 添加基础功能
function inithealth(self)
	local wristvalue = 0
	local shouldervalue = 0
    for k,v in ipairs(article[2]) do
		if self.wristname == v[1] then
			wristvalue = v[4]
		end
		if self.shouldername == v[1] then
			shouldervalue = v[4]
		end
	end
    -- self.health = 100 + self.level + wristvalue+ shouldervalue
    return 100 + self.level*4 + wristvalue+ shouldervalue
end
function initpower(self)
	-- for k,v in pairs(article[2]) do
	-- 	if self.cloalname == v[1] then
	--     self.power = 100 + self.level + v[4] 
	--     return self.power
	-- 	end
	-- end
	-- self.power = 100 + self.level 
	return 100 + self.level
end
function initarmor(self)
    
    local headvalue = 0
    local armorvalue = 0
    for k,v in ipairs(article[2]) do
		if self.headname == v[1] then
			headvalue = v[4]
		end
		if self.armorname == v[1] then
			armorvalue = v[4]
		end
	end
	
	if self.technology2 == 1 then
        self.armor = self.armor + (headvalue + armorvalue) * (1.1+self.armoraddpercentage/100)
		return self.armor 
	else
        self.armor = self.armor + (headvalue + armorvalue) * (1+self.armoraddpercentage/100)
        return self.armor
    end
end
function initattack(self)	
    local attackvalue = 0
    local handvalue = 0
    for k,v in ipairs(article[2]) do
		if self.attackname == v[1] then
			attackvalue = v[4]
		end
		if self.handname == v[1] then
			handvalue = v[4]
		end
	end
	
	if self.technology1 == 1 then
        self.attack = self.attack + (attackvalue + handvalue) * (1.1+self.attackaddpercentage/100)
		return self.attack 
	else
        self.attack = self.attack + (attackvalue + handvalue) *(1+self.attackaddpercentage/100)
        return self.attack
    end
end
function initspeed(self)
	
	local speedvalue = 0
    local legvalue = 0
    for k,v in ipairs(article[2]) do
		if self.speedname == v[1] then
			attackvalue = v[4]
		end
		if self.legname == v[1] then
			legvalue = v[4]
		end
	end
	
	if self.technology3 == 1 then
        self.speed = self.speed + (speedvalue + legvalue) * (1.1+self.speedaddpercentage/100)
		return self.speed
	else
        self.speed = self.speed + (speedvalue + legvalue) *(1+self.speedaddpercentage/100)
        return self.speed
    end
end
function initmagicresistance(self)

	local cloalvalue = 0
    local kneepadvalue = 0
    for k,v in ipairs(article[2]) do
		if self.cloalname == v[1] then
			cloalvalue = v[4]
		end
		if self.kneepadname == v[1] then
			kneepadvalue = v[4]
		end		
	end
	
	if self.technology4 == 1 then
        self.magicresistance = self.magicresistance + (cloalvalue + kneepadvalue) * (1.1+self.magicresistanceaddpercentage/100)
		return self.magicresistance
	else
	    self.magicresistance = self.magicresistance + (cloalvalue + kneepadvalue) * (1+self.magicresistanceaddpercentage/100)	
        return self.magicresistance
    end

end
function inittalentpoint(self)
	
	return self.level
end
function initfun(self,val)
	if val == "attack" then
		self.attack = initattack(self)
		return self.attack
	elseif val == "armor" then
		self.armor = initarmor(self)
		return self.armor
	elseif val == "magicresistance" then
		self.magicresistance = initmagicresistance(self)
		return self.magicresistance
	elseif val == "speed" then
		self.speed = initspeed(self)
		return self.speed
	elseif val == "health" then
		self.health = inithealth(self)
		return self.health
	end
end
function status(self,p1)
    print("====血量❤️ : "..p1.health.."/"..inithealth(p1,article))
    print("====蓝量💙: "..p1.power.."/"..initpower(p1))
    print("====等级📶: "..p1.level)
    print("====金币💰: "..p1.gold)
    print("====经验📖: "..p1.experience.."/"..p1.level*10)
    print("====攻击🗡 : "..p1.attack)
    print("====护甲🛡 : "..p1.armor)
    print("====魔抗🔰: "..p1.magicresistance)
    print("====速度👟: "..p1.speed)
    print("====天赋💡: "..p1.talentpoint.."/"..p1.level)
    print("====复活💊: "..p1.lifegold)
    print("====符文🔯: "..p1.runestone)
    print("----物穿: "..p1.armorpenetrate,"法穿: "..p1.magicpenetrate)
    print("----物穿百分比: "..p1.armorpenetratepercentage.."%","法穿百分比: "..p1.magicpenetratepercentage.."%")
    print("----暴击率: "..p1.critpercentage.."%","暴击伤害: "..p1.critdamage.."%")

end

function equipbar(self,p1)
    print("刀剑⚔️ :"..(self.attackname == "nil" and "无" or self.attackname), "拳套🥊:"..(self.handname == "nil" and "无" or self.handname))
    print("头盔⛑ :"..(self.headname == "nil" and "无" or self.headname), "胸甲🥋:"..(self.armorname == "nil" and "无" or self.armorname))
    print("手腕💪:"..(self.wristname == "nil" and "无" or self.wristname), "护肩👕:"..(self.shouldername == "nil" and "无" or self.shouldername))   
    print("腿甲👢:"..(self.legname == "nil" and "无" or self.legname), "护胫🎿:"..(self.speedname == "nil" and "无" or self.speedname))
    print("披风🧚‍♀️:"..(self.cloalname == "nil" and "无" or self.cloalname), "  护膝🏉:"..(self.kneepadname == "nil" and "无" or self.kneepadname))
    print("耳环💫:"..(self.armorpenetratename1 == "nil" and "无" or self.armorpenetratename1), "手环🔗:"..(self.armorpenetratename2 == "nil" and "无" or self.armorpenetratename2))
    print("护符🏵 :"..(self.magicpenetratename1 == "nil" and "无" or self.magicpenetratename1), "戒指💍:"..(self.magicpenetratename2 == "nil" and "无" or self.magicpenetratename2))
    print("弓穿🏹:"..(self.armorpenetratepercentagename1 == "nil" and "无" or self.armorpenetratepercentagename1), "利刃🔪:"..(self.armorpenetratepercentagename2 == "nil" and "无" or self.armorpenetratepercentagename2))
    print("法典📓:"..(self.magicpenetratepercentagename1 == "nil" and "无" or self.magicpenetratepercentagename1), "圣杯🏆:"..(self.magicpenetratepercentagename2 == "nil" and "无" or self.magicpenetratepercentagename2))
    print("电刀〽️:"..(self.critpercentagename1 == "nil" and "无" or self.critpercentagename1), "火炮🔥:"..(self.critpercentagename2 == "nil" and "无" or self.critpercentagename2))
    print("力骸🔱:"..(self.critdamagename1 == "nil" and "无" or self.critdamagename1), "殇魂✝️ :"..(self.critdamagename2 == "nil" and "无" or self.critdamagename2))
    print("宠物👼:"..(self.petname == "nil" and "无" or self.petname))
end
addexpgloble = 0
p.addexp = function (self,p1,addexp)
    p1.experience = p1.experience + addexp
	while p1.experience >= p1.level*10 do
		p1.experience = p1.experience - p1.level*10
		p1.level = p1.level + 1
		p1.talentpoint = p1.talentpoint + 1
		print("----你升级了🎉🎉🎉🎉🎉  👑 等级："..p1.level.." 血量："..inithealth(p1,article))
		p1.health = inithealth(p1,article)
		p1.power = p1.power + 20 > initpower(p1) and initpower(p1) or p1.power + 20
		-- p.addatt(p1)
	end
	return p1
end
p.addhel = function (self)
    if self.health < inithealth(self,article) then
	    if self.gold >= 100 then
		    if self.health + 20 < inithealth(self,article) then
		    	self.health = self.health + 20
		    else
		    	self.health = inithealth(self,article)
		    end
		    self.gold = self.gold - 100
		else
		  	print("💰不足: "..self.gold.." 需要金币: 100")
	    end
		-- return self
	else
	 	print("====你的血量已满不用添加血量====")
	end
	-- return self
end
p.autoaddhel = function (self)
	while self.health < 100 do

		if self.gold >= 100 then
		    if self.health + 20 < inithealth(self,article) then
		    	self.health = self.health + 20                    
		    else
		    	self.health = inithealth(self,article)                   
		    end
		    self.gold = self.gold - 100  
	    else
	  	    print("💰不足: "..self.gold.." 需要金币: 100")
	  	    -- return self
	    end

	end
	-- return self
end
p.addpow = function (self)
    if self.power < initpower(self) then
		if self.gold >= 100 then
		    if self.power + 20 < initpower(self) then
		    	self.power = self.power + 20
		    else
		    	self.power = initpower(self)
		    end
		    self.gold = self.gold - 100
		else
		  	print("💰不足: "..self.gold.." 需要金币: 100")
		  	-- return self
		end
		-- return self
    else
	 	print("====你的蓝量已满不用添加蓝量====")
    end
    -- return self
end
p.autoaddpow = function (self)
	while self.power < 100 do
		 -- if self.power < initpower(self) then
			  if self.gold >= 100 then
				    if self.power + 20 < initpower(self) then
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
	-- return self
end
lifegoldchoice={
	"请选择要购买的复活币个数",
	{
		{1,"复活币",1,1000},
		{2,"复活币",5,4800},
		{3,"复活币",10,9000},
		{4,"退回"}
    }
}
p.addlife = function (self)
    print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',lifegoldchoice[1]))
	print '---------选项---------'
	for k,v in pairs(lifegoldchoice[2])do
		if v[2] ~= "退回" then			
			print(tonumber(v[1])..": "..v[2].." "..string.format("%2d",v[3]).."个".."  价格: "..v[4])
		else
			print(v[1]..": "..v[2])
	    end
    end
	print '---------------------'
    print '请选择: '
	num,_ret = inputNum(lifegoldchoice)
	while num == nil or _ret == nil do
		print '输入无效，请再次输入(要输入提供的数字选择哦): '
		num,_ret = inputNum(lifegoldchoice)
	end
    if _ret[2] ~= "退回" then
		if self.gold < _ret[4] then
			print("你的💰不足: "..self.gold.." 需要金币: ".._ret[4])
		else
			self.gold = self.gold - _ret[4]
			self.lifegold = self.lifegold + _ret[3]
			print("====你购买了复活币====","复活币: +".._ret[3])
		end
	else
		return self
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
			-- p1.attack = initattack(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[3] = tabval[3] + 1
			if tabval[3] == 10 then
			   tabval[4] = "已激活"
			   print("====解锁技能：装备攻击加成+10%====")
			   p1.technology1 = 1	
			end
		elseif tabval[1] == "防" then
	        p1.armor = p1.armor + 1
	        -- p1.armor = initarmor(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[3] = tabval[3] + 1
			if tabval[3] == 10 then
			   tabval[4] = "已激活"
			   print("====解锁技能：装备物防加成+10%====")
			   p1.technology2 = 1	
			end
		elseif tabval[1] == "速" then
	        p1.speed = p1.speed + 1
	        -- p1.speed = initspeed(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[3] = tabval[3] + 1
			if tabval[3] == 10 then
			   tabval[4] = "已激活"
			   print("====解锁技能：装备速度加成+10%====")	
			   p1.technology3 = 1
			end
		elseif tabval[1] == "抗" then
	        p1.magicresistance = p1.magicresistance + 1
	        -- p1.magicresistance = initmagicresistance(p1,article)
			p1.talentpoint = p1.talentpoint - 1
			tabval[3] = tabval[3] + 1
			if tabval[3] == 10 then
			   tabval[4] = "已激活"
			   print("====解锁技能：装备魔防加成+10%====")	
			   p1.technology4 = 1
			end
		end

    elseif tabval[4] == "已激活" and tabval[5] < 20 then
		if tabval[1] == "攻" then
			p1.attack = p1.attack + 1
			-- p1.attack = initattack(p1,article)
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
	        -- p1.armor = initarmor(p1,article)
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
	        -- p1.speed = initspeed(p1,article)
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
	        -- p1.magicresistance = initmagicresistance(p1,article)
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
    {"新手物穿耳环",37,100,5,"物穿","耳环"},
    {"强化物穿耳环",38,200,10,"物穿","耳环"},
    {"老手物穿耳环",39,400,15,"物穿","耳环"},
    {"大师物穿耳环",40,800,20,"物穿","耳环"},
    {"新手物穿手环",41,100,5,"物穿","手环"},
    {"强化物穿手环",42,200,10,"物穿","手环"},
    {"老手物穿手环",43,400,15,"物穿","手环"},
    {"大师物穿手环",44,800,20,"物穿","手环"},
    {"新手法穿护符",45,100,5,"法穿","护符"},
    {"强化法穿护符",46,200,10,"法穿","护符"},
    {"老手法穿护符",47,400,15,"法穿","护符"},
    {"大师法穿护符",48,800,20,"法穿","护符"},
    {"新手法穿戒指",49,100,5,"法穿","戒指"},
    {"强化法穿戒指",50,200,10,"法穿","戒指"},
    {"老手法穿戒指",51,400,15,"法穿","戒指"},
    {"大师法穿戒指",52,800,20,"法穿","戒指"},
    {"新手反曲之弓",53,100,5,"物穿百分比","弓穿"},
    {"强化反曲之弓",54,200,10,"物穿百分比","弓穿"},
    {"老手反曲之弓",55,400,15,"物穿百分比","弓穿"},
    {"大师反曲之弓",56,800,20,"物穿百分比","弓穿"},
    {"新手樱花之刃",57,100,5,"物穿百分比","利刃"},
    {"强化樱花之刃",58,200,10,"物穿百分比","利刃"},
    {"老手樱花之刃",59,400,15,"物穿百分比","利刃"},
    {"大师樱花之刃",60,800,20,"物穿百分比","利刃"},
    {"新手洛密法典",61,100,5,"法穿百分比","法典"},
    {"强化洛密法典",62,200,10,"法穿百分比","法典"},
    {"老手洛密法典",63,400,15,"法穿百分比","法典"},
    {"大师洛密法典",64,800,20,"法穿百分比","法典"},
    {"新手圣墟之杯",65,100,5,"法穿百分比","圣杯"},
    {"强化圣墟之杯",66,200,10,"法穿百分比","圣杯"},
    {"老手圣墟之杯",67,400,15,"法穿百分比","圣杯"},
    {"大师圣墟之杯",68,800,20,"法穿百分比","圣杯"},
    -- {"新手暴击电刀",69,100,10,"暴击率","电刀"},
    -- {"强化暴击电刀",70,200,20,"暴击率","电刀"},
    {"老手暴击电刀",69,600,25,"暴击率","电刀"},
    {"大师暴击电刀",70,1200,50,"暴击率","电刀"},
    -- {"新手暴击火炮",73,100,10,"暴击率","火炮"},
    -- {"强化暴击火炮",74,200,20,"暴击率","火炮"},
    {"老手暴击火炮",71,600,25,"暴击率","火炮"},
    {"大师暴击火炮",72,1200,50,"暴击率","火炮"},
    {"新手无尽之力",73,100,5,"暴击伤害","力骸"},
    {"强化无尽之力",74,200,10,"暴击伤害","力骸"},
    {"老手无尽之力",75,500,25,"暴击伤害","力骸"},
    {"大师无尽之力",76,1500,50,"暴击伤害","力骸"},
    {"新手悔恨之殇",77,100,5,"暴击伤害","殇魂"},
    {"强化悔恨之殇",78,200,10,"暴击伤害","殇魂"},
    {"老手悔恨之殇",79,500,25,"暴击伤害","殇魂"},
    {"大师悔恨之殇",80,1500,50,"暴击伤害","殇魂"},
    {"新手极速力胫",81,200,10,"速度","护胫"},
    {"强化极速力胫",82,400,20,"速度","护胫"},
    {"老手极速力胫",83,500,30,"速度","护胫"},
    {"大师极速力胫",84,1000,50,"速度","护胫"},
    {"退回",85}
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
function changeequipment(self,equipname,equipattrib,v,article,technology,addpercentage)
	technology = technology or nil
	addpercentage = addpercentage or nil
	if self.gold >= v[3] then
		local equipname = tostring(equipname)
		local equipattrib = tostring(equipattrib)
	   if self[equipname] == "" then	
    	    self[equipname] = v[1]
    	    self.gold = self.gold - v[3]
    	    if technology == 1 then	        	
	        	self[equipattrib] = self[equipattrib] + v[4]*(1.1+addpercentage/100)
	        	print("购买了"..v[1].."你的"..v[5].."：+"..(v[4]*(1.1+addpercentage/100)).." 你的金币："..self.gold)
            else
                self[equipattrib] = self[equipattrib] + v[4]*(1+addpercentage/100)
        	    -- self[equipattrib] = initfun(self,equipattrib)
        	    print("购买了"..v[1].."你的"..v[5].."：+"..v[4]*(1+addpercentage/100).." 你的金币："..self.gold)
        	end
        	
       else
            for m,n in pairs(article[2]) do
            	if n[1] == self[equipname] then
            		if technology == 1 then
            		self[equipattrib] = self[equipattrib] - n[4]*(1.1+addpercentage/100)
	            	else
                    self[equipattrib] = self[equipattrib] - n[4]*(1+addpercentage/100)
	            	end
            		self.gold = self.gold + n[3]*0.7
                    print("回收"..self[equipname].."装备 金币：+"..tostring(n[3]*0.7).." 你的金币："..self.gold)
            	end
            end
            self[equipname] = v[1]	
            self.gold = self.gold - v[3]    
               if technology == 1 then 	
        	        self[equipattrib] = self[equipattrib] + v[4]*(1.1+addpercentage/100)
        	        print("购买了"..v[1].."你的"..v[5].."：+"..(v[4]*(1.1+addpercentage/100)).." 你的金币："..self.gold)
        	-- self[equipattrib] = initfun(self,equipattrib,article)
        	    else
        	    	self[equipattrib] = self[equipattrib] + v[4]*(1+addpercentage/100)
        	    	print("购买了"..v[1].."你的"..v[5].."：+"..v[4]*(1+addpercentage/100).." 你的金币："..self.gold)
        	    end
        	
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
		        	changeequipment(self,"attackname","attack",v,article,self.technology1,self.attackaddpercentage)
		        elseif v[6] == "胸甲" then
		        	changeequipment(self,"armorname","armor",v,article,self.technology2,self.armoraddpercentage)
		        elseif v[6] == "护胫" then
		        	changeequipment(self,"speedname","speed",v,article,self.technology3,self.speedaddpercentage)
                elseif v[6] == "拳套" then
		        	changeequipment(self,"handname","attack",v,article,self.technology1,self.attackaddpercentage)
		        elseif v[6] == "手腕" then
		        	changeequipment(self,"wristname","health",v,article)
		        elseif v[6] == "护肩" then
		        	changeequipment(self,"shouldername","health",v,article)
		        elseif v[6] == "披风" then
		        	changeequipment(self,"cloalname","magicresistance",v,article,self.technology4,self.magicresistanceaddpercentage)
		        elseif v[6] == "腿甲" then
		        	changeequipment(self,"legname","speed",v,article,self.technology3,self.speedaddpercentage)
		        elseif v[6] == "头盔" then
		        	changeequipment(self,"headname","armor",v,article,self.technology2,self.armoraddpercentage)
		        elseif v[6] == "护膝" then
		        	changeequipment(self,"kneepadname","magicresistance",v,article,self.technology4,self.magicresistanceaddpercentage)
		        elseif v[6] == "耳环" then
		        	changeequipment(self,"armorpenetratename1","armorpenetrate",v,article)
		        elseif v[6] == "手环" then
		        	changeequipment(self,"armorpenetratename2","armorpenetrate",v,article)
		        elseif v[6] == "护符" then
		        	changeequipment(self,"magicpenetratename1","magicpenetrate",v,article)
		        elseif v[6] == "戒指" then
		        	changeequipment(self,"magicpenetratename2","magicpenetrate",v,article)
		        elseif v[6] == "弓穿" then
		        	changeequipment(self,"armorpenetratepercentagename1","armorpenetratepercentage",v,article)
		        elseif v[6] == "利刃" then
		        	changeequipment(self,"armorpenetratepercentagename2","armorpenetratepercentage",v,article)
		        elseif v[6] == "法典" then
		        	changeequipment(self,"magicpenetratepercentagename1","magicpenetratepercentage",v,article)
		        elseif v[6] == "圣杯" then
		        	changeequipment(self,"magicpenetratepercentagename2","magicpenetratepercentage",v,article)
		        elseif v[6] == "电刀" then
		        	changeequipment(self,"critpercentagename1","critpercentage",v,article)
		        elseif v[6] == "火炮" then
		        	changeequipment(self,"critpercentagename2","critpercentage",v,article)
		        elseif v[6] == "力骸" then
		        	changeequipment(self,"critdamagename1","critdamage",v,article)
		        elseif v[6] == "殇魂" then
		        	changeequipment(self,"critdamagename2","critdamage",v,article)
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
	    -- print("---------fightTime",p1.health,p1.power)
        if escapeflag == false then			    
			    if p3.health <= 0 then
			    	print("➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣")
			    	print("--------==!!🎉🎉🎉🎊战斗胜利🎊🎉🎉🎉!!==--------")
			    	print("💰: +"..p3.gold.." 经验: +"..p3.experience.." 符文石:+"..p3.runestone)
			    	print("➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣➤➣➣➣➣")
			    end
			    if p1.health > 0 then
			    	p1 = p.addexp(self,p1,p3.experience)
			    	-- print("---------addexp",p1.health,p1.power)
			    	p1.runestone = p1.runestone + p3.runestone
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
	-- print("----fightTimestart",p1.health,p1.power)
    if p1.magic1 == 1 then
    	    print("===="..os.date("%Y/%m/%d %H:%M:%S").."你遇到了 ⬈"..p3.name.."⬉ 你的百米长的大刀正向他们头上砍去====","你的血量："..p1.health.."/"..inithealth(self,article),"怪物血量："..p3.health)
			while p1.health >0 and p3.health > 0 and escapeflag==false do
	          
			    if p1.health > 0 and p3.health > 0 then   
						p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)
						
						p1,p3 = petattacktoemeny(p1,p3)
							if p1.health > 0 and p3.health > 0 and escapeflag==false then
						       p1,p3,magicflag = monsterattack(p1,p3,magicflag)
						    end	
	        
	            end            

	        end
	else
		if p1.speed >= p3.speed then
	        print("===="..os.date("%Y/%m/%d %H:%M:%S").."ヾ(≧▽≦*)o你遇到了 ⬈"..p3.name.."⬉ 你的百米长的大刀正向他们头上砍去====","你的血量："..p1.health.."/"..inithealth(self,article),"怪物血量："..p3.health)
			while p1.health >0 and p3.health > 0 and escapeflag==false do
	          
			    if p1.health > 0 and p3.health > 0 then
			            -- print("-----adjustmentstart",p1.health,p1.power)   
						p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)

						p1,p3 = petattacktoemeny(p1,p3)
							if p1.health > 0 and p3.health > 0 and escapeflag==false then
						       p1,p3,magicflag = monsterattack(p1,p3,magicflag)
						    end
		        
	            end            


	        end
	    else
	        print("===="..os.date("%Y/%m/%d %H:%M:%S").." ☹︎"..p3.name.."☹︎ 向你Σ( ° △ °|||)︴张开了血盆大口====","怪物血量："..p3.health,"你的血量："..p1.health.."/"..inithealth(self,article))
	   	    while p1.health >0 and p3.health > 0 and escapeflag==false do

	            if p1.health > 0 and p3.health > 0 and escapeflag==false then
			       p1,p3,magicflag = monsterattack(p1,p3,magicflag)
			    end
					
				if p1.health > 0 and p3.health > 0 then	         
	               p1,p3 = adjustment(self,p1,p3,adjust,adjustflag)
                end
                if p1.health > 0 and p3.health > 0 then	
                   p1,p3 = petattacktoemeny(p1,p3)
                end

	        end
	    end

    end
    return p1,p3
end

-------------------------------------------------------------
--购买宠物
pettable = {
	"请选择要购买的宠物",
  {
	{"海潮之姣",1,500,5,"真实伤害","宠物","🧜🏻‍♂️"},
	{"苍穹之鹰",2,1000,10,"真实伤害","宠物","🦅"},
	{"原野之狼",3,1500,15,"真实伤害","宠物","🐺"},
	{"金刚之猿",4,2000,20,"真实伤害","宠物","🦍"},
	{"退回",5}
  }
}
function petattacktoemeny(p1,p3)
    if p1.health >0 and p3.health>0 and escapeflag == false then
		for k,v in ipairs(pettable[2])do
			if p1.petname == v[1] then
				print("------你的宠物 "..p1.petname.." "..v[7].." 对 "..p3.name.." 发动攻击------")
				p3.health = p3.health - tonumber(v[4])
				if p3.health<0 then
					p3.health = 0
				end
				print(p3.emojo.." "..p3.name.." 被攻击并且血量: -"..v[4].." 剩余血量: "..string.format("%.2f",p3.health))
            
            end
        end
    else
-- 
    	return p1,p3
    end
    return p1,p3
end
function buypet(p1)
	while true do
		print '---------===============购物菜单=================---------'
		print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',pettable[1]))
		print '---------选项---------'
		for k,v in pairs(pettable[2])do
			if v[1] ~= "退回" then
				v[3] = v[3] or ""
				print(tonumber(v[2])..": "..v[1].." 价格: "..string.format("%4d",tonumber(v[3])).." 金币".." 攻击: "..string.format("%3d",tonumber(v[4])).." "..v[5])
			else
				print(v[2]..": "..v[1])
		    end    
	    end
		print '---------------------'

        print '请选择: '
		num,ret = inputNum2(pettable)
		while num == nil or ret == nil do
			print '输入无效，请再次输入(要输入提供的数字选择哦): '
			num,ret = inputNum2(pettable)
		end
        
        if ret[1] ~= "退回" then
             if p1.gold >= ret[3] then
			   if p1.petname == "nil" then	
		    	    p1.petname = ret[1]
		    	    p1.gold = p1.gold - ret[3]		    	  	                
		        	print("获得了"..ret[1].." 你的剩余金币："..p1.gold)		        	
		     else
		            for m,n in pairs(pettable[2]) do
		            	if n[1] == p1.petname then		            		
		            		p1.gold = p1.gold + n[3]*0.7
		                    print("释放"..p1.petname.."宠物 金币：+"..tostring(n[3]*0.7).." 你的金币："..p1.gold)
		            	end
		            end
		            p1.petname = ret[1]	
		            p1.gold = p1.gold - ret[3]        	   
        	    	print("获得了"..ret[1].." 你的剩余金币："..p1.gold)   	
		     end
			else
				print("💰不足 你的金币："..p1.gold)
			end
        else
            return
        end

	end

end
-------------------------------------------------------------

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
	        	p.addhel(p1)
	        	print("你的血量："..p1.health.."/"..inithealth(self,article))
	        elseif ret == "状态" then
	        	status(self,p1)
	        elseif ret == "购买装备" then
	        	shopping(p1,game,article,shoppingflag)
	        elseif ret == "加蓝量" then
	            p.addpow(p1)
	            print("你的蓝量："..p1.power.."/"..initpower(self))
	        elseif ret == "自动加蓝量" then
	            p.autoaddpow(p1)
	            print("你的蓝量："..p1.power.."/"..initpower(self))
	        elseif ret == "自动加血量" then
	            p.autoaddhel(p1)
	            print("你的血量："..p1.health.."/"..inithealth(self,article))
	        elseif ret == "购买复活币" then
	            p1 =p.addlife(p1)
	            print("你的剩余复活币："..p1.lifegold)
	        elseif ret == "技能" then  
	            -- print("---------技能",p1.health,p1.power)
				  while true do
				  	print '---------===============技能菜单=================---------'
				        prompt1(skills)
						ret = option1(skills)[1]
						-- armorpenetrate ,magicpenetrate ,armorpenetratepercentage ,magicpenetratepercentage 
					  if ret ~= "退出" then
				        if ret == "风暴之力" then
				        	local hurt1 = skills[2].Spit[3]
				        	   local hurt = skills[2].Spit[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
				        	   hurt = string.format("%.2f",hurt)
				        	if p1.power >= skills[2].Spit[3] then
					        	
					        	print("你的风暴之力对"..p3.name.."造成了少量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						        end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
					            print("-------风暴之力",p1.health,p1.power)
					            return p1,p3
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))               

				                break
				            end
				        elseif ret == "巨龙撞击" then
				        	local hurt1 = skills[2].Tone[3]
				        	   local hurt = skills[2].Tone[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
				        	   hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].Tone[3] then
					        	
					        	print("你的巨龙撞击对"..p3.name.."造成了适量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        elseif ret == "风舞九天" then
				        	local hurt1 = skills[2].dragonplay[3]
	                           local hurt = skills[2].dragonplay[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
	                           hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].dragonplay[3] then
					        	
					        	print("你的风舞九天对"..p3.name.."造成了大量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        elseif ret == "飞龙在天" then
				        	local hurt1 = skills[2].dragonfly[3]
				        	   local hurt = skills[2].dragonfly[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
				        	   hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].dragonfly[3] then
					        	
					        	print("你的飞龙在天对"..p3.name.."造成了巨量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        elseif ret == "鸡你太美" then
				        	   local hurt1 = skills[2].mustkill[3]
			        	       local hurt = skills[2].mustkill[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
			        	       hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].mustkill[3] then
					        	
					        	print("你的鸡你太美对"..p3.name.."造成了巨大的伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动技能攻击------")
				                print(p3.emojo.." "..p3.name.." 被🏀 攻击并且生命值为: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        else
				            break
				        end
				        -- print("--usejineng",p1.power)
				      else
				        break
				      end 
				  end
				  -- print("--usejinengtrue",p1.power)

	        elseif ret == "攻击" then
	        	p1,p3 = attacktoenemy(p1,p3)
	        	return p1,p3
	        else
                while p1.health > 0 and p3.health > 0 and escapeflag==false do
                	if p1.health <= p3.attack*1.3*100/(100+p1.magicresistance) or p1.health<= p3.attack*100/(100+p1.armor) then
                		print("------生命值较低，请手动操作------")
                	   break
                	elseif p3.health <= p1.attack/(100+p3.armor)*100 then
                	    attacktoenemy(p1,p3)
			        elseif p3.health <= 40 then
                        if p3.attack <= 40 then
                           attacktoenemy(p1,p3)
                        else
                        	local hurt1 = skills[2].Tone[3]
                        	local hurt = skills[2].Tone[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
                        	hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].Tone[3] then
					        	
					        	print("你的巨龙撞击对"..p3.name.."造成了适量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")				                
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))
				                break
				            end
				        end
				    elseif p3.health <= 60 then
				    	if p3.attack <= 20 then
				    		attacktoenemy(p1,p3)
				        else
				        	local hurt1 = skills[2].dragonplay[3]
                            local hurt = skills[2].dragonplay[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
                            hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].dragonplay[3] then
					        	
					        	print("你的风舞九天对"..p3.name.."造成了大量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				        end
				    elseif p3.health <= 80 then
				    	local hurt1 = skills[2].dragonfly[3]
				    	local hurt = skills[2].dragonfly[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
				    	hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].dragonfly[3] then
					        	
					        	print("你的飞龙在天对"..p3.name.."造成了巨量伤害 血量: -"..hurt)
					            p3.health = p3.health - hurt
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
				                print(p3.emojo.." "..p3.name.." 被攻击并且生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))

				                break
				            end
				    else
				    	local hurt1 = skills[2].mustkill[3]
				    	local hurt = skills[2].mustkill[3]*100/(100+p3.magicresistance*(1-p1.magicpenetratepercentage/100)-p1.magicpenetrate)
				    	hurt = string.format("%.2f",hurt)
				        	if p1.power >=skills[2].mustkill[3] then
					        	
					        	print("你的鸡你太美对"..p3.name.."造成了巨大的伤害 血量: -"..p3.health)
					            p3.health = p3.health - p3.health
					            p1.power = p1.power - hurt1
					            print("你的蓝量剩余："..p1.power.."/"..initpower(self))
					            if p3.health <= 0 then
						          	p3.health = 0
						          end
				                print("------"..p1.name.." 对 "..p3.name.." 发动绝技------")
				                print(p3.emojo.." "..p3.name.." 被🏀 攻击直接生命值: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
				                return p1,p3
				            else
				            	print("你的蓝量不足"..hurt1.." 剩余："..p1.power.."/"..initpower(self))

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
	    		print("====逃跑成功ε=ε=ε=┏(゜ロ゜;)┛====")
				escapeflag = true
				return p1,p3
		    else
		    	local escapnum = math.random(3)
		    	if escapnum == 2 then
			    	print("====逃跑成功ε=ε=ε=┏(゜ロ゜;)┛====")
					escapeflag = true
					return p1,p3
				else
					print(p3.name.."在你逃跑的路上绊了你一跤----逃跑失败----")
					escapeflag = false
					return p1,p3
				end
			end
	    end
	    -- print("---adjustmentwhile",p1.power)
    end
    -- print("---adjustment",p1.power)
    return p1,p3
end

function attacktoenemy(p1,p3)
	if p1.critpercentage/100 == 0.25 then
    		local num = math.random(4)
    		if num == 1 then
                p3.health = p3.health - p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)*(1+p1.critdamage/100)
                hurt = p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)*(1+p1.critdamage/100)
    			print("------"..p1.name.." 对 "..p3.name.." 发动暴击攻击------")

    		else
	            p3.health = p3.health - p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)
	            hurt = p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)
	            	print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
            end
	elseif p1.critpercentage/100 == 0.5 then
        	local num = math.random(4)
        	if num == 1 or num == 3 then
                p3.health = p3.health - p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)*(1+p1.critdamage/100)
                hurt = p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)*(1+p1.critdamage/100)
        		print("------"..p1.name.." 对 "..p3.name.." 发动暴击攻击------")

        	else
        		p3.health = p3.health - p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)
	            hurt = p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)
	            	print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
	        end
	elseif p1.critpercentage/100 == 0.75 then
	    	local num = math.random(4)
	    	if num ==1 or num == 2 or num == 4 then
                p3.health = p3.health - p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)*(1+p1.critdamage/100)
                hurt = p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)*(1+p1.critdamage/100)
	    		print("------"..p1.name.." 对 "..p3.name.." 发动暴击攻击------")

	    	else
	    		p3.health = p3.health - p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)
	            hurt = p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)
	            -- print("-----0.75: ",p1.armorpenetratepercentage,p1.armorpenetrate)
	            	print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
	        end
	elseif p1.critpercentage/100 == 1 then 
                p3.health = p3.health - p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)*(1+p1.critdamage/100)
                hurt = p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)*(1+p1.critdamage/100)
                   print("------"..p1.name.." 对 "..p3.name.." 发动暴击攻击------")
	else
		        p3.health = p3.health - p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)
	            hurt = p1.attack*100/(100+p3.armor*(1-p1.armorpenetratepercentage/100)-p1.armorpenetrate)
	            -- print("-----0.75: ",p1.armorpenetratepercentage,p1.armorpenetrate)
	            print("------"..p1.name.." 对 "..p3.name.." 发动攻击------")
	end
        hurt = string.format("%.2f",hurt)
        if p3.health <= 0 then
          	p3.health = 0
        end	            
        print(p3.emojo.." "..p3.name.." 被攻击并且血量: -"..hurt.." 剩余血量: "..string.format("%.2f",p3.health))
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

function monsterattack(p1,p3,magicflag)
	
	local num = math.random(4)
	    if num == 3 then
	    	if p1.magic4 == 1 and magicflag == false then
                    print("====你的魔法防御技能生效抵挡了"..p3.name.."的技能攻击====")
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
	return p1,p3,magicflag  
end
-------------------------------------------------------------
--符文锻造
runestone = {
	"请选择要锻造的符文",
	{
	{"初级攻击符文",1,100,5,"攻击"},
	{"中级攻击符文",2,300,10,"攻击"},
	{"高级攻击符文",3,500,15,"攻击"},
	{"终级攻击符文",4,1000,30,"攻击"},
	{"初级物防符文",5,100,5,"物防"},
	{"中级物防符文",6,300,10,"物防"},
	{"高级物防符文",7,500,15,"物防"},
	{"终级物防符文",8,1000,30,"物防"},
	{"初级魔防符文",9,100,5,"魔防"},
	{"中级魔防符文",10,300,10,"魔防"},
	{"高级魔防符文",11,500,15,"魔防"},
	{"终级魔防符文",12,1000,30,"魔防"},
	{"初级速度符文",13,100,5,"速度"},
	{"中级速度符文",14,300,10,"速度"},
	{"高级速度符文",15,500,15,"速度"},
	{"终级速度符文",16,1000,30,"速度"},
	{"退回",17}
}
}
function RunForge(p1)
	while true do
		print '---------===============购物菜单=================---------'
		print(string.format('系统提示: %s(从菜单中提供的数字选项中选择)',runestone[1]))
		print '---------选项---------'
		local i = 0
		for k,v in pairs(runestone[2])do
			i = i + 1
			if v[1] ~= "退回" then
				v[3] = v[3] or ""
				print(string.format("%2d",tonumber(v[2]))..": "..v[1].." 需要: "..string.format("%4d",tonumber(v[3])).." 符文石"..v[5]..": +"..string.format("%2d",tonumber(v[4])).." %")
			else
				print(v[2]..": "..v[1])
		    end
		    if i % 4 == 0 then
                print '---------------------'
		      end    
	    end
		print '---------------------'

        print '请选择: '
		num,ret = inputNum2(runestone)
		while num == nil or ret == nil do
			print '输入无效，请再次输入(要输入提供的数字选择哦): '
			num,ret = inputNum2(runestone)
		end
        
        if ret[1] ~= "退回" then
             if ret[5] == "攻击" then
             	changerunestone(p1,ret,"attackrunestone","attackaddpercentage","attack");
             elseif ret[5] == "物防" then
             	changerunestone(p1,ret,"armorrunestone","armoraddpercentage","armor");
             elseif ret[5] == "魔防" then
             	changerunestone(p1,ret,"magicresistancerunestone","magicresistanceaddpercentage","magicresistance");
             elseif ret[5] == "速度" then
             	changerunestone(p1,ret,"speedrunestone","speedaddpercentage","speed");      
    --          else
				-- print("符文石不足 你的符文石："..p1.runestone)
			 end
        else
        	return p1
        end
    end
    return p1
end
function changerunestone(p1,ret,runestonename,runestoneperentage,Attribute)
	local runestonename = tostring(runestonename)
	local runestoneperentage = tostring(runestoneperentage)
	local attribute = tostring(Attribute)
	-- local runestonename = tostring(attackrunestone)
	if p1.runestone >= ret[3] then
        if p1[runestonename] == "nil" then
        	p1[runestonename] = ret[1]
        	p1.runestone = p1.runestone - ret[3]
        	p1[runestoneperentage] = p1[runestoneperentage] + ret[4]
        	-- p1[runstoneclass] = 
        	p1[attribute] = p1[attribute] * (1+p1[runestoneperentage]/100)
        	print("锻造了"..ret[1].."你的装备"..ret[5].."加成：+"..ret[4].."% 你的符文石："..p1.runestone)
        else
        	for m,n in pairs(runestone[2]) do
        		if n[1] == p1[runestonename] then
        			
        			p1.runestone = p1.runestone + n[3]*0.5   			
        			p1[attribute] = p1[attribute] / (1+p1[runestoneperentage]/100)
        			p1[runestoneperentage] = p1[runestoneperentage] - n[4]
                    print("回收"..p1[runestonename].." 符文石：+"..tostring(ret[3]*0.5).." 你的符文石："..p1.runestone)
                end
            end
            p1[runestonename] = ret[1]
            p1.runestone = p1.runestone - ret[3]
        	p1[runestoneperentage] = p1[runestoneperentage] + ret[4]
        	-- p1[runstoneclass] = 
        	p1[attribute] = p1[attribute] * (1+p1[runestoneperentage]/100)
        	print("锻造了"..ret[1].."你的装备"..ret[5].."加成：+"..ret[4].."% 你的符文石："..p1.runestone)
        end
        -- initfun(p1,val)
	else
		print("符文石不足 你的符文石："..p1.runestone)
	end
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
    up= {"入门野怪",1},
    down= {"初级野怪",2},
    left= {"中级野怪",3},
    right= {"高级野怪",4},
    makemoney= {"特级野怪",5},
    autoaddpow = {"自动加蓝量",6},
    autoaddhel = {"自动加血量",7},
    addhel= {"加血量",8},
    addpow= {"加蓝量",9},
    status= {"状态",10},
    equipbar= {"装备栏",11},
    buy= {"购买道具",12},
    buypet= {"购买宠物",13},
    addlife= {"购买复活币",14},
    runforge = {"符文锻造",15},
    numberoftalents= {"天赋树",16},
    quit = {"退出",17}
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
			    	-- if k ~= "mustkill" then
					v[3] = v[3] or ""
					print(string.format("%2d",v[2])..": "..v[1].." 消耗: "..string.format("%3d",v[3]).." 蓝量".." 造成: "..v[3].." 点魔法伤害")
				 --    else
					-- print(string.format("%2d",v[2])..": "..v[1].." 消耗: "..string.format("%3d",v[3]).." 蓝量".." 功能: 直接秒杀怪物")
			  --       end
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
        if tonumber(num) == v[1] then
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
	num,_ret = inputNum2(game)
	while num == nil or _ret == nil do
		print '输入无效，请再次输入(要输入提供的数字选择哦): '
		num,_ret = inputNum2(game)
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
	        	p.addhel(p1)
	        	print("你的血量："..p1.health.."/"..inithealth(self,article))
	        elseif ret == "状态" then
	        	status(self,p1)
	        elseif ret == "装备栏" then
	        	equipbar(self,p1)
	        elseif ret == "购买道具" then
	        	shopping(p1,game,article,shoppingflag)
	        elseif ret == "购买宠物" then
	        	buypet(p1)
	        elseif ret == "加蓝量" then
	        	p.addpow(p1)
	        	print("你的蓝量："..p1.power.."/"..initpower(self))
	        elseif ret == "自动加蓝量" then
	            p.autoaddpow(p1)
	            print("你的蓝量："..p1.power.."/"..initpower(self))
	        elseif ret == "自动加血量" then
	            p.autoaddhel(p1)
	            print("你的血量："..p1.health.."/"..inithealth(self,article))
	        elseif ret == "购买复活币" then
	        	p1 =p.addlife(p1)
	        	print("你的剩余复活币："..p1.lifegold)
	        elseif ret == "符文锻造" then
	        	p1 =RunForge(p1)
	        	-- print("你的剩余复活币："..p1.lifegold)
	        elseif ret == "天赋树" then
	        	p1,talpoint =numberOfTalents(p1,talpoint,addpoint)
	        	-- p1.talpoint = talpoint	        	
	        end
			if ret == "入门野怪" then
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
	               fight(self,p1,XiaoYan,adjust)
	            else
	            	-- print("====没有遇到怪物 下次可就没这么好运了====")
	               fight(self,p1,XiaoYan,adjust)
	            end
	        elseif ret == "初级野怪" then
				local num = math.random(6)
				if num == 1 then
	               fight(self,p1,Goblin,adjust)
	            elseif num == 2 then
	               print("====遇到可怜的乞丐给了他一些钱 💰:-10====")
	               p1.gold = p1.gold - 10 > 0 and p1.gold - 10 or 0
	            elseif num == 3 then
	               fight(self,p1,Goblin,adjust)
	            elseif num == 4 then
	               print("====打家劫舍抢得金钱 💰:+20====")
	               p1.gold = p1.gold + 20
	            elseif num == 5 then
	                fight(self,p1,BearTwo,adjust)
	              
	            else
	            	-- print("====没有遇到怪物 下次可就没这么好运了====")
	            	fight(self,p1,BearTwo,adjust)
	            end
	        elseif ret == "中级野怪" then
				local num = math.random(6)
				if num == 1 then
	               fight(self,p1,LittleBeast,adjust)
	            elseif num == 2 then
	               print("====和好友喝酒心情大好 蓝量:+20====")
	               p1.gold = p1.gold + 10  
	            elseif num == 3 then
	               fight(self,p1,Ganunu,adjust)
	            elseif num == 4 then
	               print("====走路不小心掉到井盖里 血量:-20====")
	               p1.health = p1.health - 20 > 0 and p1.health - 20 or 1   
	            elseif num == 5 then
	               fight(self,p1,LittleBeast,adjust)
	              
	            else
	            	-- print("====没有遇到怪物 下次可就没这么好运了====")
	            	print("====在路上被☄️ 攻击 血量：-10====")
	            	p1.health = p1.health - 10 > 0 and p1.health - 10 or 1
	            end
	        elseif ret == "高级野怪" then
				local num = math.random(6)
				if num == 1 then
	               fight(self,p1,YuanZun,adjust)
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
	               fight(self,p1,YuanZun,adjust)
	            elseif num == 4 then
	                print("====真是踩到狗屎了捡到大宝箱💰++====")
	                for i=1,10 do
	               	print("====金币:+10====")
	                p1.gold = p1.gold + 10
	                end  
	            elseif num == 5 then
	               fight(self,p1,Cthulhu,adjust)
	               
	            else
	            	fight(self,p1,Cthulhu,adjust)
	            	-- print("====没有遇到怪物 下次可就没这么好运了====")
	            end
	        elseif ret == "特级野怪" then

				local num = math.random(5)
				if num == 1 then
	               fight(self,p1,Caikunxu,adjust)
	               
	            elseif num == 2 then
	               fight(self,p1,Sentenced,adjust)
	               
	            elseif num == 3 then
	               fight(self,p1,Caikunxu,adjust)
	               
	            elseif num == 4 then
	               fight(self,p1,Sentenced,adjust)
	               
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
			    while true do
				    if inputlife == "1" or inputlife == "2" then
			        	break
			        else
			        	print("====你的输入有误====请重新输入: 1.是,2.否(直接输入数字即可）")
			        	inputlife = io.read()
			        end
			    end
			            if inputlife == "1" then
						    -- os.execute("touch "..os.getenv("HOME").."/Desktop/savegame.lua")
						        p2 = {}
								file = io.open(os.getenv("HOME").."/Library/Accounts/savegame.lua","w")
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
									        for m,n in ipairs(talpoint[2])do
									        	for i,j in ipairs(n) do
									        		p2[32] = p2[32]..tostring(j).."|"
					
									        	end
									        end
									        p2[32] = p2[32].."]"
									        p1.talpoint = p2[32]

									elseif k == "armorpenetrate" then
								        p2[33] = v
								    elseif k == "magicpenetrate" then
								        p2[34] = v
								    elseif k == "armorpenetratepercentage" then
								        p2[35] = v
								    elseif k == "magicpenetratepercentage" then
								        p2[36] = v
								    elseif k == "critpercentage" then
								        p2[37] = v
								    elseif k == "critdamage" then
								        p2[38] = v
								    elseif k == "armorpenetratename1" then
								        p2[39] = v
								    elseif k == "armorpenetratename2" then
								        p2[40] = v
								    elseif k == "magicpenetratename1" then
								        p2[41] = v
								    elseif k == "magicpenetratename2" then
								        p2[42] = v
								    elseif k == "armorpenetratepercentagename1" then
								        p2[43] = v							        
								    elseif k == "armorpenetratepercentagename2" then
								        p2[44] = v
								    elseif k == "magicpenetratepercentagename1" then
								        p2[45] = v
								    elseif k == "magicpenetratepercentagename2" then
								        p2[46] = v
								    elseif k == "critpercentagename1" then
								        p2[47] = v
								    elseif k == "critpercentagename2" then
								        p2[48] = v
								    elseif k == "critdamagename1" then
								        p2[49] = v
								    elseif k == "critdamagename2" then
								        p2[50] = v
								    elseif k == "petname" then
								        p2[51] = v
								    elseif k == "runestone" then
								        p2[52] = v
								    elseif k == "attackaddpercentage" then
								        p2[53] = v
								    elseif k == "armoraddpercentage" then
								        p2[54] = v
								    elseif k == "magicresistanceaddpercentage" then
								        p2[55] = v
								    elseif k == "speedaddpercentage" then
								        p2[56] = v
								    elseif k == "attackrunestone" then
								        p2[57] = v
								    elseif k == "armorrunestone" then
								        p2[58] = v
								    elseif k == "magicresistancerunestone" then
								        p2[59] = v
								    elseif k == "speedrunestone" then
								        p2[60] = v
								    else

								    end
--attackaddpercentage armoraddpercentage = 0,magicresistanceaddpercentage = 0,speedaddpercentage = 0,attackrunestone = "nil",armorrunestone = "nil",magicresistancerunestone = "nil",								    end
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
			            	os.execute("rm -r -f "..os.getenv("HOME").."/Library/Accounts/savegame.lua")
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
	-- /private/etc. os.getenv("HOME"). /Users/swqt/Library/Accounts
	os.execute("touch "..os.getenv("HOME").."/Library/Accounts/savegame.lua")
	file = io.open(os.getenv("HOME").."/Library/Accounts/savegame.lua","r")
	file1 = file:read("*a")
	if file1 == "" or nil then
		file:close()
		print("======取一个有个性的名字吧(不想取名的话直接按回车开始)======")
		local changename = io.read()
		print("====取一个有个性的表情吧 例如:*_*(不想取的话直接按回车开始)====")
		local emojochange = io.read()
		if emojochange == "" then
			emojochange = nil
		end
		local p = person.change(p,changename,nil,nil,nil,emojochange)
		-- local p = person.change(p,changename)
		move1(p,p,game,article,adjust,talpoint,addpoint)
    else
    	
	    	print("====你有已经保存的记录====是否继续: 1.是,2.否(直接输入数字即可）")
	        local inputlife = io.read()
	    while true do    
	        if inputlife == "1" or inputlife == "2" then
	        	break
	        else
	        	print("====你的输入有误====请重新输入: 1.是,2.否(直接输入数字即可）")
	        	inputlife = io.read()
	        end
        end

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
					    print(v)
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
				  pload.armorpenetrate = tonumber(pcopy[33])
				  pload.magicpenetrate = tonumber(pcopy[34])
				  pload.armorpenetratepercentage = tonumber(pcopy[35])
				  pload.magicpenetratepercentage = tonumber(pcopy[36])
				  pload.critpercentage = tonumber(pcopy[37])
				  pload.critdamage = tonumber(pcopy[38])
                  pload.armorpenetratename1 = tostring(pcopy[39]) == "" and "nil" or tostring(pcopy[39])
                  pload.armorpenetratename2 = tostring(pcopy[40]) == "" and "nil" or tostring(pcopy[40])
                  pload.magicpenetratename1 = tostring(pcopy[41]) == "" and "nil" or tostring(pcopy[41])
                  pload.magicpenetratename2 = tostring(pcopy[42]) == "" and "nil" or tostring(pcopy[42])
                  pload.armorpenetratepercentagename1 = tostring(pcopy[43]) == "" and "nil" or tostring(pcopy[43])
                  pload.armorpenetratepercentagename2 = tostring(pcopy[44]) == "" and "nil" or tostring(pcopy[44])
                  pload.magicpenetratepercentagename1 = tostring(pcopy[45]) == "" and "nil" or tostring(pcopy[45])
                  pload.magicpenetratepercentagename2 = tostring(pcopy[46]) == "" and "nil" or tostring(pcopy[46])
                  pload.critpercentagename1 = tostring(pcopy[47]) == "" and "nil" or tostring(pcopy[47])
                  pload.critpercentagename2 = tostring(pcopy[48]) == "" and "nil" or tostring(pcopy[48])
                  pload.critdamagename1 = tostring(pcopy[49]) == "" and "nil" or tostring(pcopy[49])
                  pload.critdamagename2 = tostring(pcopy[50]) == "" and "nil" or tostring(pcopy[50])
                  pload.petname = tostring(pcopy[51]) == "" and "nil" or tostring(pcopy[51])
                  pload.runestone = tonumber(pcopy[52])
                  pload.attackaddpercentage = tonumber(pcopy[53])
                  pload.armoraddpercentage = tonumber(pcopy[54])
                  pload.magicresistanceaddpercentage = tonumber(pcopy[55])
                  pload.speedaddpercentage = tonumber(pcopy[56])
                  pload.attackrunestone = tostring(pcopy[57])
                  pload.armorrunestone = tostring(pcopy[58])
                  pload.magicresistancerunestone = tostring(pcopy[59])
                  pload.speedrunestone = tostring(pcopy[60])
		        end


               file:close()
    	         	       
	        move1(pload,pload,game,article,adjust,talpoint,addpoint)
	    else
            file:close()
			print("======取一个有个性的名字吧(不想取名的话直接按回车开始)======")
			local changename = io.read()
			print("====取一个有个性的表情吧 例如:*_*(不想取的话直接按回车开始)====")
			local emojochange = io.read()
			if emojochange == "" then
				emojochange = nil
		    end
			local p = person.change(p,changename,nil,nil,nil,emojochange)
			-- local p = person.change(p,changename)
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

























































