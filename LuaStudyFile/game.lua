-- 比如模块内函数之间的调用仍然要保留模块名的限定符，如果是私有变量还需要加local关键字，同时不能加模块名限定符。
-- 如果需要将私有改为公有，或者反之，都需要一定的修改。那又该如何规避这些问题呢？我们可以通过Lua的函数“全局环境”来有效的解决这些问题。
-- 我们把game.lua这个模块里的全局环境设置为M，于是，我们直接定义函数的时候，不需要再带M前缀。
-- 因为此时的全局环境就是M，不带前缀去定义变量，就是全局变量，这时的全局变量是保存在M里。
-- 所以，实际上，play和quit函数仍然是在M这个table里。
-- module(...,package.seeall)
-- function play()
-- 	print("begain")
-- end
-- function quit()
-- 	print("you just go")
-- end


local M = {}
local modelName = ...
_G[modelName] = M
-- package.loaded[modname] = M
-- setfenv(1, M)
function M.play()
    print("那么，开始吧")
end
function M.quit()
    print("你走吧，我保证你不会出事的，呵，呵呵")
end
return M


















