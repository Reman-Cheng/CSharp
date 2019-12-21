-- 文件名为 mymodule.lua
-- 定义一个名为 mymodule 的模块
mod = {}
 
-- 定义一个常量
mod.constant = "这是一个常量"
 
-- 定义一个函数
function mod.func1()
    io.write("这是一个公有函数！\n")
end

function foo(x)
	print(x)
end

local function func2()
    print("这是一个私有函数！")
end
-- func2 声明为程序块的局部变量，即表示一个私有函数，因此是不能从外部访问模块里的这个私有函数，必须通过模块里的公有函数来调用. 
function mod.func3()
    func2()
end
 
return mod

--  test.lua 文件末尾注释--  module.lua 文件末尾注释--module


-- test.lua
--wangquantest.lua
-- test.lua
--wangquantest.lua
-- test.lua
--wangquantest.lua
