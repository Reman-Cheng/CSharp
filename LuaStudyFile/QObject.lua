--===Lua 面向对象===--


-- ==面向对象特征
-- 1） 封装：指能够把一个实体的信息、功能、响应都装入一个单独的对象中的特性。
-- 2） 继承：继承的方法允许在不改动原程序的基础上对其进行扩充，这样使得原功能得以保存，而新功能也得以扩展。这有利于减少重复编码，提高软件的开发效率。
-- 3） 多态：同一操作作用于不同的对象，可以有不同的解释，产生不同的执行结果。在运行时，可以通过指向基类的指针，来调用实现派生类中的方法。
-- 4）抽象：抽象(Abstraction)是简化复杂的现实问题的途径，它可以为具体问题找到最恰当的类定义，并且可以在最恰当的继承级别解释问题。


--==Lua 中面向对象
-- 我们知道，对象由属性和方法组成。LUA中最基本的结构是table，所以需要用table来描述对象的属性。

-- lua中的function可以用来表示方法。那么LUA中的类可以通过table + function模拟出来。

-- 至于继承，可以通过metetable模拟出来（不推荐用，只模拟最基本的对象大部分时间够用了）。

-- Lua中的表不仅在某种意义上是一种对象。像对象一样，表也有状态（成员变量）；
-- 也有与对象的值独立的本性，特别是拥有两个不同值的对象（table）代表两个不同的对象；
-- 一个对象在不同的时候也可以有不同的值，但他始终是一个对象；
-- 与对象类似，表的生命周期与其由什么创建、在哪创建没有关系。对象有他们的成员函数，表也有：


Account = {balance = 0}
function Account.withdraw (v)
    Account.balance = Account.balance - v
    print(Account.balance)
end
-- 这个定义创建了一个新的函数，并且保存在Account对象的withdraw域内，下面我们可以这样调用：
Account.withdraw(100.00)




-- ==一个简单实例
-- 以下简单的类包含了三个属性： area, length 和 breadth，printArea方法用于打印计算结果

-- Meta class
Rectangle = {area = 0, length = 0, breadth = 0}

-- 派生类的方法 new
function Rectangle:new (o,length,breadth)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.length = length or 0
  self.breadth = breadth or 0
  self.area = length*breadth;
  return o
end

-- 派生类的方法 printArea
function Rectangle:printArea ()
  print("矩形面积为",self.area)
end
-- 创建对象. 创建对象是为类的实例分配内存的过程。每个类都有属于自己的内存并共享公共数据。
r = Rectangle:new(nil,10,20)
-- 访问属性 我们可以使用点号(.)来访问类的属性：
print(r.length)
-- 访问成员函数.  我们可以使用冒号:来访问类的成员函数：
r:printArea()


-- 以下我们演示了 Lua 面向对象的完整实例：
-- Meta class
Shape = {area = 0}

-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end

-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end

-- 创建myshape对象
myshape = Shape:new(nil,10)
myshape:printArea()




--==Lua 继承
-- 继承是指一个对象直接使用另一对象的属性和方法。可用于扩展基础类的属性和方法。
-- Meta class
Shape = {area = 0}
-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end
-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end
-- 接下来的实例，Square对象继承了 Shape 类:
Square = Shape:new()
-- Derived class method new
function Square:new (o,side)
  o = o or Shape:new(o,side)
  setmetatable(o, self)
  self.__index = self
  return o
end


--==完整实例
-- 继承了一个简单的类，来扩展派生类的方法，派生类中保留了继承类的成员变量和方法：
-- Meta class
Shape = {area = 0}
-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end
-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end
-- 创建对象
myshape = Shape:new(nil,10)
myshape:printArea()

Square = Shape:new()
-- 派生类方法 new
function Square:new (o,side)
  o = o or Shape:new(o,side)
  setmetatable(o, self)
  self.__index = self
  return o
end

-- 派生类方法 printArea
function Square:printArea ()
  print("正方形面积为 ",self.area)
end

-- 创建对象
mysquare = Square:new(nil,10)
mysquare:printArea()

Rectangle = Shape:new()
-- 派生类方法 new
function Rectangle:new (o,length,breadth)
  o = o or Shape:new(o)
  setmetatable(o, self)
  self.__index = self
  self.area = length * breadth
  return o
end

-- 派生类方法 printArea
function Rectangle:printArea ()
  print("矩形面积为 ",self.area)
end

-- 创建对象
myrectangle = Rectangle:new(nil,10,20)
myrectangle:printArea()


--==函数重写
-- Lua 中我们可以重写基础类的函数
-- 派生类方法 printArea
function Square:printArea ()
  print("正方形面积 ",self.area)
end




Account = {balance = 0}
function Account.withdraw (v)
    Account.balance = Account.balance - v
    print(Account.balance)
end
Account.withdraw(100.00)


-- Meta class
Rectangle = {area = 0, length = 0, breadth = 0}
-- 派生类的方法 new
function Rectangle:new (o,length,breadth)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.length = length or 0
  self.breadth = breadth or 0
  self.area = length*breadth;
  return o
end
-- 派生类的方法 printArea
function Rectangle:printArea ()
  print("矩形面积为 ",self.area)
end



-- Meta class
Shape = {area = 0}
-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end
-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end

-- 创建对象
myshape = Shape:new(nil,10)
myshape:printArea()

Square = Shape:new()
-- 派生类方法 new
function Square:new (o,side)
  o = o or Shape:new(o,side)
  setmetatable(o, self)
  self.__index = self
  return o
end

-- 派生类方法 printArea
function Square:printArea ()
  print("正方形面积为 ",self.area)
end

-- 创建对象
mysquare = Square:new(nil,10)
mysquare:printArea()

Rectangle = Shape:new()
-- 派生类方法 new
function Rectangle:new (o,length,breadth)
  o = o or Shape:new(o)
  setmetatable(o, self)
  self.__index = self
  self.area = length * breadth
  return o
end

-- 派生类方法 printArea
function Rectangle:printArea ()
  print("矩形面积为 ",self.area)
end

-- 创建对象
myrectangle = Rectangle:new(nil,10,20)
myrectangle:printArea()



-- 面向对象编程

local Account = {balance = 0}
function Account.withdraw(v)
    Account.balance = Account.balance - v
end
Account.withdraw(100.00)
print(Account.balance)



function Account.withdraw1(self,v)
  self.balance=self.balance-v
end
-- 此时当调用该方法时，必须指定其作用的对象：
a1=Account
Account=nil
a1.withdraw1(a1,100.00)
print(a1.balance)
-- a2={balance=0,withdraw1=Account.withdraw1}
-- a2.withdraw1(a2,260)
-- Account={balance=0,withdraw2=function(self,v)
--  self.balance=self.balance-v
-- end}

-- function Account:deposit(v)
--  self.balance=self.balance+v
-- end
-- Account.deposit(Account,200.00)
-- Account.withdraw2(100.00)





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



-- 函数闭包
function createCountdownTimer(second)
        local ms = second * 1000  --ms为countDown的Upvalue
        local function countDown()
            ms = ms -1
            return ms
        end
        return countDown
    end

    local timer1 = createCountdownTimer(1) 

    for i = 1, 10 do
        print(timer1()) 
    end



function createTime(second)
        local ms = second * 1000  --ms为countDown的Upvalue
        local function countDown()
            ms = ms -1
            return ms
        end
        return countDown
end

    local time = createTime(1) 

    for i = 1, 10 do
        print(time()) 
    end


local function create2(name,id)
  --data为obj.SetName,obj.GetName,obj.SetId,obj.GetId的Upvalue
  local data = {name = name,id=id}
  local obj = {}
    --把需要隐藏的成员放在一张表里,把该表作为成员函数的upvalue
    function obj.SetName(name)
      data.name=name
    end
    function obj.GetName()
      return data.name
    end
    function obj.SetId(id)
      data.id=id
    end
    function obj.GetId()
      return data.id
    end
    return obj
end
local myCreate = create2("sam",001)
print("myCreate's name:",myCreate:GetName(),"create2's id:",myCreate:GetId())














-- 本初子午线的时间
print(os.date("!%Y%m%d%H%M%S"))



Account={}
function Account:withdraw(self,v)
  self.balance=self.balance-v
  return self.balance
end
local a = {balance=100}
a.withdraw=Account.withdraw
print(a:withdraw(a,300))


Account={}
function Account:withdraw(self,v)
  self.balance=self.balance-v
  return self.balance
end
local a = {balance=100}
print(Account:withdraw(a,300))


-- Lua只需使用冒号，则能隐藏该self参数。
Account={balance=100}
function Account:withdraw(v)
  self.balance=self.balance-v
  return self.balance
end
print(Account:withdraw(300))


Account = {balance=0, 
           withdraw=function(self, v)
           self.balance = self.balance - v
           return self.balance
           end
          }

function Account:deposit(v)
    self.balance = self.balance + v
    return self.balance
end

print(Account.deposit(Account, 200.00))
print(Account:withdraw(100.00))


function fun12()
  if true then 
  print("setmetatable")
  return "string12"
  end
  return "flase"
end
a=fun12()
print(a)

function fun13()
  if true then 
    str = "string12"
  print("setmetatable13")
  return string12 
   end
  return "flase"
end
b=fun13()
print(b)
