-- module("mymath2", package.seeall)
--老方法尽量不用
mymath2 = {}

function mymath2.add(a,b)
   print(a+b)
end

function mymath2.sub(a,b)
   print(a-b)
end

function mymath2.mul(a,b)
   print(a*b)
end

function mymath2.div(a,b)
   print(a/b)
end

--有了return 表才能改名字
return mymath2